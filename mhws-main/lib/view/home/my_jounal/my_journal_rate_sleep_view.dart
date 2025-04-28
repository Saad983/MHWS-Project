import 'package:mhws/controllers/assessment_controller.dart';
import 'package:mhws/model/sleep_quality_model.dart';
import 'package:mhws/view/assessment/select_medication_view.dart';
import 'package:mhws/view/utils/export_all.dart';
import 'package:mhws/view/widget/buttons/button_with_arrow.dart';
import 'package:mhws/view/widget/buttons/primary_button.dart';
import 'package:mhws/view/widget/tiles/assessment_counter_tile.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class RateSleepQualityView extends StatelessWidget {
  RateSleepQualityView({super.key});

  final assessmentController = Get.put(AssessmentController());

  final List<SleepQuality> sleepQualityOptions = [
    SleepQuality(
      'Excellent',
      '7 - 9 HOURS',
      AssetImages.goodMood,
    ),
    SleepQuality(
      'Good',
      '6 - 7 HOURS',
      AssetImages.happyEmoji,
    ),
    SleepQuality(
      'Fair',
      '5 HOURS',
      AssetImages.neutralEmoji,
    ),
    SleepQuality(
      'Poor',
      '3 - 4 HOURS',
      AssetImages.badMood,
    ),
    SleepQuality(
      'Worst',
      '< 3 HOURS',
      AssetImages.depressedEmoji,
    ),
  ];

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
            "Rate your sleep",
            style: GoogleFonts.urbanist(
              color: G.onPrimaryColor,
              fontSize: 20.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
        
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
                  "How would you rate your sleep quality?",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.outfit(
                    color: G.onPrimaryColor,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                40.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        children: List.generate(
                          sleepQualityOptions.length,
                          (i) => SizedBox(
                            height: 76.h,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  sleepQualityOptions[i].title.capitalize ?? '',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.urbanist(
                                    color: Color(0xffACA9A5),
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                5.verticalSpace,
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.access_time_filled,
                                      size: 10.sp,
                                      color: Color(0xffC9C7C5),
                                    ),
                                    2.horizontalSpace,
                                    Text(
                                      sleepQualityOptions[i]
                                              .duration
                                              .capitalize ??
                                          '',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.urbanist(
                                        color: Color(0xffC9C7C5),
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GetBuilder<AssessmentController>(
                        builder: (controller) => SizedBox(
                          // height: 343.h,
                          child: Transform.scale(
                            scale: 2.8,
                            child: SfSlider.vertical(
                              inactiveColor: Color(0xffE8DDD9),
                              activeColor: G.selectedColor,
                              value: controller.sleepSlider,
                              stepSize: 1,
                              min: 1,
                              max: sleepQualityOptions.length,
                              thumbIcon: Image.asset(
                                AssetImages.sliderThumb,
                              ),
                              onChanged: (_) => controller.setSleepSlider(_),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: List.generate(
                          sleepQualityOptions.length,
                          (i) => SizedBox(
                            height: 76.h,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Image.asset(
                                sleepQualityOptions[i].image,
                                height: 48.h,
                                width: 48.w,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                48.verticalSpace,
                PrimaryButton(
                  onTap: () => Get.back(),
                  text: "Done",
                  textStyle: GoogleFonts.urbanist(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
