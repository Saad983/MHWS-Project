import 'dart:developer';

import 'package:mhws/view/utils/export_all.dart';
import 'package:mhws/view/widget/app_bar/sos_app_bar.dart';
import 'package:mhws/view/widget/chart/analytics_chart.dart';

class AnalyticsFragmentView extends StatelessWidget {
  const AnalyticsFragmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: SosAppBar(
        showLeading: true,
        backToHome: true,
        title: Text(
          "Analytics",
          style: GoogleFonts.urbanist(
            color: G.onPrimaryColor,
            fontSize: 20.sp,
            fontWeight: FontWeight.w800,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () => log("message"),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  32.r,
                ),
                color: Color(0xffFF936C),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 5.h,
              ),
              child: Text(
                "Low",
                style: GoogleFonts.urbanist(
                  color: Color(0xffC31010),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          15.horizontalSpace,
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 25.w,
          vertical: 20.h,
        ),
        children: [
          26.verticalSpace,
          Text(
            "Checkout your recent performance",
            style: GoogleFonts.urbanist(
              color: G.onPrimaryColor,
              fontSize: 30.sp,
              fontWeight: FontWeight.w800,
            ),
            textAlign: TextAlign.center,
          ),
          26.verticalSpace,
          Text(
            "Weekly Report",
            style: GoogleFonts.urbanist(
              color: G.onPrimaryColor,
              fontSize: 30.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
          26.verticalSpace,
          Container(
            decoration: BoxDecoration(
              color: G.primaryColor,
              borderRadius: BorderRadius.circular(
                32.r,
              ),
            ),
            padding: EdgeInsets.all(4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                dayReport(
                  "Sat",
                  AssetImages.redDepressedEmoji,
                ),
                dayReport(
                  "Sun",
                  AssetImages.blueSadEmoji,
                ),
                dayReport(
                  "Mon",
                  AssetImages.brownNeutralEmoji,
                ),
                dayReport(
                  "Tue",
                  AssetImages.blueSadEmoji,
                ),
                dayReport(
                  "Wed",
                  AssetImages.blueSadEmoji,
                ),
                dayReport(
                  "Thu",
                  AssetImages.blueSadEmoji,
                ),
                dayReport(
                  "Fri",
                  AssetImages.redDepressedEmoji,
                ),
              ],
            ),
          ),
          26.verticalSpace,
          Text(
            "Monthly Report",
            style: GoogleFonts.urbanist(
              color: G.onPrimaryColor,
              fontSize: 30.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
          26.verticalSpace,
          AnalyticBarChart(),
          // Image.asset(AssetImages.barChart)
        ],
      ),
    );
  }

  Widget dayReport(String day, String image) {
    return SizedBox(
      height: 90.h,
      width: 47.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox.square(
            dimension: 33.w,
            child: Image.asset(
              image,
            ),
          ),
          10.verticalSpace,
          Text(
            day,
            style: GoogleFonts.urbanist(
              color: G.onPrimaryColor,
              fontSize: 20.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}
