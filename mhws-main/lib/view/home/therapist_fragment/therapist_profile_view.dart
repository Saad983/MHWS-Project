import 'dart:developer';

import 'package:mhws/view/home/therapist_fragment/book_consultation.dart';
import 'package:mhws/view/utils/export_all.dart';
import 'package:mhws/view/widget/app_bar/sos_app_bar.dart';

class TherapistProfileView extends StatelessWidget {
  TherapistProfileView({super.key});

  RxBool isAvailableToday = false.obs;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(AssetImages.authBackground),
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
            horizontal: 25.w,
            vertical: 20.h,
          ),
          children: [
            4.verticalSpace,
            Text(
              "View Profile",
              style: GoogleFonts.lato(
                color: G.onPrimaryColor,
                fontSize: 32.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            33.verticalSpace,
            Center(
              child: Container(
                width: 125.w,
                height: 125.h,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(
                    100.r,
                  ),
                ),
                child: Image.asset(
                  AssetImages.therapist2,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            10.verticalSpace,
            Text(
              "Dr. Neelam Joshi",
              style: GoogleFonts.inter(
                color: G.onPrimaryColor,
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            16.verticalSpace,
            Text(
              "25+ years of experience",
              style: GoogleFonts.poppins(
                color: Color(0xffF59D0E),
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              "Certified For Proficiency In Clinical Medicine",
              style: GoogleFonts.poppins(
                color: Color(0xff862E2D),
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            38.verticalSpace,
            Text(
              "Dr. Sweta Gupta is an Internationally trained fertility specialist who is famous for being the best IVF doctor in Noida / Delhi. Dr. Sweta Gupta is currently working as Medical Director and Senior Consultant (Reproductive medicine and IVF) at Crysta IVF. She has more than 25 years of work experience.",
              style: GoogleFonts.poppins(
                color: Color(0xffC4C4C4),
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            38.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Today’s Availability",
                  style: GoogleFonts.inter(
                    color: Color(0xffC8FFF3),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Obx(
                  () => Switch(
                    value: isAvailableToday.value,
                    activeColor: G.primaryColor,
                    thumbColor: WidgetStatePropertyAll(G.onPrimaryColor),
                    onChanged: (val) => isAvailableToday.value = val,
                  ),
                ),
              ],
            ),
            Divider(
              color: Color(0xffF2F2F2),
              height: 32.h,
            ),
            32.verticalSpace,
            Center(
              child: ElevatedButton(
                onPressed: () => Get.to(() => BookConsultationView()),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  backgroundColor: Color(0xC428B294),
                  fixedSize: Size(169.w, 40.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      9.r,
                    ),
                  ),
                ),
                child: Center(
                  child: Text(
                    "Continue",
                    style: GoogleFonts.epilogue(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
