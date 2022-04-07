import 'package:eng/10_WallPaper_Project/controller/base_controller.dart';
import 'package:eng/10_WallPaper_Project/utils/constants/const.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class DownloadController extends BaseController {
  void insertImagePath({String? url, String? path}) async {
    var box = await Hive.openBox<String>(downloadBox);
    box.put(url, path!);
  }
}

class ImageController extends DownloadController {
  Future<void> downloadImage(String url) async {
    var file = await DefaultCacheManager().getSingleFile(url);
    insertImagePath(url: url, path: file.path);
    Get.showSnackbar(const GetSnackBar(
      title: 'Done',
      message: 'Image Download',
      duration: Duration(seconds: 2),
    ));
  }
}
