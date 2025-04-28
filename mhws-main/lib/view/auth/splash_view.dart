import 'package:mhws/view/auth/login_view.dart';
import 'package:mhws/view/utils/export_all.dart';
import 'package:mhws/view/widget/buttons/primary_button.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '"Every day may not be good, but there’s something good in every day."',
            style: GoogleFonts.originalSurfer(
              color: G.onPrimaryColor,
              fontSize: 24.sp,
            ),
            textAlign: TextAlign.center,
          ).paddingSymmetric(
            horizontal: 22.w,
          ),
          100.verticalSpace,
          // 407.verticalSpace,
          SizedBox.square(
            dimension: 407.h,
            child: Image.asset(
              AssetImages.splash,
              fit: BoxFit.cover,
            ),
          ),
          90.verticalSpace,
          PrimaryButton(
            onTap: () => Get.to(() => LoginView()),
            text: "Let’s Get Started",
            textStyle: GoogleFonts.aclonica(
              color: G.onPrimaryColor,
              fontSize: 24.sp,
            ),
          )
        ],
      ),
    );
  }
}
