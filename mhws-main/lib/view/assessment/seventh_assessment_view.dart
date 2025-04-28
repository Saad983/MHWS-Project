import 'package:mhws/controllers/assessment_controller.dart';
import 'package:mhws/view/assessment/select_sleep_quality_view.dart';
import 'package:mhws/view/utils/export_all.dart';
import 'package:mhws/view/widget/buttons/button_with_arrow.dart';
import 'package:mhws/view/widget/tiles/assessment_counter_tile.dart';

class SeventhAssessmentView extends StatelessWidget {
  SeventhAssessmentView({super.key});

   

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
              initial: 7,
              total: 12,
            ),
          ],
        ),
        body: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 30.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                58.verticalSpace,
                Text(
                  "Are you experiencing any physical distress?",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.outfit(
                    color: G.onPrimaryColor,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                38.verticalSpace,
                hasPainTile(true),
                12.verticalSpace,
                hasPainTile(false),
                48.verticalSpace,
                ButtonWithArrow(
                  onTap: () => Get.to(() => SelectSleepQualityView()),
                  text: "Continue",
                  width: 343.w,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget hasPainTile(bool hasPain) {
    return GetBuilder<AssessmentController>(builder: (controller) {
      final bool isSelected = controller.hasPain == hasPain;

      return GestureDetector(
        onTap: () => controller.setHasPain(hasPain),
        child: Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: isSelected ? G.selectedColor : Colors.white,
            borderRadius: BorderRadius.circular(32.r),
            boxShadow: [
              if (isSelected)
                BoxShadow(
                  spreadRadius: 4.r,
                  offset: Offset(0, 0),
                  blurRadius: 0,
                  color: Color(0xff9BB068).withValues(
                    alpha: .25,
                  ),
                ),
            ],
          ),
          child: Row(
            children: [
              // SizedBox.square(
              //   dimension: 24.w,
              //   child: Image.asset(
              //     goal.image,
              //     color: isSelected ? Colors.white : Color(0xffC9C7C5),
              //   ),
              // ),
              SizedBox(
                width: 271.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox.square(
                      dimension: 48.h,
                      child: Image.asset(
                        hasPain
                            ? AssetImages.positiveCheck
                            : AssetImages.negativeCheck,
                      ),
                    ),
                    16.verticalSpace,
                    Text(
                      hasPain
                          ? "Yes, one or multiple"
                          : "No Physical Pain At All",
                      style: GoogleFonts.urbanist(
                        color:
                            isSelected ? G.onPrimaryColor : Color(0xff4F3422),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    5.verticalSpace,
                    Text(
                      hasPain
                          ? "I’m experiencing physical pain in different place over my body."
                          : "I’m not experiencing any physical pain in my body at all :)",
                      style: GoogleFonts.urbanist(
                        color:
                            isSelected ? G.onPrimaryColor : Color(0xff4F3422),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 18.h,
                width: 18.w,
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isSelected ? Colors.white : Color(0xff4F3422),
                    width: 2,
                  ),
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  backgroundColor:
                      isSelected ? Colors.white : Colors.transparent,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
