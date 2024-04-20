import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/core/network/firebase/firebase_collections.dart';
import 'package:togodo/core/notification/notification_model.dart';
import 'package:togodo/data/model/profil/daily_reports_model.dart';
import 'package:togodo/data/model/profil/reports_model.dart';
import 'package:togodo/data/repository/profil_repository.dart';
import 'package:togodo/data/repository/profil_repository_impl.dart';

part 'admin_dashboard_view_model.freezed.dart';

@freezed
class AdminDashboardViewState with _$AdminDashboardViewState {
  const factory AdminDashboardViewState({
    @Default(false) bool loading,
    @Default([]) List<FirebaseNotificationModel>? data,
    @Default([]) List<ReportsModel>? reports,
    @Default(null) DailyReportsModel? dailyReportsModel,
  }) = _AdminDashboardViewState;
}

final adminDashboardViewModelProvider =
    StateNotifierProvider<AdminDashboardViewModel, AdminDashboardViewState>(
  AdminDashboardViewModel.new,
);

class AdminDashboardViewModel extends StateNotifier<AdminDashboardViewState> {
  AdminDashboardViewModel(this._ref)
      : super(
          const AdminDashboardViewState(),
        ) {
    _repository = _ref.read(profilRepositoryProvider);
    fetchDaily();
    getReports();
  }
  TextEditingController titleTrController = TextEditingController();
  TextEditingController titleEnController = TextEditingController();
  TextEditingController descTrController = TextEditingController();
  TextEditingController descEnController = TextEditingController();
  TextEditingController dayController = TextEditingController();
  TextEditingController hoursController = TextEditingController();

  // ignore: unused_field
  final Ref _ref;
  bool _isDisposed = false;
  late final ProfilRepository _repository;
  Future<void> setUserSettings(int selectedDay, int selectedHours) async {
    if (_isDisposed) return;
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // Get a reference to the userSettings collection
      final userSettings = FirebaseCollections.notification.referance;
      final randomId = userSettings.doc().id;
      // Set the document with ID of user's UID
      await userSettings.doc(randomId).set(
            FirebaseNotificationModel(
              id: randomId,
              titleEn: titleEnController.text,
              titleTr: titleTrController.text,
              descEn: descEnController.text,
              descTr: descTrController.text,
              day: selectedDay,
              hours: selectedHours,
              createdAt: DateTime.now(),
            ).toJson(),
          );
    }
  }

  Future<void> fetchDaily() async {
    if (_isDisposed) return;
    state = state.copyWith(loading: true);
    final result = await _repository.getUserCount();
    if (result.isSuccess) {
      if (_isDisposed) return;
      state = state.copyWith(
        dailyReportsModel: result.dataOrThrow,
        loading: false,
      );
    }
  }

  Future<void> getReports() async {
    if (_isDisposed) return;
    state = state.copyWith(loading: true);
    final result = await _repository.getReports();
    if (result.isSuccess) {
      if (_isDisposed) return;
      state = state.copyWith(
        reports: result.dataOrThrow,
        loading: false,
      );
    }
  }

  Future<void> getData() async {
    if (kIsWeb) return;
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

      state = state.copyWith(data: notifications);
    } catch (e) {
      return;
    }
  }

  void incrementDelete(String documentId) {
    state = state.copyWith(
      data: state.data!.where((element) => element.id != documentId).toList(),
    );
  }

  Future<void> deleteDocumentById(String documentId) async {
    try {
      await FirebaseCollections.notification.referance.doc(documentId).delete();
      incrementDelete(documentId);
    } catch (e) {
      if (kDebugMode) {
        print('Error deleting document: $e');
      }
      rethrow; // Hata durumunda bu hatayı dışarı fırlat
    }
  }

  void clear() {
    titleEnController.clear();
    titleTrController.clear();
    descEnController.clear();
    descTrController.clear();
    dayController.clear();
    hoursController.clear();
  }

  @override
  void dispose() {
    clear();
    _isDisposed = true;
    super.dispose();
  }
}
