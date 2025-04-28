import 'package:mhws/view/utils/export_all.dart';

class SecondaryPasswordField extends StatelessWidget {
  final String? label;
  SecondaryPasswordField({
    super.key,
    this.label,
  });

  RxBool isObsecure = true.obs;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 316.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label ?? "Password",
            style: GoogleFonts.outfit(
              color: G.onPrimaryColor,
              fontSize: 15.sp,
            ),
          ),
          10.verticalSpace,
          Obx(
            () => TextFormField(
              obscureText: isObsecure.value,
              style: GoogleFonts.outfit(
                color: Colors.white,
                fontSize: 15.sp,
              ),
              decoration: InputDecoration(
                suffixIcon: GestureDetector(
                  onTap: () => isObsecure.value = !isObsecure.value,
                  child: Icon(
                    isObsecure.value ? Icons.visibility_off : Icons.visibility,
                    color:
                        !isObsecure.value ? G.primaryColor : Color(0xffC4C4C4),
                  ),
                ),
                fillColor: Colors.transparent,
                filled: true,
                hintText: "Password",
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
