import 'package:challenges/core/resources/manager_assets.dart';
import 'package:challenges/core/resources/manager_colors.dart';
import 'package:challenges/core/resources/manager_strings.dart';
import 'package:challenges/core/resources/manager_styles.dart';
import 'package:challenges/core/validator/validator.dart';
import 'package:challenges/features/auth/presentation/controller/signup_controller.dart';
import 'package:challenges/features/auth/presentation/view/widget/auth_question.dart';
import 'package:challenges/features/auth/presentation/view/widget/build_appbar.dart';
import 'package:challenges/features/auth/presentation/view/widget/main_button.dart';
import 'package:challenges/features/auth/presentation/view/widget/main_text_field.dart';
import 'package:challenges/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpView extends StatelessWidget {
  final FieldValidator _failedValidator = FieldValidator();

  SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
        builder: (controller) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: buildAppBar(ManagerStrings.signup),
            body: Stack(
              children: [
                Image.asset(ManagerAssets.signupImg),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height*0.52,
                    decoration: const BoxDecoration(
                        color: ManagerColors.backgroundColor,
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0,left: 20,right: 20),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ManagerStrings.createAccount,
                              style: getMediumTextStyle(fontSize: 26, color: ManagerColors.blackColor),
                            ),
                            Text(
                              ManagerStrings.quicklyCreateAccount,
                              style: getMediumTextStyle(
                                  fontSize: 15,
                                  color: ManagerColors.lightGreyColor),
                            ),
                            SizedBox(height:MediaQuery.of(context).size.height*0.02,),
                            Form(
                              key: controller.formKey,
                              child: Column(
                                children: [
                                  MainTextField(
                                    controller: controller.email,
                                    inputType: TextInputType.emailAddress,
                                    obSecureText: false,
                                    hintText: ManagerStrings.emailAddressHint,
                                    prefix: ManagerAssets.email,
                                    validator: (value) => _failedValidator.validateEmail(
                                      value,
                                    ),
                                  ),
                                  SizedBox(height:MediaQuery.of(context).size.height*0.01,),
                                  MainTextField(
                                    controller: controller.phone,
                                    inputType: TextInputType.number,
                                    obSecureText: false,
                                    hintText: ManagerStrings.phoneNumber,
                                    prefix: ManagerAssets.phone,
                                    validator: (value) => _failedValidator.validatePhone(
                                      value,
                                    ),
                                  ),
                                  SizedBox(height:MediaQuery.of(context).size.height*0.01,),
                                  MainTextField(
                                    controller: controller.password,
                                    inputType: TextInputType.text,
                                    obSecureText: true,
                                    hintText: ManagerStrings.passwordHint,
                                    prefix: ManagerAssets.lock,
                                    sufix: ManagerAssets.eye,
                                    validator: (value) => _failedValidator.validatePassword(
                                      value,
                                    ),
                                  ),
                                  SizedBox(height:MediaQuery.of(context).size.height*0.02,),

                                  MainButton(
                                    gradientColor: ManagerColors.buttonGradient,
                                    textColor: ManagerColors.whiteColor,
                                    text: ManagerStrings.signup,
                                    onPressed: (){
                                      if(controller.formKey.currentState!.validate()){
                                        Get.offAllNamed(Routes.mainView);
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                            AccountQuestion(
                              question: ManagerStrings.alreadyHaveAccount,
                              action: ManagerStrings.login,
                              onPressed: () => Get.toNamed(Routes.loginView),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
    );
  }
}
