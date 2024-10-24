.PHONY: setup
setup:
	npm install

.PHONY: dependencies
dependencies:
	flutter clean && flutter pub get && cd ios && rm podfile.lock && arch -x86_64 pod install --repo-update
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
	flutter packages pub run build_runner build --delete-conflicting-outputs

.PHONY: run-dev
run-dev:
	flutter run --flavor development --enable-software-rendering --dart-define=FLAVOR=development --target lib/main.dart

.PHONY: run-prd
run-prd:
	flutter run --release --flavor production --enable-software-rendering --dart-define=FLAVOR=production --target lib/main.dart

.PHONY: build-android-dev
build-android-dev:
	flutter build apk --no-tree-shake-icons --flavor development --dart-define=FLAVOR=development --target lib/main.dart

.PHONY: build-android-prd
build-android-prd:
	flutter build appbundle --no-tree-shake-icons --release --flavor production --dart-define=FLAVOR=production --target lib/main.dart

.PHONY: build-ios-dev
build-ios-dev:
	flutter build ios --no-codesign --flavor development --dart-define=FLAVOR=development --target lib/main.dart

.PHONY: build-ios-prd
build-ios-prd:
	flutter build ios --release --no-codesign --flavor production --dart-define=FLAVOR=production --target lib/main.dart

.PHONY: unit-test
unit-test:
	flutter test --coverage --coverage-path=./coverage/lcov.info

.PHONY: codecov
codecov:
	./scripts/codecov.sh ${CODECOV_TOKEN}

