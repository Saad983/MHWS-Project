import 'package:mhws/view/utils/export_all.dart';

class SecondaryTextField extends StatelessWidget {
  final String? label;
  final String? hint;
  const SecondaryTextField({
    super.key,
    this.label,
    this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 334.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if ((label ?? "").isNotEmpty) ...[
            Text(
              label ?? "",
              style: GoogleFonts.outfit(
                color: G.onPrimaryColor,
                fontSize: 15.sp,
              ),
            ),
            10.verticalSpace,
          ],
          TextFormField(
            style: GoogleFonts.outfit(
              color: Colors.white,
              fontSize: 15.sp,
            ),
            decoration: InputDecoration(
              fillColor: Colors.transparent,
              filled: true,
              hintText: hint ?? "",
              contentPadding: EdgeInsets.symmetric(
                vertical: 11.h,
                horizontal: 18.w,
              ),
              hintStyle: GoogleFonts.outfit(
                color: Color(0xffBCBEC0),
                fontSize: 15.sp,
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
        color: Colors.white,
        width: 3,
      ),
    );
  }
}
