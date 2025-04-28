import 'package:chips_input_autocomplete/chips_input_autocomplete.dart';
import 'package:mhws/controllers/assessment_controller.dart';
import 'package:mhws/view/assessment/add_mental_symptom_view.dart';
import 'package:mhws/view/utils/export_all.dart';
import 'package:mhws/view/widget/buttons/button_with_arrow.dart';
import 'package:mhws/view/widget/tiles/assessment_counter_tile.dart';

class DescribeYourselfView extends StatelessWidget {
  DescribeYourselfView({super.key});

   
  // List<String> yourOptionsList = [
  //   'Introvert',
  //   'Afraid of people',
  //   'Neuroticism',
  //   'Sensitive',
  // ];

  List<String> describeYourselfSuggestions = ["easy feel sad", "pessimistic"];

  // final ChipsAutocompleteController chipsAutocompleteController =
  //     ChipsAutocompleteController();

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
              initial: 10,
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
            58.verticalSpace,
            Text(
              "How would you describe yourself?",
              textAlign: TextAlign.center,
              style: GoogleFonts.outfit(
                color: G.onPrimaryColor,
                fontSize: 30.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            32.verticalSpace,
            Image.asset(
              AssetImages.describeYourself,
              height: 194.h,
              width: 194.w,
            ),
            26.verticalSpace,
            Container(
              height: 145.h,
              width: double.infinity,
              padding: EdgeInsets.all(
                16.w,
              ),
              decoration: BoxDecoration(
                color: G.onPrimaryColor,
                borderRadius: BorderRadius.circular(40.r),
                boxShadow: [
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
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 300.w,
                    height: 90.h,
                    child: ChipsInputAutocomplete(
                      paddingInsideWidgetContainer: EdgeInsets.zero,
                      // controller: chipsAutocompleteController,
                      chipTheme: ChipThemeData(
                        padding: EdgeInsets.symmetric(
                          vertical: 3.5.h,
                          horizontal: 8.w,
                        ),
                        side: BorderSide.none,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            32.r,
                          ),
                        ),
                        labelStyle: GoogleFonts.urbanist(
                          color: Color(0xff9BB168),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        backgroundColor: Color(0xffF2F5EB),
                      ),
                    ),
                  ),
                  Row(
                    // mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        AssetImages.document,
                        height: 20.h,
                        width: 20.w,
                      ),
                      Text(
                        " 4 / 10",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.urbanist(
                          color: Color(0xff736B66),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w800,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            24.verticalSpace,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                16.horizontalSpace,
                Text(
                  "Most Common: ",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.urbanist(
                    color: G.onPrimaryColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                8.horizontalSpace,
                Expanded(
                  child: SizedBox(
                    // width: double.,
                    height: 100.h,
                    child: Wrap(
                      spacing: 8.w,
                      runSpacing: 4.h,
                      children: List.generate(
                        describeYourselfSuggestions.length,
                        (i) => suggestionChip(
                          describeYourselfSuggestions[i],
                        ),
                      ),
                    ),
                  ),
                ),
                
              ],
            ),
            8.verticalSpace,
            ButtonWithArrow( 
              onTap: () => Get.to(() => AddMentalSymptomView()),
              
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
