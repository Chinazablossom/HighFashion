import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class ImageController extends GetxController {
  static ImageController get instance => Get.find();

  var imageUrlList = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchImages();
  }

  Future<void> fetchImages() async {
    try {
      firebase_storage.ListResult result = await firebase_storage.FirebaseStorage.instance.ref().listAll();

      List<String> urls = [];
      for (var ref in result.items) {
        String url = await ref.getDownloadURL();
        urls.add(url);
      }

      imageUrlList.assignAll(urls);
    } catch (e) {
      print("Error fetching images: $e");
    }
  }
}
