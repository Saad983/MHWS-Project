import 'package:mhws/view/utils/export_all.dart';

class PrimaryPasswordField extends StatelessWidget {
  final String? label;
  PrimaryPasswordField({
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
            style: GoogleFonts.poppins(
              color: G.onPrimaryColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          5.verticalSpace,
          Obx(
            () => TextFormField(
              obscureText: isObsecure.value,
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
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
                fillColor: Color(0xffE6E6E6),
                filled: true,
                hintText: label ?? "Password",
                contentPadding: EdgeInsets.symmetric(
                  vertical: 11.h,
                  horizontal: 18.w,
                ),
                hintStyle: GoogleFonts.poppins(
                  color: Color(0xffC4C4C4),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    6.r,
                  ),
                  borderSide: BorderSide(
                    color: Color(0xffC4C4C4),
                    width: 3,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
