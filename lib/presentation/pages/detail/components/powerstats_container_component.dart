import 'package:flutter/material.dart';
import 'package:rd_app/data/models/superhero_model.dart';
import 'package:rd_app/presentation/pages/detail/widgets/header_title_widget.dart';
import 'package:rd_app/presentation/pages/detail/widgets/information_item_widget.dart';

class PowerstatsContainerComponent extends StatelessWidget {
  final SuperheroModel item;

  PowerstatsContainerComponent({@required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          HeaderTitle(title: 'ESTATÍSTICAS DE POTÊNCIA'),
          InformationItem(text: 'Inteligência: ', itemText: item.powerstats.intelligence.toString() ?? ""),
          InformationItem(text: 'Força: ', itemText: item.powerstats.strength.toString() ?? ""),
          InformationItem(text: 'Velocidade: ', itemText: item.powerstats.speed.toString() ?? ""),
          InformationItem(text: 'Durabilidade: ', itemText: item.powerstats.durability.toString() ?? ""),
          InformationItem(text: 'Poder: ', itemText: item.powerstats.power.toString() ?? ""),
          InformationItem(text: 'Combate: ', itemText: item.powerstats.combat.toString() ?? ""),
        ],
      ),
    );
  }
}
