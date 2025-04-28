import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mhws/view/home/meditation_fragment/meditation_music_player_view.dart';
import 'package:mhws/view/utils/export_all.dart';
import 'package:mhws/view/widget/app_bar/sos_app_bar.dart';

class MeditationFragmentView extends StatelessWidget {
  const MeditationFragmentView({super.key});

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
            "Meditate",
            style: GoogleFonts.prompt(
              color: G.onPrimaryColor,
              fontSize: 35.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          10.verticalSpace,
          Text(
            "we can learn how to recognize when our minds are doing their normal everyday acrobatics.",
            style: GoogleFonts.prompt(
              color: G.onPrimaryColor,
              fontSize: 15.sp,
              fontWeight: FontWeight.w300,
            ),
          ),
          10.verticalSpace,
          meditationMusicTile(),
          20.verticalSpace,
          StaggeredGrid.count(
            crossAxisCount: 2,
            crossAxisSpacing: 24.w,
            mainAxisSpacing: 20.h,
            children: [
              meditationCard(
                "7 Days of Calm",
                AssetImages.meditation_1,
                210.h,
              ),
              meditationCard(
                "Anxiet Release",
                AssetImages.meditation_2,
                167.h,
              ),
              meditationCard(
                "Breathing",
                AssetImages.meditation_3,
                155.h,
              ),
              meditationCard(
                "Frustration",
                AssetImages.meditation_4,
                210.h,
              ),
              meditationCard(
                "Improve Performanee",
                AssetImages.meditation_5,
                167.h,
              ),
              meditationCard(
                "Better Sleep",
                AssetImages.meditation_6,
                167.h,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget meditationCard(
    String title,
    String image,
    double height,
  ) {
    return GestureDetector(
      onTap: () => Get.to(
        () => MeditationMusicPlayerView(
          title: title,
        ),
      ),
      child: Container(
        height: height,
        // width: 173.w,
        padding: EdgeInsets.symmetric(
          vertical: 16.h,
          horizontal: 15.w,
        ),
        decoration: BoxDecoration(
          // color: Colors.amber,
          borderRadius: BorderRadius.circular(
            10.r,
          ),
          image: DecorationImage(
            image: AssetImage(
              image,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            title,
            style: GoogleFonts.prompt(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget meditationMusicTile() {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 27.h,
        horizontal: 30.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          10.r,
        ),
        image: DecorationImage(
          image: AssetImage(
            AssetImages.meditation_7,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Daily Calm",
                style: GoogleFonts.prompt(
                  color: Color(0xff3F414E),
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              5.verticalSpace,
              Text(
                "APR 30 ● PAUSE PRACTICE",
                style: GoogleFonts.prompt(
                  color: Color(0xff5A6175),
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          CircleAvatar(
            radius: 20.r,
            backgroundColor: Color(0xff3F414E),
            child: Center(
              child: Icon(
                Icons.play_arrow_rounded,
                color: Colors.white,
                size: 25.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
