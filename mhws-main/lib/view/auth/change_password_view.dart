import 'package:flutter/gestures.dart';
import 'package:mhws/view/utils/export_all.dart';
import 'package:mhws/view/widget/buttons/primary_button.dart';
import 'package:mhws/view/widget/text_fields/sercondary_password_field.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            AssetImages.authBackground,
          ),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          leadingWidth: 60.w,
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Color(0XffC4C4C4),
              size: 20.sp,
            ),
          )..paddingSymmetric(
              horizontal: 26.w,
            ),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: 27.w,
          ),
          children: [
            Text(
              "Set New Password",
              style: GoogleFonts.outfit(
                color: G.onPrimaryColor,
                fontSize: 30.sp,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.start,
            ),
            16.verticalSpace,
            Image.asset(
              AssetImages.forgotBanner,
              height: 223.h,
              width: 321.w,
            ),
            60.verticalSpace,
            SecondaryPasswordField(
              label: "New Password",
            ),
            10.verticalSpace,
            SecondaryPasswordField(
              label: "Confirm Password",
            ),
            160.verticalSpace,
            PrimaryButton(
              text: "Confirm",
              onTap: () {
                Get.back();
                Get.back(); 
              },
            )
          ],
        ),
      ),
    );
  }
}
