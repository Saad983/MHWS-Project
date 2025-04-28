import 'package:mhws/view/utils/export_all.dart';

class PrimaryButton extends StatelessWidget {
  final String? text;
  final double? width;
  final Color? bgColor;
  final Color? bdColor;
  final VoidCallback? onTap;
  final TextStyle? textStyle;
  const PrimaryButton({
    super.key,
    this.text,
    this.bgColor,
    this.bdColor,
    this.width,
    this.onTap,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap ?? () {},
      style: ElevatedButton.styleFrom(
        elevation: bgColor == Colors.transparent ? 0.0 : null,
        backgroundColor: bgColor ?? G.primaryColor,
        shape: bdColor != null ? RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.r),
          side: BorderSide(
            color: bdColor ?? bgColor ?? G.primaryColor,
            

          )
        ) : null,
        fixedSize: Size(
          width ?? 316.w,
          50.h,
        ),
        padding: EdgeInsets.zero,
      ),
      child: Center(
        child: Text(
          text ?? '',
          style: textStyle ??
              GoogleFonts.poppins(
                color: G.onPrimaryColor,
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
        ),
      ),
    );
  }
}
