import 'package:flutter/material.dart';
import 'package:rd_app/data/models/superhero_model.dart';
import 'package:rd_app/presentation/pages/detail/widgets/header_title_widget.dart';
import 'package:rd_app/presentation/pages/detail/widgets/information_item_widget.dart';

class ConnectionsContainerComponent extends StatelessWidget {
  final SuperheroModel item;

  ConnectionsContainerComponent({@required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          HeaderTitle(title: 'CONEXÕES'),
          InformationItem(text: 'Afiliação de grupo: ', itemText: item.connections.groupAffiliation ?? ""),
          InformationItem(text: 'Parentes: ', itemText: item.connections.relatives ?? ""),
        ],
      ),
    );
  }
}
