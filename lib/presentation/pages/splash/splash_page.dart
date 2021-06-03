import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rd_app/presentation/global_widgets/raia_image_widget.dart';
import 'package:rd_app/presentation/pages/splash/splash_controller.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (controller) => Scaffold(
        body: Stack(
          children: [
            LogoRaiaWidget(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
