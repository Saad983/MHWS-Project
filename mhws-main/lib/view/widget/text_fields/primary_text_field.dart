import 'package:mhws/view/utils/export_all.dart';

class PrimaryTextField extends StatelessWidget {
  final String? label;
  final TextEditingController? controller;
  const PrimaryTextField({
    super.key,
    this.label,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 316.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if ((label ?? "").isNotEmpty) ...[
            Text(
              label ?? "",
              style: GoogleFonts.poppins(
                color: G.onPrimaryColor,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            5.verticalSpace,
          ],
          TextFormField(
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
            controller: controller,
            decoration: InputDecoration(
              fillColor: Color(0xffE6E6E6),
              filled: true,
              hintText: label ?? "",
              contentPadding: EdgeInsets.symmetric(
                vertical: 11.h,
                horizontal: 18.w,
              ),
              hintStyle: GoogleFonts.poppins(
                color: Color(0xffC4C4C4),
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
              border: allBorder(),
              focusedBorder: allBorder(),
              errorBorder: allBorder(),
              enabledBorder: allBorder(),
              disabledBorder: allBorder(),
              focusedErrorBorder: allBorder(),
            ),
          ),
        ],
      ),
    );
  }

  InputBorder allBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        6.r,
      ),
      borderSide: BorderSide(
        color: Color(0xffC4C4C4),
        width: 3,
      ),
    );
  }
}
