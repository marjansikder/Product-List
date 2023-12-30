import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../api/base_states.dart';

class SignInState extends BaseState {
  SignInState() {
    ///Initialize variables
  }

  TextEditingController emailAddressController =  TextEditingController(text: '');
  TextEditingController passwordController =  TextEditingController(text: '');
  var isButtonEnable = Rx<bool>(false);
}
