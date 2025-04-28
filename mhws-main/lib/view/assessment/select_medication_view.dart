import 'package:mhws/controllers/assessment_controller.dart';
import 'package:mhws/view/assessment/describe_yourself_view.dart';
import 'package:mhws/view/utils/export_all.dart';
import 'package:mhws/view/widget/buttons/button_with_arrow.dart';
import 'package:mhws/view/widget/tiles/assessment_counter_tile.dart';

class SelectMedicationView extends StatelessWidget {
  SelectMedicationView({super.key});

   

  final List<MedicationOption> options = [
    MedicationOption(
      'Prescribed Medications',
      AssetImages.drugContainer,
    ),
    MedicationOption(
      'Over the Counter Supplements',
      AssetImages.medicalStore,
    ),
    MedicationOption(
      'I’m not taking any',
      AssetImages.pill,
    ),
    MedicationOption(
      'Prefer not to say',
      AssetImages.close,
    ),
  ];
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
              initial: 9,
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
                  "Are you taking any medications?",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.outfit(
                    color: G.onPrimaryColor,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                40.verticalSpace,
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.w,
                    mainAxisSpacing: 16.h,
                  ),
                  itemCount: options.length,
                  itemBuilder: (_, i) => medicationTile(options[i]),
                ),
                48.verticalSpace,
                ButtonWithArrow(
                  onTap: () => Get.to(() => DescribeYourselfView()),
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

  Widget medicationTile(MedicationOption option) {
    return GetBuilder<AssessmentController>(builder: (controller) {
      final bool isSelected = controller.medication == option.title;

      return GestureDetector(
        onTap: () => controller.setMedication(option.title),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox.square(
                dimension: 24.h,
                child: Image.asset(
                  option.image,
                  color: isSelected ? G.onPrimaryColor : G.brown,
                ),
              ),
              Text(
                option.title,
                style: GoogleFonts.urbanist(
                  color: isSelected ? G.onPrimaryColor : Color(0xff4F3422),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class MedicationOption {
  final String title;
  final String image;
  const MedicationOption(
    this.title,
    this.image,
  );
}
