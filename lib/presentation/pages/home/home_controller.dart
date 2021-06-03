import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rd_app/data/models/superhero_model.dart';
import 'package:rd_app/domain/usecases/get_all_usecase.dart';
import 'package:rd_app/domain/usecases/random_superhero_usecase.dart';
import 'package:rd_app/domain/usecases/search_by_name_usecase.dart';
import 'package:rd_app/presentation/pages/home/components/select_type_of_filter_bottom_sheet_widget.dart';
import 'package:rd_app/presentation/routes/routes.dart';

class HomeController extends GetxController {
  GetAllUsecase getAll = Get.find<GetAllUsecase>();
  SearchByNameUsecase searchByName = Get.find<SearchByNameUsecase>();
  RandomSuperheroUsecase randomSuperhero = Get.find<RandomSuperheroUsecase>();

  Rx<TextEditingController> searchController = TextEditingController().obs;

  RxBool showLoading = false.obs;

  RxList<SuperheroModel> superheroes = RxList<SuperheroModel>();

  RxList<SuperheroModel> superheroesToDisplay = RxList<SuperheroModel>();

  RxString typeOfSearch = RxString('Male');

  @override
  void onInit() {
    super.onInit();
    loadOnInit();
  }

  void loadOnInit() async {
    showLoading(true);

    searchController.value = TextEditingController(text: "");

    var result = await getAll();

    result.fold((failure) {
      showLoading(false);
      print(failure);
    }, (items) {
      showLoading(false);
      superheroes(items);
    });

    setSuperheroesToDisplay(searchController.value.text);
  }

  void setSuperheroesToDisplay(String text) async {
    showLoading(true);
    var newItems = await searchByName(
        items: superheroes.toList(), name: text, gender: typeOfSearch.value);

    superheroesToDisplay(newItems);
    showLoading(false);
    update();
  }

  @override
  void onClose() {
    searchController.close();
    super.onClose();
  }

  void onSelectFilterButtonClick() {
    Get.bottomSheet(SelectTypeOfFilterBottomSheetWidget());
  }

  void onSuperheroClick(SuperheroModel item) {
    Get.toNamed(Routes.ROUTE_DETAIL, arguments: item);
  }

  void onRandomSuperheroButtonClick() async {
    SuperheroModel item = await randomSuperhero(items: superheroes.value);

    Get.toNamed(Routes.ROUTE_DETAIL, arguments: item);
  }
}
