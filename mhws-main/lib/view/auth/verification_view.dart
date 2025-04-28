import 'package:flutter/gestures.dart';
import 'package:mhws/view/auth/change_password_view.dart';
import 'package:mhws/view/utils/export_all.dart';
import 'package:mhws/view/widget/buttons/primary_button.dart';
import 'package:mhws/view/widget/text_fields/secondary_text_field.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({super.key});

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
              "Email OTP Verification",
              style: GoogleFonts.outfit(
                color: G.onPrimaryColor,
                fontSize: 30.sp,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.start,
            ),
            16.verticalSpace,
            Text(
              "Enter the verification code we just sent to your email xxxxx@stringconsultants.com",
              style: GoogleFonts.poppins(
                color: G.onBackground,
                fontSize: 14.sp,
              ),
              textAlign: TextAlign.start,
            ),
            73.verticalSpace,
            PinCodeTextField(
              length: 4,
              obscureText: false,
              animationType: AnimationType.fade,
              enableActiveFill: true,
              textStyle: GoogleFonts.poppins(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderWidth: 2,
                borderRadius: BorderRadius.circular(
                  8.r,
                ),
                activeFillColor: Colors.white,
                inactiveFillColor: G.onBackground,
                selectedFillColor: Colors.white,
                fieldHeight: 60.h,
                fieldWidth: 60.w,
                inactiveColor: Colors.white.withValues(
                  alpha: 0.1,
                ),
                activeColor: G.primaryColor,
                selectedColor: G.primaryColor,
              ),
              animationDuration: const Duration(milliseconds: 300),
              appContext: context,
            ),
            20.verticalSpace,
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "Didn’t receive code? ",
                    style: GoogleFonts.poppins(
                      color: Color(0xff80807F),
                      fontSize: 14.sp,
                    ),
                  ),
                  TextSpan(
                    text: "Resend",
                    style: GoogleFonts.poppins(
                      color: G.primaryColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = () {},
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            40.verticalSpace,
            Center(
              child: SizedBox.square(
                dimension: 286.h,
                child: Image.asset(
                  AssetImages.verificationBanner,
                ),
              ),
            ),
            60.verticalSpace,
            PrimaryButton(
              text: "Verify",
              onTap: () => Get.off(()=> ChangePasswordView()),
            )
          ],
        ),
      ),
    );
  }
}
