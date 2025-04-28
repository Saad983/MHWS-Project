import 'package:mhws/model/gratitue_model.dart';
import 'package:mhws/view/home/therapist_fragment/therapist_profile_view.dart';
import 'package:mhws/view/utils/export_all.dart';
import 'package:mhws/view/widget/app_bar/sos_app_bar.dart';
import 'package:mhws/view/widget/buttons/primary_button.dart';

class TherapistFragmentView extends StatelessWidget {
  TherapistFragmentView({super.key});

  final List<GratitueModel> gratitudes = [
    GratitueModel("Happy", AssetImages.happyGratitude),
    GratitueModel("Calm", AssetImages.calmGratitude),
    GratitueModel("Manic", AssetImages.manicGratitude),
    GratitueModel("Angry", AssetImages.angryGratitude),
    GratitueModel("Sad", AssetImages.sadGratitude),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: SosAppBar(
        showLeading: true,
        backToHome: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 25.w,
          vertical: 20.h,
        ),
        children: [
          20.verticalSpace,
          Text(
            "Get a Therapist",
            style: GoogleFonts.archivoBlack(
              color: G.onPrimaryColor,
              fontSize: 32.sp,
            ),
          ),
          10.verticalSpace,
          Row(
            children: [
              13.horizontalSpace,
              Text(
                "Book Session",
                style: GoogleFonts.epilogue(
                  color: G.onPrimaryColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Spacer(),
              SizedBox(
                height: 16.h,
                width: 12.w,
                child: Image.asset(AssetImages.replaceIcon),
              )
            ],
          ),
          20.verticalSpace,
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (_, i) => sessionCard(i == 0),
            separatorBuilder: (_, i) => 10.verticalSpace,
            itemCount: 3,
          ),
        ],
      ),
    );
  }

  Widget sessionCard(bool isActive) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Color(0xff2E5A3E),
        borderRadius: BorderRadius.circular(
          20.r,
        ),
      ),
      child: Column(
        children: [
          10.verticalSpace,
          Row(
            children: [
              Container(
                width: 35.w,
                height: 35.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Color(0x78F09E54),
                    width: 2,
                  ),
                ),
                child: Image.asset(
                  AssetImages.therapist2,
                ),
              ),
              17.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sahana V",
                    style: GoogleFonts.rubik(
                      color: Color(0xffC8FFF3),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "Msc in Clinical Psychology",
                    style: GoogleFonts.rubik(
                      color: Color(0xffC8FFF3),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              )
            ],
          ),
          8.verticalSpace,
          Divider(
            height: 1,
            color: Color(0x4DD9D8D8),
          ),
          10.verticalSpace,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.calendar_month_outlined,
                color: G.primaryColor,
                size: 15.sp,
              ),
              5.horizontalSpace,
              Text(
                "31st March ‘22",
                style: GoogleFonts.rubik(
                  color: G.onPrimaryColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              15.horizontalSpace,
              Icon(
                Icons.access_time_rounded,
                color: G.primaryColor,
                size: 15.sp,
              ),
              5.horizontalSpace,
              Text(
                "7:30 PM - 8:30 PM",
                style: GoogleFonts.rubik(
                  color: G.onPrimaryColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          15.verticalSpace,
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  if (!isActive) {
                    Get.to(() => TherapistProfileView());
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  backgroundColor: Color(0xC428B294),
                  fixedSize: Size(117.w, 40.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      9.r,
                    ),
                  ),
                ),
                child: Center(
                  child: Text(
                    isActive ? "Reschedule" : "Re-book",
                    style: GoogleFonts.epilogue(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              20.horizontalSpace,
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  fixedSize: Size(117.w, 40.h),
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                ),
                child: Center(
                  child: Text(
                    isActive ? "Join Now" : "View Profile",
                    style: GoogleFonts.epilogue(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffFFC107),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
