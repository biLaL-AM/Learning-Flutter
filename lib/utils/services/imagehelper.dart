
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageHelper {
  ImagePicker imagePicker = ImagePicker();
  ImageCropper imageCropper = ImageCropper();

  Future<XFile?> pickImage(ImageSource imageSource, int imageQuality) {
    return imagePicker.pickImage(
        maxWidth: 1920,
        maxHeight: 1080,
        source: imageSource,
        imageQuality: imageQuality);
  }

  Future<CroppedFile?> cropImage(String imagePath) {
    return imageCropper.cropImage(
        sourcePath: imagePath, cropStyle: CropStyle.rectangle);
  }
}