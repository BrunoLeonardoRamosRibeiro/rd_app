import 'package:flutter/material.dart';
import 'package:rd_app/data/models/superhero_model.dart';
import 'package:rd_app/presentation/pages/detail/widgets/header_title_widget.dart';
import 'package:rd_app/presentation/pages/detail/widgets/information_item_widget.dart';

class WorkContainerComponent extends StatelessWidget {
  final SuperheroModel item;

  WorkContainerComponent({@required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          HeaderTitle(title: 'TRABALHO'),
          InformationItem(text: 'Ocupação: ', itemText: item.work.occupation ?? ""),
          InformationItem(text: 'Base: ', itemText: item.work.base ?? ""),
        ],
      ),
    );
  }
}
