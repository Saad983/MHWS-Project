import 'package:mhws/controllers/assessment_controller.dart';
import 'package:mhws/view/assessment/select_age_view.dart';
import 'package:mhws/view/utils/export_all.dart';
import 'package:mhws/view/widget/buttons/button_with_arrow.dart';
import 'package:mhws/view/widget/tiles/assessment_counter_tile.dart';

class SelectGenderView extends StatelessWidget {
  SelectGenderView({super.key});

  final List<String> genders = ["male", "female"];

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
              initial: 2,
              total: 12,
            ),
          ],
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              58.verticalSpace,
              Text(
                "What’s your official\ngender?",
                style: GoogleFonts.outfit(
                  color: G.onPrimaryColor,
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              40.verticalSpace,
              ...List.generate(
                genders.length,
                (i) => GetBuilder<AssessmentController>(
                  builder: (controller) => GestureDetector(
                    onTap: () => controller.gender = genders[i],
                    child: Container(
                      margin: EdgeInsets.only(
                        bottom: 8.h,
                      ),
                      decoration: controller.gender == genders[i]
                          ? BoxDecoration(
                              borderRadius: BorderRadius.circular(32.r),
                              border: Border.all(
                                color: Color(0xff4F3422),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  spreadRadius: 4.r,
                                  offset: Offset(0, 0),
                                  blurRadius: 0,
                                  color: Color(0xff926247).withValues(
                                    alpha: .25,
                                  ),
                                ),
                              ],
                            )
                          : null,
                      child: Image.asset(
                        genders[i] == "female"
                            ? AssetImages.femaleBox
                            : AssetImages.maleBox,
                        width: 343.w,
                        height: 155.h,
                      ),
                    ),
                  ),
                ),
              ),
              40.verticalSpace,
              ButtonWithArrow(
                onTap: () => Get.to(() => SelectAgeView()),
                text: "Prefer to skip, thanks",
                bgColor: Color(0xffE5EAD7),
                color: Color(0xff9BB168),
                iconColor: Color(0xff9BB168),
                icon: AssetImages.close,
                width: 343.w,
              ),
              16.verticalSpace,
              ButtonWithArrow(
                onTap: () => Get.to(() => SelectAgeView()),
                text: "Continue",
                width: 343.w,
              )
            ],
          ),
        ),
      ),
    );
  }
}
