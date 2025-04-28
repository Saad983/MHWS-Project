import 'package:mhws/model/gratitue_model.dart';
import 'package:mhws/view/home/sos_view.dart';
import 'package:mhws/view/utils/export_all.dart';
import 'package:mhws/view/widget/app_bar/sos_app_bar.dart';

class HomeFragmentView extends StatelessWidget {
  HomeFragmentView({super.key});

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
        showLeading: false,        
        title: Text(
          "Welcome, Jerry",
          style: GoogleFonts.urbanist(
            color: G.onPrimaryColor,
            fontSize: 20.sp,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.only(
          left: 25.w,
          top: 20.h,
          bottom: 20.h,
        ),
        children: [
          Text(
            "Therapist",
            style: GoogleFonts.urbanist(
              color: G.onPrimaryColor,
              fontSize: 29.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          22.verticalSpace,
          SizedBox(
            height: 120.h,
            width: double.infinity,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 2,
              itemBuilder: (_, i) => therapistCard(),
              separatorBuilder: (_, i) => 20.horizontalSpace,
            ),
          ),
          30.verticalSpace,
          Text(
            "Meditation",
            style: GoogleFonts.urbanist(
              color: G.onPrimaryColor,
              fontSize: 29.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          22.verticalSpace,
          SizedBox(
            height: 170.h,
            width: double.infinity,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (_, i) => i.isEven
                  ? meditationCard(
                      "Focus",
                      AssetImages.focusMeditation,
                    )
                  : meditationCard(
                      "Happiness",
                      AssetImages.happyMeditation,
                    ),
              separatorBuilder: (_, i) => 20.horizontalSpace,
            ),
          ),
          30.verticalSpace,
          Text(
            "Gratitude Journal",
            style: GoogleFonts.inter(
              color: G.onPrimaryColor,
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          20.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              gratitudes.length,
              (i) => Column(
                children: [
                  SizedBox.square(
                    dimension: 50.w,
                    child: Image.asset(
                      gratitudes[i].image,
                    ),
                  ),
                  5.verticalSpace,
                  Text(
                    gratitudes[i].title,
                    style: GoogleFonts.epilogue(
                      color: Color(0xff828282),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ).paddingOnly(
            right: 25.w,
          ),
          22.verticalSpace,
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
            ),
            decoration: BoxDecoration(
              color: Color(0xff2E5A3E),
              borderRadius: BorderRadius.circular(
                20.r,
              ),
            ),
            child: Column(
              children: [
                Text(
                  "Tuesday 17 Dec",
                  style: GoogleFonts.inter(
                    color: Color(0xffFFC107),
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                15.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 63.w,
                          height: 63.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              6.r,
                            ),
                            color: Color(0xffE1E5D0),
                          ),
                        ),
                        16.horizontalSpace,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Feeling",
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 12.sp,
                              ),
                            ),
                            Text(
                              "Okay",
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Focused +1 more ",
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 12.sp,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      "Mood",
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
                15.verticalSpace,
              ],
            ),
          ).paddingOnly(
            right: 25.w,
          ),
        ],
      ),
    );
  }

  Widget meditationCard(String title, String image) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 113.h,
          width: 162.w,
          child: Image.asset(
            image,
          ),
        ),
        10.verticalSpace,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.urbanist(
                color: G.onPrimaryColor,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "MEDITATION  ●  3-10 MIN",
              style: GoogleFonts.urbanist(
                color: Color(0xffA1A4B2),
                fontSize: 11.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ).paddingOnly(
          left: 5.w,
        ),
      ],
    );
  }

  Widget therapistCard() {
    return Container(
      height: 118.h,
      width: 286.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          32.r,
        ),
        color: G.primaryColor,
        border: Border.all(
          color: G.brown,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0x40926247),
            offset: Offset(0, 0),
            spreadRadius: 4,
            blurRadius: 0,
          ),
        ],
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Today, 4:30 pm",
                style: GoogleFonts.urbanist(
                  color: G.onPrimaryColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                "Meetings with Dr. Chan ",
                style: GoogleFonts.urbanist(
                  color: G.onPrimaryColor,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Text(
                "At CUHK Medical Center",
                style: GoogleFonts.urbanist(
                  color: G.onPrimaryColor,
                  fontSize: 8.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ).paddingSymmetric(
            horizontal: 16.w,
            vertical: 16.h,
          ),
          Spacer(),
          SizedBox(
            width: 107.w,
            height: 118.h,
            child: Image.asset(
              AssetImages.therapistImage,
            ),
          ),
          10.horizontalSpace,
        ],
      ),
    );
  }
}
