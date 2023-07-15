import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:hive/hive.dart' as hive;
import '../utils/constants/const.dart';
import 'base_controller.dart';

class DownloadController extends BaseController {
  void insertImagePath({String? url, String? path}) async {
    var box = await hive.Hive.openBox<String>(downloadBox);
    box.put(url, path!);
  }
}

class ImageController extends DownloadController {
  Future<void> downloadImage(String url) async {
    // install the latest version of flutter _cache_manager which is
    // compatible with http latest version

    // var file = await DefaultCacheManager().getSingleFile(url);
    // insertImagePath(url: url, path: file.path);
    Get.showSnackbar(const GetSnackBar(
      title: 'Done',
      message: 'Image Download',
      duration: Duration(seconds: 2),
    ));
  }
}
