import 'package:mhws/controllers/assessment_controller.dart';
import 'package:mhws/view/home/main_home_view.dart';
import 'package:mhws/view/utils/export_all.dart';
import 'package:mhws/view/widget/buttons/button_with_arrow.dart';
import 'package:mhws/view/widget/tiles/assessment_counter_tile.dart';

class SelectStressLevelView extends StatelessWidget {
  const SelectStressLevelView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            AssetImages.assessmentBg
          ),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          // leadingWidth: 60.w,
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Color(0XffC4C4C4),
              size: 20.sp,
            ),
          ),
          title: Text(
            "Assessment",
            style: GoogleFonts.outfit(
              color: G.onPrimaryColor,
              fontSize: 20.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
          actions: [
            AssessmentCounterTile(
              initial: 12,
              total: 12,
            ),
          ],
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: 30.w,
          ),
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            8.verticalSpace,
            Text(
              "How would you rate your stress level?",
              textAlign: TextAlign.center,
              style: GoogleFonts.outfit(
                color: G.onPrimaryColor,
                fontSize: 30.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            50.verticalSpace,
            GetBuilder<AssessmentController>(
              builder: (controller) => Text(
                controller.stressLevel.toString(),
                textAlign: TextAlign.center,
                style: GoogleFonts.urbanist(
                  color: G.onPrimaryColor,
                  fontSize: 180.sp,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            20.verticalSpace,
            GetBuilder<AssessmentController>(builder: (controller) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.r),
                  color: G.onPrimaryColor,
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 8.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    5,
                    (i) => GestureDetector(
                      onTap: () => controller.setstressLevel(i+1),
                      child: Container(
                        width: 64.w,
                        height: 64.h,
                        decoration: controller.stressLevel == (i + 1)
                            ? BoxDecoration(
                                shape: BoxShape.circle,
                                color: G.selectedColor,
                                boxShadow: [
                                  BoxShadow(
                                    spreadRadius: 4.r,
                                    offset: Offset(0, 0),
                                    blurRadius: 0,
                                    color: Color(0x40FE814B),
                                  ),
                                ],
                              )
                            : null,
                        child: Center(
                          child: Text(
                            (i + 1).toString(),
                            textAlign: TextAlign.center,
                            style: GoogleFonts.urbanist(
                              color: controller.stressLevel == (i + 1)
                                  ? G.onPrimaryColor
                                  : G.brown,
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
            24.verticalSpace,
            GetBuilder<AssessmentController>(
              builder: (controller) => Text(
                "You Are Exremely Stressed Out.",
                textAlign: TextAlign.center,
                style: GoogleFonts.urbanist(
                  color: Color(0xff736B66),
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            64.verticalSpace,
            ButtonWithArrow(
              onTap: () => Get.offAll(() => MainHomeView()),
              
              text: "Continue",
              width: 343.w,
            )
          ],
        ),
      ),
    );
  }

  Widget suggestionChip(_) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8.w,
        vertical: 4.h,
      ),
      decoration: BoxDecoration(
        color: G.selectedColor,
        borderRadius: BorderRadius.circular(32.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            _,
            textAlign: TextAlign.center,
            style: GoogleFonts.urbanist(
              color: G.onPrimaryColor,
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          4.horizontalSpace,
          Image.asset(
            AssetImages.close,
            color: Color(0xffFFC89E),
            height: 16.h,
            width: 16.w,
          ),
        ],
      ),
    );
  }
}
