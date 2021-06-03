import 'package:get/get.dart';
import 'package:rd_app/data/models/superhero_model.dart';

class DetailController extends GetxController {
  Rx<SuperheroModel> superhero = SuperheroModel(
          id: null,
          name: null,
          slug: null,
          powerstats: null,
          appearance: null,
          biography: null,
          work: null,
          connections: null,
          images: null)
      .obs;

  @override
  void onInit() {
    super.onInit();
    loadOnInit();
  }

  void loadOnInit() {
    var item = Get.arguments as SuperheroModel;

    superhero(item);
  }
}
