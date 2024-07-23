// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:togodo/core/enums/platform_enum.dart';
import 'package:togodo/core/network/firebase/firebase_collections.dart';
import 'package:togodo/data/model/auth/version.dart';
import 'package:togodo/data/remote/firebase/version_manager.dart';

class SplashProvider extends StateNotifier<SplashState> {
  SplashProvider() : super(const SplashState());

  Future<void> checkApplicationVersion(String clientVersion) async {
    final databaseValue = await getVersionNumberFromDatabase();
    if (databaseValue!.number.ext.isNullOrEmpty) {
      state = state.copyWith(isRequiredForceUpdate: true);
      return;
    }

    final checkISNeedForceUpdate = VersionManager(
      deviceValue: clientVersion,
      databaseValue: databaseValue.number!,
    );
    if (checkISNeedForceUpdate.isNeedUpdate()) {
      state = state.copyWith(
        isRequiredForceUpdate: true,
        appStoreId: databaseValue.appStore,
        googlePlayId: databaseValue.googlePlay,
        isRedirectHome: true,
        version: databaseValue.number,
        isWelcomePage: await getIsWelcomePage(),
      );
      return;
    }
    state = state.copyWith(
      isRedirectHome: true,
      isWelcomePage: await getIsWelcomePage(),
    );
  }

  Future<Version?> getVersionNumberFromDatabase() async {
    if (kIsWeb) return null;
    final response = await FirebaseCollections.version.referance
        .withConverter<Version>(
          fromFirestore: (snapshot, options) =>
              Version.fromJson(snapshot.data()!),
          toFirestore: (value, options) {
            return value.toJson();
          },
        )
        .doc(PlatformEnum.versionName)
        .get();
    return response.data();
  }
}

Future<bool> getIsWelcomePage() async {
  final user = FirebaseAuth.instance.currentUser;
  try {
    /* TODO
    // Get a reference to the userSettings collection
    final uid = await CacheItems.firebaseId.readSecureData();

    if (uid == null && user == null) return false;
    final docRef = FirebaseCollections.userSettings.referance.doc(
      user?.uid ?? uid ?? '',
    );
    // Fetch the document
    final docSnap = await docRef.get();

    // Get the isWelcomePage field, or false if it doesn't exist
    final bool isWelcomePage = docSnap.get('isWelcomePage') ?? false;

    return isWelcomePage;*/
    if (user != null) {
      // Get a reference to the userSettings collection
      final docRef = FirebaseCollections.userSettings.referance.doc(user.uid);

      // Fetch the document
      final docSnap = await docRef.get();

      // Get the isWelcomePage field, or false if it doesn't exist
      final bool isWelcomePage = docSnap.get('isWelcomePage') ?? false;

      return isWelcomePage;
    }
    return false;
  } catch (e) {
    return false;
  }
}

class SplashState extends Equatable {
  const SplashState({
    this.isRequiredForceUpdate,
    this.isRedirectHome,
    this.appStoreId,
    this.googlePlayId,
    this.version,
    this.isWelcomePage,
  });

  final bool? isRequiredForceUpdate;
  final bool? isRedirectHome;
  final String? appStoreId;
  final String? googlePlayId;
  final String? version;
  final bool? isWelcomePage;

  @override
  List<Object?> get props => [
        isRequiredForceUpdate,
        isRedirectHome,
        appStoreId,
        googlePlayId,
        version,
        isWelcomePage,
      ];

  SplashState copyWith({
    bool? isRequiredForceUpdate,
    bool? isRedirectHome,
    String? appStoreId,
    String? googlePlayId,
    String? version,
    bool? isWelcomePage,
  }) {
    return SplashState(
      isRequiredForceUpdate:
          isRequiredForceUpdate ?? this.isRequiredForceUpdate,
      isRedirectHome: isRedirectHome ?? this.isRedirectHome,
      appStoreId: appStoreId ?? this.appStoreId,
      googlePlayId: googlePlayId ?? this.googlePlayId,
      version: version ?? this.version,
      isWelcomePage: isWelcomePage ?? this.isWelcomePage,
    );
  }
}
