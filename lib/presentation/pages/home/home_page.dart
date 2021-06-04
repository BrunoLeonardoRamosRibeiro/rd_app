import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rd_app/presentation/global_widgets/custom_text_widget.dart';
import 'package:rd_app/presentation/pages/home/home_controller.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TutorialCoachMark tutorialCoachMark;
  List<TargetFocus> targets = <TargetFocus>[];

  GlobalKey keyButton = GlobalKey();
  GlobalKey keyButton1 = GlobalKey();
  GlobalKey keyButton2 = GlobalKey();

  void initState() {
    initTargets();
    showTutorial();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) =>
          Scaffold(
            appBar: AppBar(
              title: Text('Super-heróis'),
              elevation: 0,
              actions: [
                IconButton(
                  key: keyButton1,
                  onPressed: () {
                    controller.onSelectFilterButtonClick();
                  },
                  icon: Icon(Icons.filter_list_outlined),
                )
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    key: keyButton,
                    padding: const EdgeInsets.all(24.0),
                    child: Obx(
                          () =>
                          CustomTextWidget(
                            controller: controller.searchController.value,
                            labelText: 'Pesquisa [${controller.typeOfSearch
                                .value}]',
                            onChanged: (text) {
                              controller.setSuperheroesToDisplay(text);
                            },
                          ),
                    ),
                  ),
                  Obx(
                        () =>
                        Visibility(
                          visible: controller.showLoading.isFalse,
                          child: GridView.builder(
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3),
                              itemCount: controller.superheroesToDisplay.length,
                              physics: ClampingScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (_, index) {
                                var item = controller
                                    .superheroesToDisplay[index];
                                return FittedBox(
                                  child: Container(
                                    height: 150,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16.0),
                                          child: GestureDetector(
                                            onTap: () {
                                              controller.onSuperheroClick(item);
                                            },
                                            child: Container(
                                              height: 70,
                                              width: 70,
                                              child: CachedNetworkImage(
                                                imageUrl: item.images.xs,
                                                imageBuilder:
                                                    (context, imageProvider) =>
                                                    Hero(
                                                        tag: 'tag${item.id}',
                                                        child: CircleAvatar(
                                                          backgroundImage:
                                                          imageProvider,
                                                        )),
                                                placeholder: (context, url) =>
                                                    CircularProgressIndicator(),
                                                errorWidget: (context, url,
                                                    error) =>
                                                    Icon(Icons.error),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          item.name,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                        Text(
                                          item.biography.fullName,
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              key: keyButton2,
              tooltip: 'Busca aleatoriamente',
              onPressed: () {
                controller.onRandomSuperheroButtonClick();
              },
              child: Icon(Icons.shuffle_outlined),
            ),
            bottomNavigationBar: Obx(
                  () =>
                  Visibility(
                    visible: controller.showLoading.isTrue,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
            ),
          ),
    );
  }

  void initTargets() {
    targets.add(
      TargetFocus(
        color: Colors.lightGreen,
        shape: ShapeLightFocus.RRect,
        identify: "Caixa de Pesquisa",
        keyTarget: keyButton,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Pesquisa",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      "Aqui você pesquisa pelo nome dos super-heróis.",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
    targets.add(
      TargetFocus(
        identify: "Target 1",
        keyTarget: keyButton1,
        color: Colors.lightGreen,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Botão gênero/sexo",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      "Aqui você seleciona o gênero de seu super-herói.",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
        shape: ShapeLightFocus.Circle,
        radius: 5,
      ),
    );
    targets.add(
      TargetFocus(
        identify: "Target 2",
        keyTarget: keyButton2,
        color: Colors.lightGreen,
        contents: [
          TargetContent(
            align: ContentAlign.left,
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Busca aleatória",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      "Aqui apresenta um super-herói de forma aleatória. ",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
        shape: ShapeLightFocus.Circle,
        radius: 5,
      ),
    );
  }

  void showTutorial() {
    tutorialCoachMark = TutorialCoachMark(
      context,
      targets: targets,
      colorShadow: Colors.red,
      hideSkip: true,
      textSkip: "",
      paddingFocus: 10,
      opacityShadow: 0.8,
      onFinish: () {
        print("finish");
      },
      onClickTarget: (target) {
        print('onClickTarget: $target');
      },
      onSkip: () {
        print("skip");
      },
      onClickOverlay: (target) {
        print('onClickOverlay: $target');
      },
    )
      ..show();
  }
}


