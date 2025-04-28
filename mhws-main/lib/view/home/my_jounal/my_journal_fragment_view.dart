import 'package:mhws/model/gratitue_model.dart';
import 'package:mhws/view/home/my_jounal/my_journal_rate_sleep_view.dart';
import 'package:mhws/view/home/my_jounal/my_journal_select_mood_view.dart';
import 'package:mhws/view/home/my_jounal/write_grief_view.dart';
import 'package:mhws/view/utils/export_all.dart';
import 'package:mhws/view/widget/app_bar/sos_app_bar.dart';

class MyJournalFragmentView extends StatelessWidget {
  MyJournalFragmentView({super.key});

  final List<GratitueModel> gratitudes = [
    GratitueModel("Happy", AssetImages.happyGratitude),
    GratitueModel("Calm", AssetImages.calmGratitude),
    GratitueModel("Manic", AssetImages.manicGratitude),
    GratitueModel("Angry", AssetImages.angryGratitude),
    GratitueModel("Sad", AssetImages.sadGratitude),
  ];

  RxBool showMenu = false.obs;

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
          Text(
            "My Journal",
            style: GoogleFonts.archivoBlack(
              color: G.onPrimaryColor,
              fontSize: 32.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          25.verticalSpace,
          Text(
            "How are you feeling today ?",
            style: GoogleFonts.epilogue(
              color: G.onPrimaryColor,
              fontSize: 16.sp,
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
                    dimension: 60.w,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        16.r,
                      ),
                      child: Image.asset(
                        gratitudes[i].image,
                        fit: BoxFit.cover,
                      ),
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
          ),
          22.verticalSpace,
          journalCard("Mood"),
          16.verticalSpace,
          journalCard("Journal"),
        ],
      ),
      floatingActionButton: Obx(
        () => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (showMenu.value)
              Container(
                width: 212.w,
                height: 200.h,
                margin: EdgeInsets.only(
                  right: 25.w,
                ),
                padding: EdgeInsets.only(
                  bottom: 50.w,
                  top: 3.h,
                  left: 20.w,
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      AssetImages.dropDownBg,
                    ),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    menuTile(
                      AssetImages.smileyHappy,
                      "Mood Journal",
                      onTap: () => Get.to(() => MyJournalSelectMoodView()),
                    ),
                    menuTile(
                      onTap: () => Get.to(() => RateSleepQualityView()),
                      AssetImages.hotelBed,
                      "Rate Sleep",
                      iconSize: 25.w,
                    ),
                    menuTile(
                      onTap: () => Get.to(() => WriteGriefView()),
                      AssetImages.cloud,
                      "Greif Journal",
                    ),
                  ],
                ),
              ),
            5.verticalSpace,
            GestureDetector(
              onTap: () => showMenu.value = !showMenu.value,
              child: CircleAvatar(
                radius: 19.r,
                backgroundColor: G.primaryColor,
                child: Icon(
                  Icons.add,
                  size: 30.sp,
                  color: G.onPrimaryColor,
                ),
              ).paddingOnly(
                right: 10.w,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget menuTile(
    String image,
    String title, {
    VoidCallback? onTap,
    double? iconSize,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 30.w,
            child: SizedBox.square(
              dimension: iconSize ?? 30.w,
              child: Image.asset(
                image,
                // height: 30.h,
                // width: 30.w,
              ),
            ),
          ),
          20.horizontalSpace,
          Text(
            title,
            style: GoogleFonts.inter(
              color: G.onPrimaryColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget journalCard(String mood) => Container(
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
                  mood,
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
      );
}
