import 'package:mhws/view/utils/export_all.dart';
import 'package:mhws/view/widget/buttons/primary_button.dart';

class MyJournalAddFeelingView extends StatelessWidget {
  MyJournalAddFeelingView({super.key});
  final List<String> options = [
    "CALM",
    "FOCUSED",
    "TIRED",
    "LONELY",
    "ENERGETIC",
    "CHEERFUL",
    "RELAXED",
    "OTHER",
  ];

  final List<int> optionsPadding = [
    48,
    30,
    25,
    70,
    50,
    20,
    30,
    20,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(AssetImages.assessmentBg),
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
            "Mood Journal",
            style: GoogleFonts.outfit(
              color: G.onPrimaryColor,
              fontSize: 20.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(
            vertical: 20.h,
            horizontal: 25.w,
          ),
          children: [
            20.verticalSpace,
            Text(
              "How are you Feeling?",
              textAlign: TextAlign.center,
              style: GoogleFonts.urbanist(
                color: G.onPrimaryColor,
                fontSize: 30.sp,
                fontWeight: FontWeight.w800,
              ),
            ),
            24.verticalSpace,
            Wrap(
              runSpacing: 8.h,
              spacing: 8.w,
              children: List.generate(
                options.length,
                (i) => Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.h,
                    horizontal: optionsPadding[i].w,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text(
                    options[i],
                    textAlign: TextAlign.center,
                    style: GoogleFonts.nunito(
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ).paddingSymmetric(
              horizontal: 25.w,
            ),
            50.verticalSpace,
            Text(
              "What Made You Smile Today?",
              textAlign: TextAlign.center,
              style: GoogleFonts.urbanist(
                color: G.onPrimaryColor,
                fontSize: 30.sp,
                fontWeight: FontWeight.w800,
              ),
            ),
            20.verticalSpace,
            TextFormField(
              decoration: InputDecoration(
                hintText: "Add a note",
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 15.w,
                ),
                hintStyle: GoogleFonts.urbanist(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w800,
                  color: Color(0xff65676F),
                ),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffF59D0E),
                  ),
                ),
                errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffF59D0E),
                  ),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffF59D0E),
                  ),
                ),
                disabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffF59D0E),
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffF59D0E),
                  ),
                ),
                focusedErrorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffF59D0E),
                  ),
                ),
              ),
            ),
            81.verticalSpace,
            PrimaryButton(
              onTap: () {
                Get.back();
                Get.back();
              },
              text: "Done",
              textStyle: GoogleFonts.urbanist(
                fontSize: 18.sp,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
