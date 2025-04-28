import 'package:flutter/gestures.dart';
import 'package:mhws/view/assessment/select_health_goal_view.dart';
import 'package:mhws/view/utils/export_all.dart';
import 'package:mhws/view/widget/buttons/primary_button.dart';
import 'package:mhws/view/widget/text_fields/primary_password_field.dart';
import 'package:mhws/view/widget/text_fields/primary_text_field.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: G.primaryBackgroundColor,
            size: 20.sp,
          ),
        ),
      ),
      body: Column(
        children: [
          Image.asset(
            AssetImages.registerBanner,
            height: 0.4.sh,
            width: double.infinity,
            fit: BoxFit.fitWidth,
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(
                horizontal: 47.w,
                vertical: 0,
              ),
              children: [
                Text(
                  "Register",
                  style: GoogleFonts.poppins(
                    color: G.onPrimaryColor,
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Create a new account",
                  style: GoogleFonts.poppins(
                    color: G.onPrimaryColor,
                    fontSize: 20.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
                10.verticalSpace,
                PrimaryTextField(
                  label: "Username",
                ),
                5.verticalSpace,
                PrimaryTextField(
                  label: "Email",
                ),
                5.verticalSpace,
                PrimaryTextField(
                  label: "Mobile Number",
                ),
                5.verticalSpace,
                PrimaryPasswordField(),
                24.verticalSpace,
                PrimaryButton(
                  onTap: () => Get.to(() => SelectHealthGoalView()),
                  text: "Register",
                ),
                12.verticalSpace,
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Already have account? ",
                        style: GoogleFonts.poppins(
                          color: Color(0xffBCBEC0),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: "Login",
                        style: GoogleFonts.poppins(
                          color: G.onPrimaryColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.back(),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
