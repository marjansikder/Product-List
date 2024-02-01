import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../customWidgets/root_containers.dart';
import 'logic.dart';

class WebViewPage extends StatelessWidget {
  WebViewPage({Key? key}) : super(key: key);

  final logic = Get.put(WebViewLogic());
  final state = Get.find<WebViewLogic>().state;

  @override
  Widget build(BuildContext context) {
    return RootContainers.instance.getScaffoldRootContainer(Scaffold(
      appBar: AppBar(
        title: Text("Flutter"),
      ),
      body: WebViewWidget(
        controller: state.webViewController,
      ),
    ));
  }
}
