import '../models/wallpaper.dart';
import '../services/rest_api_services.dart';
import '../utils/constants/const.dart';
import 'base_controller.dart';

class HomeController extends BaseController {
  final RestApiService _restApiService = RestApiService();
  List<Wallpaper> todaysList = [];
  List<Wallpaper> popularList = [];
  List<Wallpaper> oldestList = [];

  Future<void> getListOfToday() async {
    List<dynamic> resultList =
        await _restApiService.convertJsonToObject("$api&${1}");
    todaysList = resultList.cast<Wallpaper>();
  }

  Future<void> getListOfPopular() async {
    List<dynamic> resultList =
        await _restApiService.convertJsonToObject("$api&${1}&order_by=popular");
    popularList = resultList.cast<Wallpaper>();
  }

  Future<void> getlistoftop() async {
    List<dynamic> resultList = await _restApiService
        .convertJsonToObject("$api&${1}&order_by = downloads");
    resultList = resultList.cast<Wallpaper>();
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
