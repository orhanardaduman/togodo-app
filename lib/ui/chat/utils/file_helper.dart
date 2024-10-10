import 'dart:io';

import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:togodo/core/helpers/colors/colors.dart';

class ImageHandler {
  ImageHandler({
    ImageCropper? imageCropper,
    ImagePicker? imagePicker,
  })  : _imageCropper = imageCropper ?? ImageCropper(),
        _imagepicker = imagePicker ?? ImagePicker();
  final ImagePicker _imagepicker;
  final ImageCropper _imageCropper;

  // ImagePicker
  Future<List<XFile>> pickImage({
    ImageSource source = ImageSource.gallery,
    int imageQualtiy = 100,
    CameraDevice preferredCameraDevice = CameraDevice.front,
    bool selectMultiple = false,
  }) async {
    if (selectMultiple) {
      return _imagepicker.pickMultiImage(imageQuality: imageQualtiy);
    }
    final file = await _imagepicker.pickImage(
      source: source,
      imageQuality: imageQualtiy,
      preferredCameraDevice: preferredCameraDevice,
    );
    if (file != null) return [file];
    return [];
  }

  // ImageCropper
  Future<File?> cropImage({
    required XFile imageFile,
    int compressQuality = 100,
    CropStyle cropStyle = CropStyle.circle,
  }) async {
    final croppedImage = await _imageCropper.cropImage(
      sourcePath: imageFile.path,
      compressQuality: compressQuality,
      uiSettings: [
        IOSUiSettings(),
        AndroidUiSettings(
          statusBarColor: MainColors.black,
          showCropGrid: false,
        ),
      ],
    );
    if (croppedImage == null) return null;
    return File(croppedImage.path);
  }
}
