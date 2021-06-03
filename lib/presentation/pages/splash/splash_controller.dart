import 'package:get/get.dart';
import 'package:rd_app/presentation/routes/routes.dart';

class SplashController extends GetxController {

  @override
  void onReady() {
    super.onReady();
    Future.delayed(Duration(seconds: 4)).then(
          (value) async {

          Get.offNamed(Routes.ROUTE_HOME);

      },
    );
  }

}