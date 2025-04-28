import 'package:animated_weight_picker/animated_weight_picker.dart';
import 'package:mhws/controllers/assessment_controller.dart';
import 'package:mhws/view/assessment/select_mood_view.dart';
import 'package:mhws/view/utils/export_all.dart';
import 'package:mhws/view/widget/buttons/button_with_arrow.dart';
import 'package:mhws/view/widget/tiles/assessment_counter_tile.dart';

class SelectWeightView extends StatelessWidget {
  SelectWeightView({super.key});

  final AssessmentController assessmentController =
      Get.put<AssessmentController>(AssessmentController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(AssetImages.assessmentBg),
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
                initial: 4,
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
                  "What’s your weight?",
                  style: GoogleFonts.outfit(
                    color: G.onPrimaryColor,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                48.verticalSpace,
                Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.r),
                    color: G.onPrimaryColor,
                  ),
                  child: TabBar(
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.r),
                      color: G.primaryColor,
                    ),
                    labelPadding: EdgeInsets.symmetric(
                      vertical: 0.h,
                      horizontal: 60.w,
                    ),
                    tabAlignment: TabAlignment.center,
                    unselectedLabelStyle: GoogleFonts.urbanist(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w800,
                      color: Color(0xff4F3422),
                    ),
                    labelStyle: GoogleFonts.urbanist(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w800,
                      color: G.onPrimaryColor,
                    ),
                    indicatorSize: TabBarIndicatorSize.tab,
                    dividerColor: Colors.transparent,
                    onTap: (value) => assessmentController.setWeightUnit(
                      value == 0 ? 'kg' : "lbs",
                    ),
                    tabs: [
                      Tab(
                        text: 'kg',
                      ),
                      Tab(
                        text: 'lbs',
                      ),
                    ],
                  ),
                ),
                70.verticalSpace,
                GetBuilder<AssessmentController>(builder: (controller) {
                  return AnimatedWeightPicker(
                    min: 0,
                    max: 635,
                    dialHeight: 40.h,
                    dialThickness: 5,
                    dialColor: Color(0xff9BB168),
                    selectedValueStyle: GoogleFonts.urbanist(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w800,
                      color: G.onPrimaryColor,
                    ),
                    suffixText: controller.weightUnit,
                  );
                }),
                70.verticalSpace,
                ButtonWithArrow(
                  onTap: () => Get.to(() => SelectMoodView()),
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
}
