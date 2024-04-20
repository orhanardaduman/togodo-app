// ignore_for_file: avoid_positional_boolean_parameters

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/data/model/event/event_comment_model.dart';
import 'package:togodo/data/repository/home_repository.dart';
import 'package:togodo/data/repository/home_repository_impl.dart';

part 'comment_view_model.freezed.dart';

final commentViewModelProvider = StateNotifierProvider.family
    .autoDispose<CommentViewModel, CommentState, String>(
  CommentViewModel.new,
);

@freezed
class CommentState with _$CommentState {
  const factory CommentState({
    @Default([]) List<EventCommentModel> datas,
    @Default(false) bool loading,
    @Default(0) int pagination,
  }) = _CommentState;
}

class CommentViewModel extends StateNotifier<CommentState> {
  CommentViewModel(
    this._ref,
    this.eventId,
  ) : super(const CommentState()) {
    fetchComments();
  }
  final Ref _ref;
  bool _isDisposed = false;
  String eventId;
  late final HomeRepository _repository = _ref.read(homeRepositoryProvider);

  Future<void> fetchComments() async {
    if (_isDisposed) return; // Eğer disposed ise daha fazla ilerleme
    state = state.copyWith(loading: true);
    final result = await _repository.getEventComments(
      pagination: 0,
      eventId: eventId,
    );
    if (_isDisposed) return; // Future tamamlandıktan sonra tekrar kontrol edin
    if (result.isSuccess) {
      //  await Future<dynamic>.delayed(const Duration(seconds: 2));
      if (_isDisposed) return; // Her async işlem sonrası tekrar kontrol edin
      state = state.copyWith(
        datas: result.dataOrThrow,
        loading: false,
        pagination: 1,
      );
    } else {
      state = state.copyWith(loading: false);
    }
  }

  Future<void> fetchMoreComments() async {
    if (_isDisposed) return; // Eğer disposed ise daha fazla ilerleme
    if (state.loading) {
      return;
    }
    final result = await _repository.getEventComments(
      pagination: state.pagination,
      eventId: eventId,
    );
    if (_isDisposed) return; // Future tamamlandıktan sonra tekrar kontrol edin
    if (result.isSuccess) {
      if (_isDisposed) return; // Her async işlem sonrası tekrar kontrol edin
      final newNews = result.dataOrThrow;
      state = state.copyWith(
        datas: [...state.datas, ...newNews],
        pagination: state.pagination + 1,
      );
    } else {}
  }

  Future<bool> eventCommentCreate(String comment) {
    return _repository.eventCommentCreate(eventId, comment).then((result) {
      result.ifSuccess((data) async {
        await fetchComments();
        if (_isDisposed) return;
      });
      return result.isSuccess;
    });
  }

  Future<bool> eventCommentRemove(String commentId) {
    incrementRemove(commentId, isReply: false);
    return _repository.eventCommentRemove(commentId: commentId).then((result) {
      result.ifSuccess((data) async {
        if (_isDisposed) return;
      });
      return result.isSuccess;
    });
  }

  void incrementMarkStatus(String replyId, bool isMarked) {
    if (_isDisposed) return;

    final updatedEvents = state.datas.map((event) {
      final updatedReplies = event.replies?.map((reply) {
        if (reply.id == replyId) {
          return reply.copyWith(isMark: isMarked);
        }
        return reply;
      }).toList();

      return event.copyWith(replies: updatedReplies);
    }).toList();

    state = state.copyWith(datas: updatedEvents);
  }

  Future<bool> commentMark(String replyId) {
    incrementMarkStatus(replyId, true); // Yorumu işaretlenmiş olarak işaretle
    return _repository.commentMark(replyId).then((result) {
      result.ifSuccess((data) async {
        if (_isDisposed) return;
      });
      return result.isSuccess;
    });
  }

  Future<bool> commentUnMark(String replyId) {
    incrementMarkStatus(replyId, false); // Yorumun işaretlenmesini kaldır
    return _repository.commentUnMark(replyId).then((result) {
      result.ifSuccess((data) async {
        if (_isDisposed) return;
      });
      return result.isSuccess;
    });
  }

  Future<bool> eventReplyIdRemove(String replyId) {
    incrementRemove(replyId, isReply: true);
    return _repository.eventCommentRemove(replyId: replyId).then((result) {
      result.ifSuccess((data) async {
        if (_isDisposed) return;
      });
      return result.isSuccess;
    });
  }

  void incrementRemove(String id, {required bool isReply}) {
    if (_isDisposed) return;

    List<EventCommentModel> updatedEvents;
    if (isReply) {
      // Yanıtları filtrele
      updatedEvents = state.datas.map((event) {
        final updatedReplies =
            event.replies?.where((reply) => reply.id != id).toList();
        return event.copyWith(replies: updatedReplies);
      }).toList();
    } else {
      // Yorumları filtrele
      updatedEvents = state.datas.where((event) => event.id != id).toList();
    }

    // Güncellenmiş events listesini state'e aktarın
    state = state.copyWith(datas: updatedEvents);
  }

  Future<void> replyLike(String id, String commentId) async {
    // İlk olarak arayüzde değişikliği uygula
    final commentIndex =
        state.datas.indexWhere((event) => event.id == commentId);
    if (commentIndex == -1) return; // Yorum bulunamazsa işlemi durdur

    final replyIndex = state.datas[commentIndex].replies!
        .indexWhere((reply) => reply.id == id);
    if (replyIndex == -1) return; // Yanıt bulunamazsa işlemi durdur

    final isLiked = state.datas[commentIndex].replies![replyIndex].likeStatus!;
    incrementReplyLike(commentId, id, isLiked);

    // Sunucu isteğini yap
    final result = await (isLiked
        ? _repository.removeCommentOrReplyLike(replyId: id)
        : _repository.createCommentOrReplyLike(replyId: id));

    // İstek başarısızsa, kullanıcı arayüzünü geri al
    if (!result.isSuccess) {
      incrementReplyLike(commentId, id, !isLiked);
      // Kullanıcıya hata mesajı göster
    }
  }

  void incrementReplyLike(String commentId, String replyId, bool isLiked) {
    if (_isDisposed) return;

    final updatedEvents = state.datas.map((event) {
      if (event.id == commentId) {
        final updatedReplies = event.replies!.map((reply) {
          if (reply.id == replyId) {
            return reply.copyWith(
              likeStatus: !isLiked,
              likeCount: reply.likeCount! + (isLiked ? -1 : 1),
            );
          }
          return reply;
        }).toList();

        return event.copyWith(replies: updatedReplies);
      }
      return event;
    }).toList();

    state = state.copyWith(datas: updatedEvents);
  }

  Future<void> toggleLike(String id) async {
    // İlk olarak arayüzde değişikliği uygula
    final isLiked =
        state.datas.firstWhere((event) => event.id == id).likeStatus!;
    incrementLike(
      id,
    ); // Bu, state'i güncelleyecek ve arayüzde değişikliği yansıtacak

    // Sonra sunucu isteğini yap
    final result = await (isLiked
        ? _repository.removeCommentOrReplyLike(
            commentId: id,
          )
        : _repository.createCommentOrReplyLike(commentId: id));

    // İstek başarısızsa, kullanıcı arayüzünü geri al
    if (!result.isSuccess) {
      incrementLike(id); // Durumu eski haline getir
      // Kullanıcıya hata mesajı göstermek için gerekli işlemler
    }
  }

  void incrementLike(String id) {
    if (_isDisposed) return;

    // `state.events` listesinde `id`'ye göre event'i bulun ve güncelleyin
    final updatedEvents = state.datas.map((event) {
      if (event.id == id) {
        // `joinedStatus` değerini tersine çevirin
        return event.copyWith(
          likeStatus: !event.likeStatus!,
          likeCount: event.likeCount! + (event.likeStatus! ? -1 : 1),
        );
      }
      return event;
    }).toList();

    // Güncellenmiş events listesini state'e aktarın
    state = state.copyWith(datas: updatedEvents);
  }

  Future<bool> eventCommentCreateReply(
    String comment, {
    String? commentId,
    String? replayId,
  }) {
    return _repository
        .eventCommentCreateReply(commentId, replayId, comment)
        .then((result) {
      result.ifSuccess((data) async {
        await fetchComments();
        if (_isDisposed) return;
      });
      return result.isSuccess;
    });
  }

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }
}
