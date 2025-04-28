import 'package:mhws/controllers/nav_bar_controller.dart';
import 'package:mhws/view/home/settings_view.dart';
import 'package:mhws/view/home/sos_view.dart';
import 'package:mhws/view/utils/export_all.dart';

class SosAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool? showLeading;
  final bool? backToHome;
  final bool? showSetting;
  final VoidCallback? onLeading;
  final Widget? title;
  final List<Widget>? actions;
  SosAppBar({
    super.key,
    this.showLeading,
    this.backToHome,
    this.showSetting,
    this.onLeading,
    this.title,
    this.actions,
  });

  final NavBarController controller = Get.put(NavBarController());

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      automaticallyImplyLeading: false,
      title: title,
      leading: (showLeading ?? false)
          ? GestureDetector(
              onTap: onLeading ??
                  ((backToHome ?? false)
                      ? () {
                          controller.changeTabIndex(2);
                        }
                      : null),
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: G.onPrimaryColor,
                size: 20.sp,
              ),
            )
          : null,
      actions: actions ??
          [
            GestureDetector(
              onTap: () => Get.to(() => SOSView()),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    32.r,
                  ),
                  color: Color(0xffFFB812),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 5.h,
                ),
                child: Text(
                  "SOS",
                  style: GoogleFonts.urbanist(
                    color: Color(0xff886003),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            15.horizontalSpace,
            if (showSetting ?? true) ...[
              GestureDetector(
                onTap: () => Get.to(() => SettingsView()),
                child: SizedBox.square(
                  dimension: 25.w,
                  child: Image.asset(AssetImages.setting),
                ),
              ),
              15.horizontalSpace
            ],
          ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
