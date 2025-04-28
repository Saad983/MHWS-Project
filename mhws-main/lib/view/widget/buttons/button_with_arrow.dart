import 'package:mhws/view/utils/export_all.dart';

class ButtonWithArrow extends StatelessWidget {
  final String? text;
  final String? icon;
  final Color? iconColor;
  final Color? bgColor;
  final Color? color;
  final double? width;
  final VoidCallback? onTap;
  final TextStyle? textStyle;
  const ButtonWithArrow({
    super.key,
    this.text,
    this.icon,
    this.iconColor,
    this.color,
    this.bgColor,
    this.width,
    this.onTap,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap ?? () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor ?? G.primaryColor,
        fixedSize: Size(
          width ?? 316.w,
          56.h,
        ),
        padding: EdgeInsets.zero,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text ?? '',
            style: textStyle ??
                GoogleFonts.urbanist(
                  color: color ?? G.onPrimaryColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w800,
                ),
          ),
          12.horizontalSpace,
          Image.asset(
            icon ?? AssetImages.arrowForward,
            width: 24.w,
            height: 24.h,
            color: iconColor ?? G.onPrimaryColor,
          ),
        ],
      ),
    );
  }
}
