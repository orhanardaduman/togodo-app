.PHONY: setup
setup:
	npm install

.PHONY: dependencies
dependencies:
	fvm flutter clean && fvm flutter pub get && cd ios && rm podfile.lock && arch -x86_64 pod install --repo-update
.PHONY: pod-ios
pod-ios:
	cd ios && rm podfile.lock && arch -x86_64 pod install --repo-update
.PHONY: analyze
analyze:
	flutter analyze

.PHONY: format 
format:
	flutter format lib/
.PHONY: change-icon
change-icon:
	flutter pub run flutter_launcher_icons:main
.PHONY: o-space
 o-space:
	open ios/Runner.xcworkspace

.PHONY: format-analyze
format-analyze:
	flutter format --dry-run lib/
	flutter analyze

.PHONY: build-runner
build-runner:
	fvm flutter packages pub run build_runner build --delete-conflicting-outputs

.PHONY: run-dev
run-dev:
	fvm flutter run --flavor production --dart-define=FLAVOR=production --target lib/main.dart

.PHONY: run-prd
run-prd:
	fvm flutter run --release --flavor production --enable-software-rendering --dart-define=FLAVOR=production --target lib/main.dart

.PHONY: build-android-dev
build-android-dev:
	fvm flutter build apk --no-tree-shake-icons --flavor development --dart-define=FLAVOR=development --target lib/main.dart

.PHONY: build-android-prd
build-android-prd:
	fvm flutter build appbundle --no-shrink --no-tree-shake-icons --release --flavor production --dart-define=FLAVOR=production --target lib/main.dart

.PHONY: build-ios-dev
build-ios-dev:
	fvm flutter build ios --no-codesign --flavor development --dart-define=FLAVOR=development --target lib/main.dart

.PHONY: build-ios-prd
build-ios-prd:
	fvm flutter build ios --release --no-codesign --flavor production --dart-define=FLAVOR=production --target lib/main.dart

.PHONY: unit-test
unit-test:
	fvm flutter test --coverage --coverage-path=./coverage/lcov.info

.PHONY: codecov
codecov:
	./scripts/codecov.sh ${CODECOV_TOKEN}

