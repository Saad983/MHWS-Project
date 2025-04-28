import 'package:mhws/view/auth/verification_view.dart';
import 'package:mhws/view/utils/export_all.dart';
import 'package:mhws/view/widget/buttons/primary_button.dart';
import 'package:mhws/view/widget/text_fields/secondary_text_field.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Forgot Password",
                  style: GoogleFonts.outfit(
                    color: G.onPrimaryColor,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ).paddingSymmetric(
                  horizontal: 26.w,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  AssetImages.forgotBanner,
                  height: 223.h,
                  width: 321.w,
                ),
              ),
              88.verticalSpace,
              SecondaryTextField(
                label: "Enter Your Email Address",
                hint: "example123@gmail.com",
              ),
              259.verticalSpace,
              PrimaryButton(
                onTap: () => Get.to(()=> VerificationView()),
                text: "Send OTP",

              )
             
            ],
          ),
        ),
      ),
    );
  }
}
