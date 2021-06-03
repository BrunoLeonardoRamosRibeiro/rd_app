import 'package:get/get.dart';
import 'package:rd_app/presentation/pages/detail/detail_page.dart';
import 'package:rd_app/presentation/pages/home/home_page.dart';
import 'package:rd_app/presentation/pages/splash/splash_page.dart';
import 'package:rd_app/presentation/routes/routes.dart';

class AppPages {
  static List<GetPage> pages = [
    GetPage(
      name: Routes.ROUTE_SPLASH,
      page: () => SplashPage(),
    ),
    GetPage(
      name: Routes.ROUTE_HOME,
      page: () => HomePage(),
    ),
    GetPage(
      name: Routes.ROUTE_DETAIL,
      page: () => DetailPage(),
    ),
  ];
}