import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../api/base_controller.dart';
import 'state.dart';

class WebViewLogic extends BaseController {
  final WebViewState state = WebViewState();

  @override
  void onReady() {
    super.onReady();
    webView ();
  }
  void webView (){
    state.webViewController
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('https://www.google.com/maps'));
  }
}
