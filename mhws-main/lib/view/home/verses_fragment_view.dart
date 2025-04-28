import 'package:mhws/model/verse_type_model.dart';
import 'package:mhws/view/utils/export_all.dart';
import 'package:mhws/view/widget/app_bar/sos_app_bar.dart';

class VersesFragmentView extends StatelessWidget {
  VersesFragmentView({super.key});

  final List<VerseTypeModel> verseTypes = [
    VerseTypeModel("Happy", AssetImages.vesrseType1),
    VerseTypeModel("Sad", AssetImages.vesrseType2),
    VerseTypeModel("Demotivated", AssetImages.vesrseType3),
    VerseTypeModel("Depressed", AssetImages.vesrseType4),
    VerseTypeModel("Angry", AssetImages.vesrseType5),
    VerseTypeModel("Lonely", AssetImages.vesrseType6),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: SosAppBar(),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 25.w,
          vertical: 20.h,
        ),
        children: [
          Text(
            "Comforting Quranic Verses",
            style: GoogleFonts.lato(
              color: G.onPrimaryColor,
              fontSize: 32.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          50.h.verticalSpace,
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 30.h,
            ),
            itemCount: verseTypes.length,
            itemBuilder: (_, i) => GestureDetector(
              onTap: () => showVerse(_, verseTypes[i].title),
              child: Container(
                decoration: BoxDecoration(
                  // color: Colors.red,
                  image: DecorationImage(
                    image: AssetImage(
                      verseTypes[i].image,
                    ),
                  ),
                ),
                child: Text(
                  verseTypes[i].title,
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 25.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ).paddingOnly(
                  top: 23.h,
                  left: 17.w,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  dynamic showVerse(BuildContext _, String title) {
    return showDialog(
      context: _,
      builder: (context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 25.w,
            ),
            decoration: BoxDecoration(
              // color: Colors.red,
              borderRadius: BorderRadius.circular(
                20.r,
              ),
              image: DecorationImage(
                image: AssetImage(
                  AssetImages.vesrseBg,
                ),
                fit: BoxFit.cover,
              ),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 46.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 32.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                20.verticalSpace,
                Text(
                  "“It is better to conquer yourself than to win a thousand battles iii ammmm nnnnn”",
                  style: GoogleFonts.epilogue(
                    color: Color(0xD62B372F),
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
