import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rd_app/presentation/pages/home/home_controller.dart';

class SelectTypeOfFilterBottomSheetWidget extends StatelessWidget {
  HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      height: 200,
      child: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                width: 40,
                color: Colors.grey[300],
                height: 2,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Selecione o tipo do Filtro',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.green,
                  fontWeight: FontWeight.bold),
            ),
          ),
          InkWell(
            onTap: () {
              controller.typeOfSearch('Male');
              controller.setSuperheroesToDisplay(controller.searchController.value.text);
              Get.back();
            },
            child: Obx(
              () => ListTile(
                title: Text('Masculino'),
                trailing: controller.typeOfSearch.value == 'Male'
                    ? Icon(Icons.check)
                    : SizedBox.shrink(),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              controller.typeOfSearch('Female');
              controller.setSuperheroesToDisplay(controller.searchController.value.text);
              Get.back();
            },
            child: Obx(
              () => ListTile(
                title: Text('Feminino'),
                trailing: controller.typeOfSearch.value == 'Female'
                    ? Icon(Icons.check)
                    : SizedBox.shrink(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
