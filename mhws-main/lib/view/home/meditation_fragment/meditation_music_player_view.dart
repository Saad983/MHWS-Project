import 'package:mhws/view/utils/export_all.dart';
import 'package:mhws/view/widget/app_bar/sos_app_bar.dart';

class MeditationMusicPlayerView extends StatelessWidget {
  final String title;
  MeditationMusicPlayerView({
    super.key,
    required this.title,
  });

  RxBool isPlaying = false.obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(AssetImages.meditationBg),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: SosAppBar(
          showLeading: true,
          onLeading: () => Get.back(),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 20.h,
          ),
          children: [
            280.verticalSpace,
            Text(
              title,
              style: GoogleFonts.prompt(
                color: G.onPrimaryColor,
                fontSize: 35.sp,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            10.verticalSpace,
            Text(
              "7 DAYS OF CALM",
              style: GoogleFonts.prompt(
                color: Color(0xffA0A3B1),
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            80.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox.square(
                  dimension: 40.w,
                  child: Image.asset(
                    AssetImages.reverse_15,
                    fit: BoxFit.cover,
                  ),
                ),
                GestureDetector(
                  onTap: () => isPlaying.value = !isPlaying.value,
                  child: Container(
                    width: 112.w,
                    height: 112.h,
                    margin: EdgeInsets.symmetric(
                      horizontal: 50.w,
                    ),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0x4DBABCC6),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffFFC107),
                      ),
                      child: Center(
                        child: Obx(
                          () => Icon(
                            isPlaying.value
                                ? Icons.play_arrow_rounded
                                : Icons.pause_rounded,
                            color: Colors.black,
                            size: 40.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox.square(
                  dimension: 40.w,
                  child: Image.asset(
                    AssetImages.forward_15,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            30.verticalSpace,
            Slider(
              value: .2,
              onChanged: (_) {},
              inactiveColor: Color(0xffFFC107),
              thumbColor: Color(0xff3F414E),
              activeColor: Color(0xff3F414E),
            ),
            Text(
              "01:30",
              style: GoogleFonts.inter(
                color: Color(0xff3F414E),
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
              ),
            ).paddingOnly(
              left: 5.w,
            ),
          ],
        ),
      ),
    );
  }
}
