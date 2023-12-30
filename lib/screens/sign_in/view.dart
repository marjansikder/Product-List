import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../config/app_settings.dart';
import '../../../style/text_style.dart';
import '../../../style/theme.dart';
import '../../../utils/constansts.dart';
import '../../customWidgets/common_buttons.dart';
import '../../customWidgets/common_text_fields.dart';
import '../../customWidgets/root_containers.dart';
import 'logic.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);

  final logic = Get.put(SignInLogic());
  final state = Get.find<SignInLogic>().state;

  @override
  Widget build(BuildContext context) {
    return RootContainers.instance.getScaffoldRootContainer(
      SingleChildScrollView(
        child: Container(
          color: AppColors.priceShowColor,
          height: Get.height,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 25, right: 25, top: 50),
                child: Column(
                    children: [
                      Image(image: AssetImage(
                          ImageLocation.dashboard + "/icon_customer.png"),
                        height: 180,
                        width: 150,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Login', style: getArialTextStyle(
                              20, FontWeight.bold,
                              AppColors.colorBackGround),)),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 1,
                        width: Get.width,
                        color: AppColors.colorDot,),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 56,
                        width: Get.width,
                        decoration: BoxDecoration(
                            color: AppColors.white.withOpacity(
                                .9),
                            borderRadius: BorderRadius.circular(8)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 18, right: 18, top: 10),
                          child: CommonTextFields.instance.getCommonTextView(
                              state.emailAddressController,
                              AppStrings.EMAIL_HINT,
                              textColor: AppColors.hintTextColor,
                              inputType: TextInputType.name),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Container(
                        height: 56,
                        width: Get.width,
                        decoration: BoxDecoration(
                            color: AppColors.white.withOpacity(
                                .9),
                            borderRadius: BorderRadius.circular(8)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 18, right: 18, top: 10),
                          child: CommonTextFields.instance.getCommonTextView(
                              state.passwordController,
                              AppStrings.PASSWORD_HINT,
                              textColor: AppColors.hintTextColor,
                              maxLength: 20,
                              inputType: TextInputType.name),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 1,
                        width: Get.width,
                        color: AppColors.colorDot,),
                      SizedBox(
                        height: 20,
                      ),

                      Obx(() {
                        return CommonButtons.instance.getAnimatedButton(
                            AppStrings.SIGN_IN, () =>
                        {
                          if(state.isButtonEnable.value)
                            logic.adminLoginCall()
                        },
                            state.isButtonEnable.value);
                      }),
                      SizedBox(
                        height: 40,
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
