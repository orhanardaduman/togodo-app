// ignore_for_file: avoid_positional_boolean_parameters

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/data/model/event/event_comment_model.dart';
import 'package:togodo/data/model/event/event_details_model.dart';
import 'package:togodo/data/repository/home_repository.dart';
import 'package:togodo/data/repository/home_repository_impl.dart';
import 'package:togodo/ui/auth/viewmodel/user_view_model.dart';
import 'package:togodo/ui/common/welcome.dart';
import 'package:togodo/ui/home/view_model/home_view_model.dart';
import 'package:togodo/ui/likes/likes_view_model.dart';

import '../../../data/model/event/event_model.dart';

part 'event_details_view_model.freezed.dart';

final eventDetailsViewModelProvider = StateNotifierProvider.autoDispose
    .family<EventDetailsViewModel, EventDetailsState, String>(
  EventDetailsViewModel.new,
);

@freezed
class EventDetailsState with _$EventDetailsState {
  const factory EventDetailsState({
    @Default(null) EventDetailsModel? events,
    @Default(false) bool loading,
    @Default(0) int pagination,
    @Default(null)
    EventCommentModel? replyModel, // Eğer yoruma cevap veriliyorsa dolu  olacak
    @Default(false)
    bool
        isReplyComment, // Yoruma mı yorum atılıyor yoksa ana yoruma mı / yoruma yorum ise true
  }) = _EventDetailsState;
}

class EventDetailsViewModel extends StateNotifier<EventDetailsState> {
  EventDetailsViewModel(
    this._ref,
    this.eventId,
  ) : super(const EventDetailsState()) {
    fetchEvents();
  }
  final Ref _ref;
  bool _isDisposed = false;
  String eventId;
  late final HomeRepository _repository = _ref.read(homeRepositoryProvider);
  final FocusNode focusNode = FocusNode();
  Future<void> fetchEvents() async {
    if (_isDisposed) return; // Eğer disposed ise daha fazla ilerleme
    state = state.copyWith(loading: true);
    final userType = _ref.watch(userTypeStateNotifierProvider);

    final result = userType == UserType.guest
        ? await _repository.getEventGuest(
            eventId: eventId,
          )
        : await _repository.getEventDetails(
            eventId: eventId,
          );
    print("tags data : " + result.dataOrThrow.tags.toString());
    if (_isDisposed) return; // Future tamamlandıktan sonra tekrar kontrol edin
    if (result.isSuccess) {
      //  await Future<dynamic>.delayed(const Duration(seconds: 2));
      if (_isDisposed) return; // Her async işlem sonrası tekrar kontrol edin
      state = state.copyWith(
        events: result.dataOrThrow,
        loading: false,
        pagination: 0,
      );
    } else {
      state = state.copyWith(loading: false);
    }
  }

  void changeSort(String? sortText) async {
    print("-------- ${state.events?.id}");
    await _repository.updateEventSort(state.events?.id, sortText);
  }

  void incrementReplyModel(EventCommentModel? model) {
    if (_isDisposed) return;
    state = state.copyWith(
      replyModel: model,
    );
  }

  void incrementIsReplyComment(bool isReply) {
    if (_isDisposed) return;
    state = state.copyWith(
      isReplyComment: isReply,
    );
  }

  Future<bool> eventCommentCreate(String comment) {
    return _repository.eventCommentCreate(eventId, comment).then((result) {
      result.ifSuccess((data) async {
        await fetchEvents();
        if (_isDisposed) return;
      });
      return result.isSuccess;
    });
  }

  void incrementLike(String id) {
    if (_isDisposed) return;
    _ref.read(homeViewModelProvider.notifier).toggleLike(
          id,
        );
    // `state.events` listesinde `id`'ye göre event'i bulun ve güncelleyin
    final updatedEvents = state.events!.copyWith(
      likeStatus: !state.events!.likeStatus!,
      likeCount: state.events!.likeStatus!
          ? state.events!.likeCount! - 1
          : state.events!.likeCount! + 1,
    );
    if (state.events!.likeStatus!) {
      _ref.read(likesViewModelProvider.notifier).removeEvent(id);
    }
    // Güncellenmiş events listesini state'e aktarın
    state = state.copyWith(events: updatedEvents);
  }

  void incrementJoinEvent(
    String id, {
    bool openToJoinStatus = false,
  }) {
    if (_isDisposed) return;

    // `state.events` listesinde `id`'ye göre event'i bulun ve güncelleyin
    final updatedEvents = !(state.events!.isUserEvent ?? false)
        ? state.events!.copyWith(
            joinedStatus: !(state.events!.joinedStatus ?? false),
            openToJoinStatus: openToJoinStatus,
          )
        : state.events!.copyWith(
            requestStatus: !(state.events!.requestStatus ?? false),
          );

    // Güncellenmiş events listesini state'e aktarın
    state = state.copyWith(events: updatedEvents);
  }

  void incrementLeaveJoinEvent(
    String id,
  ) {
    if (_isDisposed) return;

    final update = state.events;
    // `state.events` listesinde `id`'ye göre event'i bulun ve güncelleyin
    final profileImageUrl =
        _ref.read(userViewModelProvider).tokenModel!.profileImageUrl;
    final updated = state.events!.joinedUsers
        ?.where(
          (element) => element.imageUrl != profileImageUrl,
        )
        .toList();
    final updatedEvents = update!.copyWith(
      joinedStatus: false,
      requestStatus: false,
      openToJoinStatus: false,
      joinedUsers: updated,
    );

    // Güncellenmiş events listesini state'e aktarın
    state = state.copyWith(events: updatedEvents);
  }

  void incrementGroupRequest(String id, GroupRequestCreateData requestDetail) {
    if (_isDisposed) return;
    final update = state.events;

    // Güncellenmiş events listesini state'e aktarın

    final updatedEvents = update!.copyWith(
      groupRequest: requestDetail.groupRequest,
      eventGroups: requestDetail.eventGroups,
      searching: null,
    );

    // Güncellenmiş events listesini state'e aktarın
    state = state.copyWith(events: updatedEvents);
  }
  void incrementGroupRequestForSearch(String id, ) {
    if (_isDisposed) return;
    final update = state.events;

    // Güncellenmiş events listesini state'e aktarın

    final updatedEvents = update!.copyWith(
      searching:true,
    );

    // Güncellenmiş events listesini state'e aktarın
    state = state.copyWith(events: updatedEvents);
  }

  void setDeleteGroupRequest(String id) {
    if (_isDisposed) return;
    final update = state.events;

    // Güncellenmiş events listesini state'e aktarın

    final updatedEvents = update!.copyWith(
      groupRequest: null,
    );

    // Güncellenmiş events listesini state'e aktarın
    state = state.copyWith(events: updatedEvents);
  }

  Future<bool> eventJoinRequest(String id) {
    return _repository.eventJoinRequest(id).then((result) {
      result.ifSuccess((data) async {
        if (_isDisposed) return;
        incrementJoinEvent(id);
      });
      return result.isSuccess;
    });
  }

  Future<bool> eventRemoveJoinRequest(String id) {
    return _repository.eventRemoveJoinRequest(id).then((result) {
      result.ifSuccess((data) async {
        if (_isDisposed) return;
        incrementJoinEvent(id);
      });
      return result.isSuccess;
    });
  }

  void incrementMarkStatus(String replyId, bool isMarked) {
    if (_isDisposed) return;

    final updatedEvents = state.events!.copyWith(
      eventComment: state.events!.eventComment!.map((reply) {
        if (reply.id == replyId) {
          return reply.copyWith(isMark: isMarked);
        }
        return reply;
      }).toList(),
    );

    state = state.copyWith(events: updatedEvents);
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

  Future<void> replyLike(String id, String commentId) async {
    // İlk olarak arayüzde değişikliği uygula
    final commentIndex = state.events!.eventComment!
        .indexWhere((event) => event.id == commentId);
    if (commentIndex == -1) return; // Yorum bulunamazsa işlemi durdur

    final replyIndex = state.events!.eventComment![commentIndex].replies!
        .indexWhere((reply) => reply.id == id);
    if (replyIndex == -1) return; // Yanıt bulunamazsa işlemi durdur

    final isLiked = state
        .events!.eventComment![commentIndex].replies![replyIndex].likeStatus!;
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

    final updatedEvents = state.events!.eventComment!.map((event) {
      if (event.id == commentId) {
        final updatedReplies = event.replies!.map((reply) {
          if (reply.id == replyId) {
            return reply.copyWith(
              likeStatus: !isLiked,
              likeCount: isLiked ? reply.likeCount! - 1 : reply.likeCount! + 1,
            );
          }
          return reply;
        }).toList();

        return event.copyWith(replies: updatedReplies);
      }
      return event;
    }).toList();

    state = state.copyWith(
      events: state.events!.copyWith(eventComment: updatedEvents),
    );
  }

  Future<void> toggleCommentLike(String id) async {
    // İlk olarak arayüzde değişikliği uygula
    final isLiked = state.events!.eventComment!
        .firstWhere((event) => event.id == id)
        .likeStatus!;
    incrementCommentLike(
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
      incrementCommentLike(id); // Durumu eski haline getir
      // Kullanıcıya hata mesajı göstermek için gerekli işlemler
    }
  }

  void incrementCommentLike(String id) {
    if (_isDisposed) return;

    // `state.events` listesinde `id`'ye göre event'i bulun ve güncelleyin
    final updatedEvents = state.events!.eventComment!.map((event) {
      if (event.id == id) {
        // `joinedStatus` değerini tersine çevirin
        return event.copyWith(
          likeStatus: !event.likeStatus!,
          likeCount:
              event.likeStatus! ? event.likeCount! - 1 : event.likeCount! + 1,
        );
      }
      return event;
    }).toList();
    state = state.copyWith(
      events: state.events!.copyWith(eventComment: updatedEvents),
    );
  }

  Future<bool> eventCommentRemove(String commentId) {
    incrementCommentRemove(commentId, isReply: false);
    return _repository.eventCommentRemove(commentId: commentId).then((result) {
      result.ifSuccess((data) async {
        if (_isDisposed) return;
      });
      return result.isSuccess;
    });
  }

  Future<bool> eventReplyIdRemove(String replyId) {
    incrementCommentRemove(replyId, isReply: true);
    return _repository.eventCommentRemove(replyId: replyId).then((result) {
      result.ifSuccess((data) async {
        if (_isDisposed) return;
      });
      return result.isSuccess;
    });
  }

  void incrementCommentRemove(String id, {required bool isReply}) {
    if (_isDisposed) return;

    List<EventCommentModel> updatedEvents;
    if (isReply) {
      // Yanıtları filtrele
      updatedEvents = state.events!.eventComment!.map((event) {
        final updatedReplies =
            event.replies?.where((reply) => reply.id != id).toList();
        return event.copyWith(replies: updatedReplies);
      }).toList();
    } else {
      // Yorumları filtrele
      updatedEvents =
          state.events!.eventComment!.where((event) => event.id != id).toList();
    }
    // Güncellenmiş events listesini state'e aktarın
    state = state.copyWith(
      events: state.events!.copyWith(eventComment: updatedEvents),
    );
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
        await fetchEvents();
        if (_isDisposed) return;
      });
      return result.isSuccess;
    });
  }

  @override
  void dispose() {
    _isDisposed = true;
    focusNode.dispose();

    super.dispose();
  }
}
