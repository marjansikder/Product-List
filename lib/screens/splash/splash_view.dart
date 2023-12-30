import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../config/app_settings.dart';
import '../../customWidgets/root_containers.dart';
import 'splash_logic.dart';

class SplashPage extends StatelessWidget {
  final logic = Get.find<SplashLogic>();
  final state = Get.find<SplashLogic>().state;
  @override
  Widget build(BuildContext context) {
    return RootContainers.instance.getScaffoldRootContainer(
        Center(
          child: Image(image: AssetImage(
              ImageLocation.dashboard + "/icon_customer.png"),width: 300,height: 150,),
        ),
        boxDecoration: ContainerBoxDecorations.instance.getGradientBoxDecoration()
    );
  }
}
