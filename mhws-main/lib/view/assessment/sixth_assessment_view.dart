import 'package:mhws/controllers/assessment_controller.dart';
import 'package:mhws/view/assessment/seventh_assessment_view.dart';
import 'package:mhws/view/utils/export_all.dart';
import 'package:mhws/view/widget/buttons/button_with_arrow.dart';
import 'package:mhws/view/widget/buttons/primary_button.dart';
import 'package:mhws/view/widget/tiles/assessment_counter_tile.dart';

class SixthAssessmentView extends StatelessWidget {
  SixthAssessmentView({super.key});

   

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
              initial: 6,
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
                  "Have you sought professional help before?",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.outfit(
                    color: G.onPrimaryColor,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                38.verticalSpace,
                SizedBox.square(
                  dimension: 286.w,
                  child: Image.asset(
                    AssetImages.questionVector,
                  ),
                ),
                38.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    
                    PrimaryButton(
                      // onTap: () => Get.to(() => SelectGenderView()),
                      text: "Yes",
                      textStyle: GoogleFonts.urbanist(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w800,
                      ),
    
                      bgColor: G.selectedColor,
                      width: 160.w,
                    ),
                    
                    PrimaryButton(
                      // onTap: () => Get.to(() => SelectGenderView()),
                      text: "No",
                      textStyle: GoogleFonts.urbanist(
                        color: G.brown,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w800,
                      ),
    
                      bgColor: G.onPrimaryColor,
                      width: 160.w,
                    ),
                  ],
                ),
                16.verticalSpace,
                ButtonWithArrow(
                  onTap: () => Get.to(() => SeventhAssessmentView()),
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
