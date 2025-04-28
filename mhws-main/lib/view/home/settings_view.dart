import 'package:mhws/view/utils/export_all.dart';
import 'package:mhws/view/widget/app_bar/sos_app_bar.dart';

class SettingsView extends StatelessWidget {
  SettingsView({super.key});

  RxBool isDarkMode = true.obs;
  RxBool notification = true.obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            AssetImages.authBackground,
          ),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: SosAppBar(
          showLeading: true,
          showSetting: false,
          onLeading: () => Get.back(),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: 25.w,
            vertical: 20.h,
          ),
          children: [
            8.verticalSpace,
            Text(
              "Settings",
              style: GoogleFonts.inter(
                color: G.onPrimaryColor,
                fontSize: 35.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            27.verticalSpace,
            settingContainer(
              "Account",
              [
                settingTile(
                  AssetImages.settingUser,
                  "Dark Mode",
                  () => isDarkMode.value = !isDarkMode.value,
                  action: Obx(
                    () => Switch(
                      value: isDarkMode.value,
                      activeColor: Color(0xffC8FFF3),
                      onChanged: (value) => isDarkMode.value = value,
                    ),
                  ),
                ),
                settingTile(
                  AssetImages.settingShare,
                  "Share App",
                  () {},
                ),
                settingTile(
                  AssetImages.notification,
                  "Notifications",
                  () => notification.value = !notification.value,
                  action: Obx(
                    () => Switch(
                      value: notification.value,
                      activeColor: Color(0xffC8FFF3),
                      onChanged: (value) => notification.value = value,
                    ),
                  ),
                ),
                settingTile(
                  AssetImages.lock,
                  "Privacy",
                  () {},
                ),
              ],
            ),
            16.verticalSpace,
            settingContainer(
              "Support & About",
              [
                settingTile(
                  AssetImages.card,
                  "My Subscribtion",
                  () {},
                ),
                settingTile(
                  AssetImages.info,
                  "Help & Support",
                  () {},
                ),
                settingTile(
                  AssetImages.warning,
                  "Terms and Policies",
                  () {},
                ),
                settingTile(
                  AssetImages.star,
                  "Rate App",
                  () {},
                ),
              ],
            ),
            16.verticalSpace,
            settingContainer(
              "Actions",
              [
                settingTile(
                  AssetImages.settingFlag,
                  "Report a problem",
                  () {},
                ),
                settingTile(
                  AssetImages.message,
                  "Feedback",
                  () {},
                ),
                settingTile(
                  AssetImages.logout,
                  "Log out",
                  () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget settingContainer(String title, List<Widget> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Account",
          style: GoogleFonts.inter(
            color: Color(0xffFFFDFD),
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        13.verticalSpace,
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 13.h,
          ),
          decoration: BoxDecoration(
            color: Color(0x5991D6A7),
            borderRadius: BorderRadius.circular(
              6.r,
            ),
          ),
          child: Column(
            spacing: 9.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: options,
          ),
        ),
      ],
    );
  }

  Widget settingTile(
    String image,
    String title,
    VoidCallback onTap, {
    Widget? action,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox.square(
            dimension: 30.w,
            child: Image.asset(
              image,
            ),
          ),
          30.horizontalSpace,
          Text(
            title,
            style: GoogleFonts.inter(
              color: Color(0xffFFF6F6),
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          if (action != null) ...[
            Spacer(),
            action,
          ]
        ],
      ),
    );
  }
}
