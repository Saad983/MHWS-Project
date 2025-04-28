import 'dart:developer';

import 'package:mhws/controllers/assessment_controller.dart';
import 'package:mhws/view/assessment/select_gender_view.dart';
import 'package:mhws/view/assessment/select_weight_view.dart';

import 'package:mhws/view/utils/export_all.dart';
import 'package:mhws/view/widget/buttons/button_with_arrow.dart';
import 'package:mhws/view/widget/number_picker/number_picker.dart';
import 'package:mhws/view/widget/tiles/assessment_counter_tile.dart';

class SelectAgeView extends StatelessWidget {
  SelectAgeView({super.key});

   

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
              initial: 3,
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
                "What’s your age?",
                style: GoogleFonts.outfit(
                  color: G.onPrimaryColor,
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              48.verticalSpace,
              Stack(
                children: [
                  Positioned(
                    top: 100.h,
                    bottom: 95.h,
                    left: 150.w,
                    right: 150.w,
                    child: Container(
                      height: 50.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          100.r,
                        ),
                        color: G.selectedColor,
                      ),
                    ),
                  ),
                  Center(
                    child: GetBuilder<AssessmentController>(
                      builder: (controller) => NumberPicker(
                        minValue: 0,
                        maxValue: 100,
                        value: controller.age ?? 18,
                        itemCount: 5,
                        itemWidth: 100.w,
                        itemHeight: 50.h,
                        axis: Axis.vertical,
                        textStyle: GoogleFonts.urbanist(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w800,
                          color: Color(0xffACA9A5),
                        ),
                        selectedTextStyle: GoogleFonts.urbanist(
                          fontSize: 40.sp,
                          fontWeight: FontWeight.w800,
                          color: G.onPrimaryColor,
                        ),
                        onChanged: controller.setAge,
                      ),
                    ),
                  ),
                ],
              ),
              48.verticalSpace,
              ButtonWithArrow(
                onTap: () => Get.to(() => SelectWeightView()),
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
