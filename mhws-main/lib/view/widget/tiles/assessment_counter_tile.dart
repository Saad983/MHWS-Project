import 'package:mhws/view/utils/export_all.dart';

class AssessmentCounterTile extends StatelessWidget {
  final int? initial;
  final int? total;
  const AssessmentCounterTile({
    super.key,
    this.initial,
    this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 5.h,
        horizontal: 10.w,
      ),
      margin: EdgeInsets.only(
        right: 14.w,
      ),
      decoration: BoxDecoration(
        color: Color(0xffE8DDD9),
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Text(
        '${initial ?? 0} of ${total ?? 0}',
        style: GoogleFonts.urbanist(
          color: Color(0xff926247),
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
