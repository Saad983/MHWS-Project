import 'dart:developer';

import 'package:mhws/view/utils/export_all.dart';
import 'package:mhws/view/widget/app_bar/sos_app_bar.dart';
import 'package:table_calendar/table_calendar.dart';

class BookConsultationView extends StatelessWidget {
  BookConsultationView({super.key});

  Rx<DateTime> selectedDate = Rx(DateTime.now());
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
              "Book Consultation",
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
            20.verticalSpace,
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0x87FFF459),
                  width: 1,
                ),
              ),
              child: Obx(
                () => TableCalendar(
                  firstDay: DateTime.now(),
                  focusedDay: selectedDate.value,
                  lastDay: DateTime(2050),
                  selectedDayPredicate: (day) {
                    return isSameDay(selectedDate.value, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    selectedDate.value = focusedDay;
                    log(selectedDate.value.toString());
                    //  focusedDay = selectedDay;
                  },
                  headerStyle: HeaderStyle(
                    titleCentered: true,
                    leftChevronIcon: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Color(0x87FFF459),
                    ),
                    rightChevronIcon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Color(0x87FFF459),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        10.r,
                      ),
                    ),
                    titleTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                    ),
                    formatButtonVisible: false,
                  ),
                  calendarFormat: CalendarFormat.month,
                  onFormatChanged: (format) {
                    // setState(() {
                    //   _calendarFormat = format;
                    // });
                  },
                  calendarStyle: CalendarStyle(
                    selectedDecoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Color(0x87FFF459),
                    ),
                    holidayTextStyle: TextStyle(
                      color: Color(0x87FFF459),
                    ),
                    outsideTextStyle: TextStyle(
                      color: Color(0x87FFF459),
                    ),
                    todayTextStyle: TextStyle(
                      color: Color(0x87FFF459),
                    ),
                    weekendTextStyle: TextStyle(
                      color: Color(0x87FFF459),
                    ),
                    selectedTextStyle: TextStyle(
                      color: Colors.white,
                    ),
                    isTodayHighlighted: false,
                    disabledTextStyle: TextStyle(
                      color: Color(0x87FFF459),
                    ),
                    defaultTextStyle: TextStyle(
                      color: Color(0x87FFF459),
                    ),
                  ),
                  daysOfWeekStyle: DaysOfWeekStyle(
                    weekdayStyle: TextStyle(
                      color: Color(0x87FFF459),
                    ),
                    weekendStyle: TextStyle(
                      color: Color(0x87FFF459),
                    ),
                  ),
                ),
              ),
            ),
            32.verticalSpace,
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Get.back();
                  Get.back();
                },
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
                    "Book Session",
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
