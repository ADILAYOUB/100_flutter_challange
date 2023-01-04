import '../models/wallpaper.dart';
import '../services/rest_api_services.dart';
import '../utils/constants/const.dart';
import 'base_controller.dart';

class HomeController extends BaseController {
  final RestApiService _restApiService = RestApiService();
  List<Wallpaper> todaysList = [];
  List<Wallpaper> popularList = [];
  List<Wallpaper> topList = [];

  Future<List<Wallpaper>> getListOfWallpapers(String queryParameters) async {
    try {
      List<dynamic> resultList = await _restApiService
          .convertJsonToObject("$api&${1}$queryParameters");
      return resultList.cast<Wallpaper>();
    } catch (error) {
      // Handle error and show appropriate message
      return [];
    }
  }

  Future<void> getAllData() async {
    setState(true);
    const todayQueryParameters = '';
    const popularQueryParameters = '&order_by=popular';
    const topQueryParameters = '&order_by=oldest';

    todaysList = await getListOfWallpapers(todayQueryParameters);
    popularList = await getListOfWallpapers(popularQueryParameters);
    topList = await getListOfWallpapers(topQueryParameters);

    setState(false);
  }

  @override
  void onInit() {
    getAllData();
    super.onInit();
  }
}
