import 'package:flutter/material.dart';
import 'package:rd_app/data/models/superhero_model.dart';
import 'package:rd_app/presentation/pages/detail/widgets/header_title_widget.dart';
import 'package:rd_app/presentation/pages/detail/widgets/information_item_widget.dart';

class BiographyContainerComponent extends StatelessWidget {
  final SuperheroModel item;

  BiographyContainerComponent({@required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          HeaderTitle(title: 'BIOGRAFIA'),
          InformationItem(
              text: 'Nome completo: ', itemText: item.biography.fullName ?? ""),
          InformationItem(
              text: 'Alter ego: ', itemText: item.biography.alterEgos ?? ""),
          InformationItem(
              text: 'Apelido: ', itemText: item.biography.aliases[0] ?? ""),
          InformationItem(
              text: 'Local de nascimento: ',
              itemText: item.biography.placeOfBirth ?? ""),
          InformationItem(
              text: 'Primeira aparição: ',
              itemText: item.biography.firstAppearance ?? ""),
          InformationItem(
              text: 'Editora: ', itemText: item.biography.publisher ?? ""),
        ],
      ),
    );
  }
}
