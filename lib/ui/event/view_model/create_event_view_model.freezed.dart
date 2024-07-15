// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_event_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SelectedAssetsModel {
  int? get index => throw _privateConstructorUsedError;
  String? get networkImage => throw _privateConstructorUsedError;
  File? get localImage => throw _privateConstructorUsedError;
  bool? get isCropped => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SelectedAssetsModelCopyWith<SelectedAssetsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectedAssetsModelCopyWith<$Res> {
  factory $SelectedAssetsModelCopyWith(
          SelectedAssetsModel value, $Res Function(SelectedAssetsModel) then) =
      _$SelectedAssetsModelCopyWithImpl<$Res, SelectedAssetsModel>;
  @useResult
  $Res call(
      {int? index, String? networkImage, File? localImage, bool? isCropped});
}

/// @nodoc
class _$SelectedAssetsModelCopyWithImpl<$Res, $Val extends SelectedAssetsModel>
    implements $SelectedAssetsModelCopyWith<$Res> {
  _$SelectedAssetsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = freezed,
    Object? networkImage = freezed,
    Object? localImage = freezed,
    Object? isCropped = freezed,
  }) {
    return _then(_value.copyWith(
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
      networkImage: freezed == networkImage
          ? _value.networkImage
          : networkImage // ignore: cast_nullable_to_non_nullable
              as String?,
      localImage: freezed == localImage
          ? _value.localImage
          : localImage // ignore: cast_nullable_to_non_nullable
              as File?,
      isCropped: freezed == isCropped
          ? _value.isCropped
          : isCropped // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SelectedAssetsModelImplCopyWith<$Res>
    implements $SelectedAssetsModelCopyWith<$Res> {
  factory _$$SelectedAssetsModelImplCopyWith(_$SelectedAssetsModelImpl value,
          $Res Function(_$SelectedAssetsModelImpl) then) =
      __$$SelectedAssetsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? index, String? networkImage, File? localImage, bool? isCropped});
}

/// @nodoc
class __$$SelectedAssetsModelImplCopyWithImpl<$Res>
    extends _$SelectedAssetsModelCopyWithImpl<$Res, _$SelectedAssetsModelImpl>
    implements _$$SelectedAssetsModelImplCopyWith<$Res> {
  __$$SelectedAssetsModelImplCopyWithImpl(_$SelectedAssetsModelImpl _value,
      $Res Function(_$SelectedAssetsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = freezed,
    Object? networkImage = freezed,
    Object? localImage = freezed,
    Object? isCropped = freezed,
  }) {
    return _then(_$SelectedAssetsModelImpl(
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
      networkImage: freezed == networkImage
          ? _value.networkImage
          : networkImage // ignore: cast_nullable_to_non_nullable
              as String?,
      localImage: freezed == localImage
          ? _value.localImage
          : localImage // ignore: cast_nullable_to_non_nullable
              as File?,
      isCropped: freezed == isCropped
          ? _value.isCropped
          : isCropped // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$SelectedAssetsModelImpl implements _SelectedAssetsModel {
  const _$SelectedAssetsModelImpl(
      {this.index, this.networkImage, this.localImage, this.isCropped});

  @override
  final int? index;
  @override
  final String? networkImage;
  @override
  final File? localImage;
  @override
  final bool? isCropped;

  @override
  String toString() {
    return 'SelectedAssetsModel(index: $index, networkImage: $networkImage, localImage: $localImage, isCropped: $isCropped)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectedAssetsModelImpl &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.networkImage, networkImage) ||
                other.networkImage == networkImage) &&
            (identical(other.localImage, localImage) ||
                other.localImage == localImage) &&
            (identical(other.isCropped, isCropped) ||
                other.isCropped == isCropped));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, index, networkImage, localImage, isCropped);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectedAssetsModelImplCopyWith<_$SelectedAssetsModelImpl> get copyWith =>
      __$$SelectedAssetsModelImplCopyWithImpl<_$SelectedAssetsModelImpl>(
          this, _$identity);
}

abstract class _SelectedAssetsModel implements SelectedAssetsModel {
  const factory _SelectedAssetsModel(
      {final int? index,
      final String? networkImage,
      final File? localImage,
      final bool? isCropped}) = _$SelectedAssetsModelImpl;

  @override
  int? get index;
  @override
  String? get networkImage;
  @override
  File? get localImage;
  @override
  bool? get isCropped;
  @override
  @JsonKey(ignore: true)
  _$$SelectedAssetsModelImplCopyWith<_$SelectedAssetsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CreateEventState {
  bool get loading => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<TagsModel>? get tagList => throw _privateConstructorUsedError;
  List<SelectedAssetsModel>? get selectedAssetsAll =>
      throw _privateConstructorUsedError;
  List<int>? get nullImage => throw _privateConstructorUsedError;
  bool get isLicense => throw _privateConstructorUsedError;
  bool get isJoinUserLimited => throw _privateConstructorUsedError;
  bool get isFree => throw _privateConstructorUsedError;
  bool get isContract => throw _privateConstructorUsedError;
  File? get image => throw _privateConstructorUsedError;
  double get progress => throw _privateConstructorUsedError;
  int get step => throw _privateConstructorUsedError;
  DateTime? get selectedStartDate => throw _privateConstructorUsedError;
  List<ConceptImageModel>? get networkImg => throw _privateConstructorUsedError;
  Users? get otherUserModel => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateEventStateCopyWith<CreateEventState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateEventStateCopyWith<$Res> {
  factory $CreateEventStateCopyWith(
          CreateEventState value, $Res Function(CreateEventState) then) =
      _$CreateEventStateCopyWithImpl<$Res, CreateEventState>;
  @useResult
  $Res call(
      {bool loading,
      String name,
      List<TagsModel>? tagList,
      List<SelectedAssetsModel>? selectedAssetsAll,
      List<int>? nullImage,
      bool isLicense,
      bool isJoinUserLimited,
      bool isFree,
      bool isContract,
      File? image,
      double progress,
      int step,
      DateTime? selectedStartDate,
      List<ConceptImageModel>? networkImg,
      Users? otherUserModel,
      String? url});

  $UsersCopyWith<$Res>? get otherUserModel;
}

/// @nodoc
class _$CreateEventStateCopyWithImpl<$Res, $Val extends CreateEventState>
    implements $CreateEventStateCopyWith<$Res> {
  _$CreateEventStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? name = null,
    Object? tagList = freezed,
    Object? selectedAssetsAll = freezed,
    Object? nullImage = freezed,
    Object? isLicense = null,
    Object? isJoinUserLimited = null,
    Object? isFree = null,
    Object? isContract = null,
    Object? image = freezed,
    Object? progress = null,
    Object? step = null,
    Object? selectedStartDate = freezed,
    Object? networkImg = freezed,
    Object? otherUserModel = freezed,
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      tagList: freezed == tagList
          ? _value.tagList
          : tagList // ignore: cast_nullable_to_non_nullable
              as List<TagsModel>?,
      selectedAssetsAll: freezed == selectedAssetsAll
          ? _value.selectedAssetsAll
          : selectedAssetsAll // ignore: cast_nullable_to_non_nullable
              as List<SelectedAssetsModel>?,
      nullImage: freezed == nullImage
          ? _value.nullImage
          : nullImage // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      isLicense: null == isLicense
          ? _value.isLicense
          : isLicense // ignore: cast_nullable_to_non_nullable
              as bool,
      isJoinUserLimited: null == isJoinUserLimited
          ? _value.isJoinUserLimited
          : isJoinUserLimited // ignore: cast_nullable_to_non_nullable
              as bool,
      isFree: null == isFree
          ? _value.isFree
          : isFree // ignore: cast_nullable_to_non_nullable
              as bool,
      isContract: null == isContract
          ? _value.isContract
          : isContract // ignore: cast_nullable_to_non_nullable
              as bool,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as File?,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
      step: null == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as int,
      selectedStartDate: freezed == selectedStartDate
          ? _value.selectedStartDate
          : selectedStartDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      networkImg: freezed == networkImg
          ? _value.networkImg
          : networkImg // ignore: cast_nullable_to_non_nullable
              as List<ConceptImageModel>?,
      otherUserModel: freezed == otherUserModel
          ? _value.otherUserModel
          : otherUserModel // ignore: cast_nullable_to_non_nullable
              as Users?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UsersCopyWith<$Res>? get otherUserModel {
    if (_value.otherUserModel == null) {
      return null;
    }

    return $UsersCopyWith<$Res>(_value.otherUserModel!, (value) {
      return _then(_value.copyWith(otherUserModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CreateEventStateImplCopyWith<$Res>
    implements $CreateEventStateCopyWith<$Res> {
  factory _$$CreateEventStateImplCopyWith(_$CreateEventStateImpl value,
          $Res Function(_$CreateEventStateImpl) then) =
      __$$CreateEventStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool loading,
      String name,
      List<TagsModel>? tagList,
      List<SelectedAssetsModel>? selectedAssetsAll,
      List<int>? nullImage,
      bool isLicense,
      bool isJoinUserLimited,
      bool isFree,
      bool isContract,
      File? image,
      double progress,
      int step,
      DateTime? selectedStartDate,
      List<ConceptImageModel>? networkImg,
      Users? otherUserModel,
      String? url});

  @override
  $UsersCopyWith<$Res>? get otherUserModel;
}

/// @nodoc
class __$$CreateEventStateImplCopyWithImpl<$Res>
    extends _$CreateEventStateCopyWithImpl<$Res, _$CreateEventStateImpl>
    implements _$$CreateEventStateImplCopyWith<$Res> {
  __$$CreateEventStateImplCopyWithImpl(_$CreateEventStateImpl _value,
      $Res Function(_$CreateEventStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? name = null,
    Object? tagList = freezed,
    Object? selectedAssetsAll = freezed,
    Object? nullImage = freezed,
    Object? isLicense = null,
    Object? isJoinUserLimited = null,
    Object? isFree = null,
    Object? isContract = null,
    Object? image = freezed,
    Object? progress = null,
    Object? step = null,
    Object? selectedStartDate = freezed,
    Object? networkImg = freezed,
    Object? otherUserModel = freezed,
    Object? url = freezed,
  }) {
    return _then(_$CreateEventStateImpl(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      tagList: freezed == tagList
          ? _value._tagList
          : tagList // ignore: cast_nullable_to_non_nullable
              as List<TagsModel>?,
      selectedAssetsAll: freezed == selectedAssetsAll
          ? _value._selectedAssetsAll
          : selectedAssetsAll // ignore: cast_nullable_to_non_nullable
              as List<SelectedAssetsModel>?,
      nullImage: freezed == nullImage
          ? _value._nullImage
          : nullImage // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      isLicense: null == isLicense
          ? _value.isLicense
          : isLicense // ignore: cast_nullable_to_non_nullable
              as bool,
      isJoinUserLimited: null == isJoinUserLimited
          ? _value.isJoinUserLimited
          : isJoinUserLimited // ignore: cast_nullable_to_non_nullable
              as bool,
      isFree: null == isFree
          ? _value.isFree
          : isFree // ignore: cast_nullable_to_non_nullable
              as bool,
      isContract: null == isContract
          ? _value.isContract
          : isContract // ignore: cast_nullable_to_non_nullable
              as bool,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as File?,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
      step: null == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as int,
      selectedStartDate: freezed == selectedStartDate
          ? _value.selectedStartDate
          : selectedStartDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      networkImg: freezed == networkImg
          ? _value._networkImg
          : networkImg // ignore: cast_nullable_to_non_nullable
              as List<ConceptImageModel>?,
      otherUserModel: freezed == otherUserModel
          ? _value.otherUserModel
          : otherUserModel // ignore: cast_nullable_to_non_nullable
              as Users?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CreateEventStateImpl implements _CreateEventState {
  const _$CreateEventStateImpl(
      {this.loading = false,
      this.name = '',
      final List<TagsModel>? tagList = const [],
      final List<SelectedAssetsModel>? selectedAssetsAll = const [],
      final List<int>? nullImage = const [],
      this.isLicense = false,
      this.isJoinUserLimited = true,
      this.isFree = true,
      this.isContract = false,
      this.image = null,
      this.progress = 0.3333,
      this.step = 0,
      this.selectedStartDate = null,
      final List<ConceptImageModel>? networkImg = null,
      this.otherUserModel = null,
      this.url = null})
      : _tagList = tagList,
        _selectedAssetsAll = selectedAssetsAll,
        _nullImage = nullImage,
        _networkImg = networkImg;

  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final String name;
  final List<TagsModel>? _tagList;
  @override
  @JsonKey()
  List<TagsModel>? get tagList {
    final value = _tagList;
    if (value == null) return null;
    if (_tagList is EqualUnmodifiableListView) return _tagList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<SelectedAssetsModel>? _selectedAssetsAll;
  @override
  @JsonKey()
  List<SelectedAssetsModel>? get selectedAssetsAll {
    final value = _selectedAssetsAll;
    if (value == null) return null;
    if (_selectedAssetsAll is EqualUnmodifiableListView)
      return _selectedAssetsAll;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<int>? _nullImage;
  @override
  @JsonKey()
  List<int>? get nullImage {
    final value = _nullImage;
    if (value == null) return null;
    if (_nullImage is EqualUnmodifiableListView) return _nullImage;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final bool isLicense;
  @override
  @JsonKey()
  final bool isJoinUserLimited;
  @override
  @JsonKey()
  final bool isFree;
  @override
  @JsonKey()
  final bool isContract;
  @override
  @JsonKey()
  final File? image;
  @override
  @JsonKey()
  final double progress;
  @override
  @JsonKey()
  final int step;
  @override
  @JsonKey()
  final DateTime? selectedStartDate;
  final List<ConceptImageModel>? _networkImg;
  @override
  @JsonKey()
  List<ConceptImageModel>? get networkImg {
    final value = _networkImg;
    if (value == null) return null;
    if (_networkImg is EqualUnmodifiableListView) return _networkImg;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final Users? otherUserModel;
  @override
  @JsonKey()
  final String? url;

  @override
  String toString() {
    return 'CreateEventState(loading: $loading, name: $name, tagList: $tagList, selectedAssetsAll: $selectedAssetsAll, nullImage: $nullImage, isLicense: $isLicense, isJoinUserLimited: $isJoinUserLimited, isFree: $isFree, isContract: $isContract, image: $image, progress: $progress, step: $step, selectedStartDate: $selectedStartDate, networkImg: $networkImg, otherUserModel: $otherUserModel, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateEventStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._tagList, _tagList) &&
            const DeepCollectionEquality()
                .equals(other._selectedAssetsAll, _selectedAssetsAll) &&
            const DeepCollectionEquality()
                .equals(other._nullImage, _nullImage) &&
            (identical(other.isLicense, isLicense) ||
                other.isLicense == isLicense) &&
            (identical(other.isJoinUserLimited, isJoinUserLimited) ||
                other.isJoinUserLimited == isJoinUserLimited) &&
            (identical(other.isFree, isFree) || other.isFree == isFree) &&
            (identical(other.isContract, isContract) ||
                other.isContract == isContract) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.step, step) || other.step == step) &&
            (identical(other.selectedStartDate, selectedStartDate) ||
                other.selectedStartDate == selectedStartDate) &&
            const DeepCollectionEquality()
                .equals(other._networkImg, _networkImg) &&
            (identical(other.otherUserModel, otherUserModel) ||
                other.otherUserModel == otherUserModel) &&
            (identical(other.url, url) || other.url == url));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      loading,
      name,
      const DeepCollectionEquality().hash(_tagList),
      const DeepCollectionEquality().hash(_selectedAssetsAll),
      const DeepCollectionEquality().hash(_nullImage),
      isLicense,
      isJoinUserLimited,
      isFree,
      isContract,
      image,
      progress,
      step,
      selectedStartDate,
      const DeepCollectionEquality().hash(_networkImg),
      otherUserModel,
      url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateEventStateImplCopyWith<_$CreateEventStateImpl> get copyWith =>
      __$$CreateEventStateImplCopyWithImpl<_$CreateEventStateImpl>(
          this, _$identity);
}

abstract class _CreateEventState implements CreateEventState {
  const factory _CreateEventState(
      {final bool loading,
      final String name,
      final List<TagsModel>? tagList,
      final List<SelectedAssetsModel>? selectedAssetsAll,
      final List<int>? nullImage,
      final bool isLicense,
      final bool isJoinUserLimited,
      final bool isFree,
      final bool isContract,
      final File? image,
      final double progress,
      final int step,
      final DateTime? selectedStartDate,
      final List<ConceptImageModel>? networkImg,
      final Users? otherUserModel,
      final String? url}) = _$CreateEventStateImpl;

  @override
  bool get loading;
  @override
  String get name;
  @override
  List<TagsModel>? get tagList;
  @override
  List<SelectedAssetsModel>? get selectedAssetsAll;
  @override
  List<int>? get nullImage;
  @override
  bool get isLicense;
  @override
  bool get isJoinUserLimited;
  @override
  bool get isFree;
  @override
  bool get isContract;
  @override
  File? get image;
  @override
  double get progress;
  @override
  int get step;
  @override
  DateTime? get selectedStartDate;
  @override
  List<ConceptImageModel>? get networkImg;
  @override
  Users? get otherUserModel;
  @override
  String? get url;
  @override
  @JsonKey(ignore: true)
  _$$CreateEventStateImplCopyWith<_$CreateEventStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
