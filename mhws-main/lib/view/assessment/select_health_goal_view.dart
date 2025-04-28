import 'package:mhws/controllers/assessment_controller.dart';
import 'package:mhws/view/assessment/select_gender_view.dart';

import 'package:mhws/view/utils/export_all.dart';
import 'package:mhws/view/widget/buttons/button_with_arrow.dart';
import 'package:mhws/view/widget/tiles/assessment_counter_tile.dart';

class SelectHealthGoalView extends StatelessWidget {
  SelectHealthGoalView({super.key});

  final List<HealthGoal> goals = [
    HealthGoal("I wanna reduce stress", AssetImages.solidHeart),
    HealthGoal("I wanna try CUHK AI Therapy", AssetImages.solidRobot),
    HealthGoal("I want to cope with trauma", AssetImages.solidFlag),
    HealthGoal("I want to be a better person", AssetImages.solidMoodHappy),
    HealthGoal("Just trying out the app, mate!", AssetImages.solidMobile),
  ];

  final assessmentController = Get.put(AssessmentController());

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
              initial: 1,
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
                "What’s your health goal?",
                style: GoogleFonts.outfit(
                  color: G.onPrimaryColor,
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              48.verticalSpace,
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: 26.w,
                ),
                itemBuilder: (_, i) => healthGoalTile(goals[i]),
                separatorBuilder: (_, i) => 12.verticalSpace,
                itemCount: goals.length,
              ),
              48.verticalSpace,
              ButtonWithArrow(
                onTap: () => Get.to(() => SelectGenderView()),
                text: "Continue",
                width: 343.w,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget healthGoalTile(HealthGoal goal) {
    return GetBuilder<AssessmentController>(builder: (controller) {
      final bool isSelected = controller.goal == goal.goal;

      return GestureDetector(
        onTap: () => controller.setGoal(goal.goal),
        child: Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: isSelected ? G.selectedColor : Colors.white,
            borderRadius: BorderRadius.circular(100.r),
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
              SizedBox.square(
                dimension: 24.w,
                child: Image.asset(
                  goal.image,
                  color: isSelected ? Colors.white : Color(0xffC9C7C5),
                ),
              ),
              5.horizontalSpace,
              Text(
                goal.goal,
                style: GoogleFonts.urbanist(
                  color: isSelected ? G.onPrimaryColor : Color(0xff4F3422),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Spacer(),
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

class HealthGoal {
  final String goal;
  final String image;
  const HealthGoal(
    this.goal,
    this.image,
  );
}
