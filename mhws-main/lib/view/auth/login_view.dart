import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:mhws/controllers/auth_controller.dart';
import 'package:mhws/view/assessment/select_health_goal_view.dart';
import 'package:mhws/view/auth/forgot_password_view.dart';
import 'package:mhws/view/auth/register_view.dart';
import 'package:mhws/view/utils/export_all.dart';
import 'package:mhws/view/widget/buttons/primary_button.dart';
import 'package:mhws/view/widget/text_fields/primary_password_field.dart';
import 'package:mhws/view/widget/text_fields/primary_text_field.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final TextEditingController emailController = TextEditingController();
  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(
            AssetImages.loginBanner,
            height: 0.5.sh,
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(
                horizontal: 47.w,
                vertical: 0,
              ),
              children: [
                Text(
                  "Welcome",
                  style: GoogleFonts.poppins(
                    color: G.onPrimaryColor,
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Login to your account",
                  style: GoogleFonts.poppins(
                    color: G.onPrimaryColor,
                    fontSize: 20.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
                10.verticalSpace,
                PrimaryTextField(
                  label: "Email",
                  controller: emailController,
                ),
                5.verticalSpace,
                PrimaryPasswordField(),
                5.verticalSpace,
                GestureDetector(
                  onTap: () => Get.to(() => ForgotPasswordView()),
                  child: Text(
                    "Forgot Password?",
                    style: GoogleFonts.poppins(
                      color: Color(0xffFFC107),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ),
                18.verticalSpace,
                PrimaryButton(
                  onTap: () {
                    log(emailController.text.trim());
                    Get.to(() => SelectHealthGoalView());
                    // authController.login(emailController.text.trim()).then(
                    //   (value) {
                    //     if (value) {
                    //       Get.to(() => SelectHealthGoalView());
                    //       Get.snackbar(
                    //         "Success",
                    //         "Something went wrong",
                    //         backgroundColor: G.primaryColor,
                    //       );
                    //     } else {
                    //       Get.snackbar(
                    //         "Error",
                    //         "Something went wrong",
                    //         backgroundColor: G.primaryColor,
                    //       );
                    //     }
                    //   },
                    // );
                  },
                  text: "Login",
                ),
                16.verticalSpace,
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Don’t have account? ",
                        style: GoogleFonts.poppins(
                          color: Color(0xffBCBEC0),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: "Create Now",
                        style: GoogleFonts.poppins(
                          color: G.onPrimaryColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.to(
                                () => RegisterView(),
                              ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                21.verticalSpace,
                SizedBox.square(
                  dimension: 25.h,
                  child: Image.asset(
                    AssetImages.googleLogo,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
