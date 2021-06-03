import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rd_app/presentation/pages/detail/components/appearance_container_component.dart';
import 'package:rd_app/presentation/pages/detail/components/biography_container_component.dart';
import 'package:rd_app/presentation/pages/detail/components/connections_container_component.dart';
import 'package:rd_app/presentation/pages/detail/components/powerstats_container_component.dart';
import 'package:rd_app/presentation/pages/detail/components/work_container_component.dart';
import 'package:rd_app/presentation/pages/detail/detail_controller.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailController>(
        init: DetailController(),
        builder: (controller) {
          var item = controller.superhero.value;

          return Scaffold(
            body: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverAppBar(
                  backgroundColor: Colors.green,
                  expandedHeight: 300,
                  stretch: true,
                  onStretchTrigger: () {
                    return;
                  },
                  stretchTriggerOffset: 200,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text(
                      item.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    centerTitle: true,
                    stretchModes: [
                      StretchMode.zoomBackground,
                      StretchMode.fadeTitle,
                    ],
                    background: Stack(
                      fit: StackFit.expand,
                      children: [
                        Hero(
                          tag: 'tag${item.id}',
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: item.images.sm,
                            placeholder: (context, url) =>
                                CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                        DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment(0.0, 0.5),
                                end: Alignment(0.0, 0.0),
                                colors: <Color>[
                                  Color(0x60000000),
                                  Color(0x00000000),
                                ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    const SizedBox(
                      height: 16,
                    ),
                    BiographyContainerComponent(item: item),
                    Divider(),
                    const SizedBox(
                      height: 16,
                    ),
                    AppearanceContainerComponent(item: item),
                    Divider(),
                    const SizedBox(
                      height: 16,
                    ),
                    WorkContainerComponent(item: item),
                    Divider(),
                    const SizedBox(
                      height: 16,
                    ),
                    ConnectionsContainerComponent(item: item),
                    Divider(),
                    const SizedBox(
                      height: 16,
                    ),
                    PowerstatsContainerComponent(item: item),
                    Divider(),
                  ]),
                ),
              ],
            ),
          );
        });
  }
}
