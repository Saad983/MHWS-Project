import 'package:mhws/view/utils/export_all.dart';
import 'package:mhws/view/widget/buttons/primary_button.dart';

class SOSView extends StatelessWidget {
  const SOSView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            AssetImages.assessmentBg,
          ),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          automaticallyImplyLeading: false,
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: G.onPrimaryColor,
              size: 20.sp,
            ),
          ),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: 25.w,
            vertical: 20.h,
          ),
          children: [
            Text(
              "Are you in crisis?",
              style: GoogleFonts.inter(
                color: G.onPrimaryColor,
                fontSize: 22.sp,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            10.verticalSpace,
            Text(
              "Your are not alone, Help is just a call away.",
              style: GoogleFonts.inter(
                color: G.onPrimaryColor,
                fontSize: 24.sp,
                fontWeight: FontWeight.w800,
              ),
              textAlign: TextAlign.center,
            ),
            48.verticalSpace,
            PrimaryButton(
              onTap: () {},
              text: "Grounding for panic",
              bgColor: Colors.transparent,
              bdColor: Colors.white,
              textStyle: GoogleFonts.urbanist(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            Divider(
              color: Colors.white30,
              height: 100.h,
              endIndent: 50.w,
              indent: 50.w,
            ),
            Text(
              "If you are dealing with abuse, trauma or crisis, Wysa is not enough. It is important that you talk to a person you feel safe sharing what you are dealing with. If there is no one, call one of the helplines below. Things will get better.",
              style: GoogleFonts.inter(
                color: G.onPrimaryColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.center,
            ),
            40.verticalSpace,
             PrimaryButton(
              onTap: () {},
              text: "Create Safety Plan",
              textStyle: GoogleFonts.urbanist(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            20.verticalSpace,
             PrimaryButton(
              onTap: () {},
              text: "International Crisis Helplines",
              textStyle: GoogleFonts.urbanist(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            20.verticalSpace,
             PrimaryButton(
              onTap: () {},
              text: "International Child Helplines",
              textStyle: GoogleFonts.urbanist(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
