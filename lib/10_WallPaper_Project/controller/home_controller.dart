import 'package:eng/10_WallPaper_Project/controller/base_controller.dart';
import 'package:eng/10_WallPaper_Project/models/wallpaper.dart';
import 'package:eng/10_WallPaper_Project/services/rest_api_services.dart';
import 'package:eng/10_WallPaper_Project/utils/constants/const.dart';

class HomeController extends BaseController {
  final RestApiService _restApiService = RestApiService();
  List<Wallpaper> todaysList = [];
  List<Wallpaper> popularList = [];
  List<Wallpaper> oldestList = [];

  Future<void> getListOfToday() async {
    todaysList = await _restApiService.convertJsonToObject(api + "&${1}");
  }

  Future<void> getListOfPopular() async {
    popularList = await _restApiService
        .convertJsonToObject(api + "&${1}&order_by=popular");
  }

  Future<void> getlistoftop() async {
    oldestList = await _restApiService
        .convertJsonToObject(api + "&${1}&order_by=downloads");
  }

  void getllData() async {
    setState(true);
    await getListOfToday();
    await getListOfPopular();
    await getlistoftop();
    setState(false);
  }

  @override
  void onInit() {
    getllData();
    super.onInit();
  }
}
