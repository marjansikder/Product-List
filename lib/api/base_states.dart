import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:logger/logger.dart';

abstract class BaseState{
  var isLoading = false.obs;
  var logger = Logger(
    printer: PrettyPrinter(),
  );
}