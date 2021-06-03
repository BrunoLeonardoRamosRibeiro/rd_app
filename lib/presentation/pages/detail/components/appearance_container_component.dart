import 'package:flutter/material.dart';
import 'package:rd_app/data/models/superhero_model.dart';
import 'package:rd_app/presentation/pages/detail/widgets/header_title_widget.dart';
import 'package:rd_app/presentation/pages/detail/widgets/information_item_widget.dart';

class AppearanceContainerComponent extends StatelessWidget {
  final SuperheroModel item;

  AppearanceContainerComponent({@required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          HeaderTitle(title: 'APARÊNCIA'),
          InformationItem(text: 'Gênero: ', itemText: item.appearance.gender ?? ""),
          InformationItem(text: 'Raça: ', itemText: item.appearance.race ?? ""),
          InformationItem(
              text: 'Altura: ', itemText: item.appearance.height[1]?? ""),
          InformationItem(text: 'Peso: ', itemText: item.appearance.weight[1]?? ""),
          InformationItem(
              text: 'Cor dos olhos: ', itemText: item.appearance.eyeColor ?? ""),
          InformationItem(
              text: 'Cor dos cabelos: ', itemText: item.appearance.hairColor ?? ""),
        ],
      ),
    );
  }
}
