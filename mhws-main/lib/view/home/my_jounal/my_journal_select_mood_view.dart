import 'package:mhws/controllers/assessment_controller.dart';
import 'package:mhws/view/home/my_jounal/my_journal_add_feeling_view.dart';
import 'package:mhws/view/utils/export_all.dart';
import 'package:mhws/view/widget/buttons/button_with_arrow.dart';

class MyJournalSelectMoodView extends StatelessWidget {
  MyJournalSelectMoodView({super.key});
  final assessmentController = Get.put(AssessmentController());

  @override
  Widget build(BuildContext context) {
    return Container(
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
            "Rate your mood",
            style: GoogleFonts.outfit(
              color: G.onPrimaryColor,
              fontSize: 20.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              20.verticalSpace,
              Text(
                "How are you Feeling?",
                textAlign: TextAlign.center,
                style: GoogleFonts.urbanist(
                  color: G.onPrimaryColor,
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w800,
                ),
              ),
              48.verticalSpace,
              GetBuilder<AssessmentController>(
                builder: (controller) => Text(
                  "I Feel ${controller.mood.capitalize}",
                  style: GoogleFonts.urbanist(
                    color: Color(0xff736B66),
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              24.verticalSpace,
              GetBuilder<AssessmentController>(
                builder: (controller) => SizedBox.square(
                  dimension: 120.w,
                  child: Image.asset(
                    controller.mood == "good"
                        ? AssetImages.goodMood
                        : controller.mood == "bad"
                            ? AssetImages.badMood
                            : AssetImages.nuetralMood,
                  ),
                ),
              ),
              24.verticalSpace,
              SizedBox.square(
                dimension: 48.w,
                child: Image.asset(
                  AssetImages.doubleArrowDownward,
                ),
              ),
              35.verticalSpace,
              SizedBox(
                width: double.infinity,
                height: 0.42.sh,
                child: GetBuilder<AssessmentController>(
                  builder: (controller) {
                    return Stack(
                      children: [
                        Positioned(
                          bottom: 0,
                          top: 0,
                          left: -2.w,
                          right: -2.w,
                          child: Image.asset(
                            AssetImages.moodBg,
                            fit: BoxFit.cover,
                          ),
                        ),
                        if (controller.mood == 'neutral')
                          Positioned(
                            top: 125.h,
                            left: 178.w,
                            child: SizedBox(
                              width: 40.w,
                              height: 70.h,
                              child: Image.asset(
                                AssetImages.moodSelector,
                              ),
                            ),
                          ),
                        if (controller.mood == 'bad')
                          Positioned(
                            top: 155.h,
                            left: 70.w,
                            child: Transform.rotate(
                              angle: 74.8,
                              child: SizedBox(
                                width: 40.w,
                                height: 70.h,
                                child: Image.asset(
                                  AssetImages.moodSelector,
                                ),
                              ),
                            ),
                          ),
                        if (controller.mood == 'good')
                          Positioned(
                            top: 155.h,
                            right: 70.w,
                            child: Transform.rotate(
                              angle: 25.8,
                              child: SizedBox(
                                width: 40.w,
                                height: 70.h,
                                child: Image.asset(
                                  AssetImages.moodSelector,
                                ),
                              ),
                            ),
                          ),
                        Positioned(
                          top: 0.h,
                          bottom: 190.h,
                          left: 0.35.sw,
                          right: 0.35.sw,
                          child: GestureDetector(
                            onTap: () => controller.setMood('neutral'),
                            child: Container(
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 20.h,
                          bottom: 140.h,
                          left: 0,
                          right: 0.67.sw,
                          child: GestureDetector(
                            onTap: () => controller.setMood('bad'),
                            child: Container(
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 20.h,
                          bottom: 140.h,
                          left: 0.67.sw,
                          right: 0,
                          child: GestureDetector(
                            onTap: () => controller.setMood('good'),
                            child: Container(
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 40.h,
                          left: 26.w,
                          child: ButtonWithArrow(
                            onTap: () =>
                                Get.to(() => MyJournalAddFeelingView()),
                            text: "Continue",
                            width: 343.w,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
 