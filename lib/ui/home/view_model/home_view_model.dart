import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:togodo/core/network/firebase/firebase_collections.dart';
import 'package:togodo/core/notification/local_notification_service.dart';
import 'package:togodo/core/notification/notification_model.dart';
import 'package:togodo/data/model/event/event_model.dart';
import 'package:togodo/data/repository/home_repository.dart';
import 'package:togodo/data/repository/home_repository_impl.dart';
import 'package:togodo/ui/auth/viewmodel/user_view_model.dart';
import 'package:togodo/ui/home/view_model/event_details_view_model.dart';
import 'package:togodo/ui/likes/likes_view_model.dart';
import 'package:togodo/ui/settings/language_settings.dart';

part 'home_view_model.freezed.dart';

final homeViewModelProvider =
    StateNotifierProvider.autoDispose<HomeViewModel, HomeState>(
  HomeViewModel.new,
);

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default([]) List<EventModel> events,
    @Default(false) bool isShimmerShow,
    @Default(false) bool loading,
    @Default(false) bool enableShowcase,
    @Default(false) bool isJoinOpen,
    @Default(0) int forYouIndex,
    @Default(0) int pagination,
  }) = _HomeState;
}

class HomeViewModel extends StateNotifier<HomeState> {
  HomeViewModel(
    this._ref,
  ) : super(const HomeState());
  final Ref _ref;
  bool _isDisposed = false;
  late final HomeRepository _repository = _ref.read(homeRepositoryProvider);
  PreloadPageController forYouController = PreloadPageController(
    keepPage: true,
  );
  Future<void> fetchEvents() async {
    if (_isDisposed) return; // Eğer disposed ise daha fazla ilerleme
    state = state.copyWith(loading: false);
    final result = await _repository.getTimelineEvents(
      pagination: 0,
    );
    if (result.isSuccess) {
      state = state.copyWith(
        events: result.dataOrThrow,
        loading: false,
        isShimmerShow: false,
        pagination: 1,
      );
      /* Future.delayed(
        const Duration(seconds: 2),
        () async {
          await fetchEventsDaily();
          await initLocalNotification();
        },
      );*/
    } else {
      state = state.copyWith(loading: false);
    }
  }

  Future<void> fetchEventsGuest() async {
    if (_isDisposed) return; // Eğer disposed ise daha fazla ilerleme
    state = state.copyWith(loading: true);
    final result = await _repository.getTimelineEventsGuest(
      pagination: 0,
    );
    if (result.isSuccess) {
      state = state.copyWith(
        events: result.dataOrThrow,
        loading: false,
        isShimmerShow: false,
        pagination: 1,
      );
    } else {
      state = state.copyWith(loading: false);
    }
  }

  Future<void> fetchMoreReelsGuest() async {
    if (_isDisposed) return; // Eğer disposed ise daha fazla ilerleme
    if (state.loading) {
      return;
    }
    final result =
        await _repository.getTimelineEventsGuest(pagination: state.pagination);
    if (_isDisposed) return; // Future tamamlandıktan sonra tekrar kontrol edin
    if (result.isSuccess) {
      if (_isDisposed) return; // Her async işlem sonrası tekrar kontrol edin
      final newNews = result.dataOrThrow;
      state = state.copyWith(
        events: [...state.events, ...newNews],
        pagination: state.pagination + 1,
      );
    } else {}
  }

  void addIndex(int index) {
    state = state.copyWith(
      forYouIndex: index,
      isJoinOpen: false,
    );
  }

  void toggleJoin(bool isOpen) {
    state = state.copyWith(isJoinOpen: isOpen);
  }

  Future<void> fetchMoreReels() async {
    if (_isDisposed) return; // Eğer disposed ise daha fazla ilerleme
    if (state.loading) {
      return;
    }
    final result =
        await _repository.getTimelineEvents(pagination: state.pagination);
    if (_isDisposed) return; // Future tamamlandıktan sonra tekrar kontrol edin
    if (result.isSuccess) {
      if (_isDisposed) return; // Her async işlem sonrası tekrar kontrol edin
      final newNews = result.dataOrThrow;
      state = state.copyWith(
        events: [...state.events, ...newNews],
        pagination: state.pagination + 1,
      );
    } else {}
  }

  Future<List<FirebaseNotificationModel>?> initLocalNotification() async {
    if (kIsWeb) return null;
    // Firestore'dan veri alma işlemi
    try {
      final response = await FirebaseCollections.notification.referance.get();

      // Firestore'dan gelen tüm belgeleri işle ve listeye dönüştür
      final notifications = response.docs
          .map(
            (doc) => FirebaseNotificationModel.fromJson(
              doc.data()! as Map<String, dynamic>,
            ),
          )
          .toList();
      final language = _ref.read(languageProvider);
      notifications.map(
        (e) {
          if (e.id != null &&
              e.titleTr != null &&
              e.titleEn != null &&
              e.descTr != null &&
              e.descEn != null &&
              e.day != null &&
              e.hours != null) {
            return NotificationService.instance.showEveryNotification(
              int.parse(e.id!),
              language == 'tr' ? e.titleTr! : e.titleEn!,
              language == 'tr' ? e.descTr! : e.descEn!,
              day: e.day!,
              notificationHours: e.hours!,
            );
          }
        },
      );
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
      return null;
    }
    return null;
  }

  //Bu kod firebase de kullanıcı daha önce showcase gösterimini görmüş mü kontrol ediyor
  Future<void> getEnableShowcase() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final docRef =
            FirebaseFirestore.instance.collection('userSettings').doc(user.uid);
        final docSnap = await docRef.get();
        final enableShowcase =
            docSnap.exists && docSnap.data()?['enableShowcase'] != null
                ? docSnap.get('enableShowcase')
                : true; // enableShowcase yoksa veya null ise true olarak varsay

        state = state.copyWith(enableShowcase: enableShowcase as bool);
      } else {
        // Kullanıcı giriş yapmamışsa, enableShowcase'i true olarak varsay
        state = state.copyWith(enableShowcase: true);
      }
    } catch (e) {
      // Bir hata oluşursa, enableShowcase'i true olarak varsay
      state = state.copyWith(enableShowcase: false);
    }
  }

  Future<void> setEnableShowcase() async {
    final user = FirebaseAuth.instance.currentUser;
    state = state.copyWith(enableShowcase: false);
    if (user != null) {
      final docRef = FirebaseCollections.userSettings.referance.doc(user.uid);
      await docRef.set({'enableShowcase': false}, SetOptions(merge: true));
    }
  }

  void loading() {
    state = state.copyWith(loading: !state.loading);
  }

  void initEvent(EventModel data) {
    state = state.copyWith(
      events: [
        data,
        ...state.events,
      ],
      loading: false,
    );
    moveTop();
  }

  void updateEvent(EventModel updatedData) {
    state = state.copyWith(
      events: state.events.map((event) {
        // Eğer mevcut event, güncellenmesi gereken event'in ID'sine sahipse,
        // güncellenmiş data ile değiştir.
        if (event.id == updatedData.id) {
          return updatedData;
        } else {
          return event;
        }
      }).toList(),
      loading: false,
    );
  }

  void incrementComment(String id) {
    if (_isDisposed) return;

    final update = state.events;
    // `state.events` listesinde `id`'ye göre event'i bulun ve güncelleyin
    final updatedEvents = update.map((event) {
      if (event.id == id) {
        return event.copyWith(
          isClosedComment: !(event.isClosedComment ?? false),
        );
      }
      return event;
    }).toList();

    // Güncellenmiş events listesini state'e aktarın

    state = state.copyWith(events: updatedEvents);
  }

  void incrementLeaveJoinEvent(
    String id,
  ) {
    if (_isDisposed) return;

    final update = state.events;
    // `state.events` listesinde `id`'ye göre event'i bulun ve güncelleyin
    final updatedEvents = update.map((event) {
      if (event.id == id) {
        final profileImageUrl =
            _ref.read(userViewModelProvider).tokenModel!.profileImageUrl;
        final updated = event.joinedUsers
            ?.where(
              (element) => element.imageUrl != profileImageUrl,
            )
            .toList();
        return event.copyWith(
          joinedStatus: false,
          requestStatus: false,
          openToJoinStatus: false,
          joinedUsers: updated,
        );
      }
      return event;
    }).toList();

    // Güncellenmiş events listesini state'e aktarın

    state = state.copyWith(events: updatedEvents);
  }

  void incrementGroupRequest(String id, GroupRequestCreateData requestDetail) {
    if (_isDisposed) return;

    final update = state.events;
    // `state.events` listesinde `id`'ye göre event'i bulun ve güncelleyin
    final updatedEvents = update.map((event) {
      if (event.id == id) {
        return event.copyWith(
          groupRequest: requestDetail.groupRequest,
          eventGroups: requestDetail.eventGroups,
          searching: null,
        );
      }
      return event;
    }).toList();

    // Güncellenmiş events listesini state'e aktarın

    state = state.copyWith(events: updatedEvents);
  }
  void incrementGroupRequestForSearch(String id, ) {
    if (_isDisposed) return;

    final update = state.events;
    // `state.events` listesinde `id`'ye göre event'i bulun ve güncelleyin
    final updatedEvents = update.map((event) {
      if (event.id == id) {
        return event.copyWith(
         searching: true,
        );
      }
      return event;
    }).toList();

    // Güncellenmiş events listesini state'e aktarın

    state = state.copyWith(events: updatedEvents);
  }

  void setDeleteGroupRequest(
    String id,
  ) {
    if (_isDisposed) return;

    final update = state.events;
    // `state.events` listesinde `id`'ye göre event'i bulun ve güncelleyin
    final updatedEvents = update.map((event) {
      if (event.id == id) {
        return event.copyWith(groupRequest: null);
      }
      return event;
    }).toList();

    // Güncellenmiş events listesini state'e aktarın

    state = state.copyWith(events: updatedEvents);
  }

  void incrementNotificationJoinStatus(
    String id, {
    bool openToJoin = false,
  }) {
    final update = state.events;
    // `state.events` listesinde `id`'ye göre event'i bulun ve güncelleyin
    final updatedEvents = update.map((event) {
      if (event.id == id) {
        final profileImageUrl = _ref.read(userViewModelProvider).tokenModel!;
        if (event.joinedUsers!.any(
          (element) => element.imageUrl == profileImageUrl.profileImageUrl,
        )) {
          return event.copyWith();
        }
        return event.copyWith(
          joinedStatus: true,
          joinedUsers: [
            ...event.joinedUsers!,
            JoinedUsers(
              imageUrl: profileImageUrl.profileImageUrl,
              name: profileImageUrl.name,
            ),
          ],
        );
      }
      return event;
    }).toList();

    // Güncellenmiş events listesini state'e aktarın

    state = state.copyWith(events: updatedEvents);
  }

  void incrementJoinEvent(
    String id, {
    bool openToJoin = false,
  }) {
    if (_isDisposed) return;

    final update = state.events;
    // `state.events` listesinde `id`'ye göre event'i bulun ve güncelleyin
    final updatedEvents = update.map((event) {
      if (event.id == id) {
        // `joinedStatus` değerini tersine çevirin
        return !(event.isUserEvent ?? false)
            ? event.copyWith(
                joinedStatus: !(event.joinedStatus ?? false),
                openToJoinStatus: openToJoin,
              )
            : event.copyWith(
                requestStatus: !(event.requestStatus ?? false),
              );
      }
      return event;
    }).toList();

    // Güncellenmiş events listesini state'e aktarın

    state = state.copyWith(events: updatedEvents);
  }

  void incrementLineEvent(
    String id, {
    bool openToJoin = false,
  }) {
    if (_isDisposed) return;

    final update = state.events;
    // `state.events` listesinde `id`'ye göre event'i bulun ve güncelleyin
    final updatedEvents = update.map((event) {
      if (event.id == id) {
        // `joinedStatus` değerini tersine çevirin
        return event.copyWith(
          requestStatus: !(event.requestStatus ?? false),
        );
      }
      return event;
    }).toList();

    // Güncellenmiş events listesini state'e aktarın

    state = state.copyWith(events: updatedEvents);
  }

  Future<void> toggleLike(String id) async {
    // İlk olarak arayüzde değişikliği uygula
    final update = state.events;
    final isLiked = update.firstWhere((event) => event.id == id).likeStatus;
    incrementLike(
      id,
    ); // Bu, state'i güncelleyecek ve arayüzde değişikliği yansıtacak

    // Sonra sunucu isteğini yap
    final result = await (isLiked!
        ? _repository.eventUnlike(id)
        : _repository.eventLike(id));
    await _ref.read(likesViewModelProvider.notifier).fetchEvents();
    // İstek başarısızsa, kullanıcı arayüzünü geri al
    if (!result.isSuccess) {
      incrementLike(id); // Durumu eski haline getir
      // Kullanıcıya hata mesajı göstermek için gerekli işlemler
    }
  }

  void incrementRemoveEvent(String eventId) {
    final updatedEvents = state.events
        .where(
          (event) => event.id != eventId,
        )
        .toList();

    // Güncellenmiş events listesini state'e aktarın
    state = state.copyWith(events: updatedEvents);
  }

  void incrementBlockRemoveEvent(
    String userId,
    bool isEmptyUser,
  ) {
    // Engellenen kullanının eventlerini silmek için
    if (_isDisposed) return;
    // `state.events` listesinde `userId`'ye göre event'i bulun ve silin
    final update = state.events;
    // `state.events` listesinde `id`'ye göre event'i bulun ve güncelleyin
    final updatedEvents = update
        .where(
          (event) => isEmptyUser
              ? event.id != userId
              : event.vendorDetails!.id != userId,
        )
        .toList();

    // Güncellenmiş events listesini state'e aktarın

    state = state.copyWith(events: updatedEvents);
  }

  void incrementLike(String id) {
    if (_isDisposed) return;
    final update = state.events;
    // `state.events` listesinde `id`'ye göre event'i bulun ve güncelleyin
    final updatedEvents = update.map((event) {
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

    // Güncellenmiş events listesini state'e aktarın

    state = state.copyWith(events: updatedEvents);
  }

  Future<bool> eventJoinRequest(
    String id, {
    bool openToJoin = false,
    bool homePage = false,
    bool forLine = false,
  }) {
    if (forLine) {
      incrementLineEvent(id, openToJoin: openToJoin);
    } else {
      incrementJoinEvent(id, openToJoin: openToJoin);
    }

    return _repository
        .eventJoinRequest(id, openToJoin: openToJoin)
        .then((result) {
      result.ifSuccess((data) async {
        if (!homePage) {
          _ref
              .read(eventDetailsViewModelProvider(id).notifier)
              .incrementJoinEvent(id, openToJoinStatus: openToJoin);
        }
      });
      return result.isSuccess;
    });
  }

  Future<bool> removeEvent(String id) {
    incrementRemoveEvent(id);

    return _repository.removeEvent(id).then((result) {
      return result.isSuccess;
    });
  }

  Future<bool> leaveEvent(
    String id, {
    bool homePage = false,
  }) {
    incrementLeaveJoinEvent(
      id,
    );
    if (!homePage) {
      _ref
          .read(eventDetailsViewModelProvider(id).notifier)
          .incrementLeaveJoinEvent(
            id,
          );
    }
    return _repository.leaveEvent(id).then((result) {
      return result.isSuccess;
    });
  }

  Future<void> createGroupRequest(
    String id, {
    bool homePage = false,
  }) {
    if (!homePage) {
      incrementGroupRequestForSearch(
        id,
      );
      _ref
          .read(eventDetailsViewModelProvider(id).notifier)
          .incrementGroupRequestForSearch(
        id,
      );
    } else {
      incrementGroupRequestForSearch(
        id,
      );
    }
    return _repository.createGroupRequest(id).then((result) {
      if (!homePage) {
        incrementGroupRequest(
          id,
          result.dataOrThrow,
        );
        _ref
            .read(eventDetailsViewModelProvider(id).notifier)
            .incrementGroupRequest(
              id,
              result.dataOrThrow,
            );
      } else {
        incrementGroupRequest(
          id,
          result.dataOrThrow,
        );
      }
      incrementJoinEvent(id, openToJoin: false);
      _ref
          .read(eventDetailsViewModelProvider(id).notifier)
          .incrementJoinEvent(id, openToJoinStatus: false);
      return result.isSuccess;
    });
  }

  Future<void> deleteGroupRequest(
    String id, {
    bool homePage = false,
  }) {
    return _repository.deleteGroupRequest(id).then((result) {
      if (!homePage) {
        setDeleteGroupRequest(
          id,
        );
        _ref
            .read(eventDetailsViewModelProvider(id).notifier)
            .setDeleteGroupRequest(
              id,
            );
      } else {
        setDeleteGroupRequest(
          id,
        );
      }
      return result.isSuccess;
    });
  }

  Future<bool> updateCommentPrivacy(String id) {
    incrementComment(id);
    return _repository.updateCommentPrivacy(id).then((result) {
      return result.isSuccess;
    });
  }

  Future<bool> eventRemoveJoinRequest(String id, {bool homePage = true}) {
    incremenRemoveJoinRequest(id);

    return _repository.eventRemoveJoinRequest(id).then((result) {
      result.ifSuccess((data) async {
        if (_isDisposed) return;
        if (!homePage) {
          _ref
              .read(eventDetailsViewModelProvider(id).notifier)
              .incrementJoinEvent(
                id,
              );
        }
      });
      return result.isSuccess;
    });
  }

  void incremenRemoveJoinRequest(
    String id,
  ) {
    if (_isDisposed) return;

    final update = state.events;
    // `state.events` listesinde `id`'ye göre event'i bulun ve güncelleyin
    final updatedEvents = update.map((event) {
      if (event.id == id) {
        // `joinedStatus` değerini tersine çevirin
        return event.copyWith(requestStatus: !(event.requestStatus ?? false));
      }
      return event;
    }).toList();

    // Güncellenmiş events listesini state'e aktarın

    state = state.copyWith(events: updatedEvents);
  }

  Future<bool> updateApplauseCount(int applauseCount) {
    return _repository.updateApplauseCount(applauseCount).then((result) {
      result.ifSuccess((data) async {
        if (_isDisposed) return;
      });
      return result.isSuccess;
    });
  }

  Future<bool> createEventRating(
    String eventId,
    double rating,
    String description,
  ) {
    return _repository
        .createEventRating(eventId, rating, description)
        .then((result) {
      result.ifSuccess((data) async {});
      return result.isSuccess;
    });
  }

  void moveTop() {
    forYouController.animateToPage(
      0,
      duration: const Duration(
        milliseconds: 200,
      ),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _isDisposed = true;
    forYouController.dispose();
    super.dispose();
  }
}
