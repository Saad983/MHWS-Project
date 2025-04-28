import 'package:mhws/controllers/nav_bar_controller.dart';
import 'package:mhws/view/home/analytics_fragment_view.dart';
import 'package:mhws/view/home/home_fragment_view.dart';
import 'package:mhws/view/home/meditation_fragment/meditation_fragment_view.dart';
import 'package:mhws/view/home/my_jounal/my_journal_fragment_view.dart';
import 'package:mhws/view/home/therapist_fragment/therapist_fragment_view.dart';
import 'package:mhws/view/home/verses_fragment_view.dart';
import 'package:mhws/view/utils/export_all.dart';

class MainHomeView extends StatelessWidget {
  MainHomeView({super.key});
  final navBarController = Get.put(NavBarController());

  List<HomeFragmentModel> fragments = [
    HomeFragmentModel(
      VersesFragmentView(),
      AssetImages.heart,
    ),
    HomeFragmentModel(
      AnalyticsFragmentView(),
      AssetImages.barGraph,
    ),
    HomeFragmentModel(
      HomeFragmentView(),
      AssetImages.home,
    ),
    HomeFragmentModel(
      MyJournalFragmentView(),
      AssetImages.clipboard,
    ),
    HomeFragmentModel(
      TherapistFragmentView(),
      AssetImages.users,
    ),
    HomeFragmentModel(
      MeditationFragmentView(),
      AssetImages.meditation,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(AssetImages.assessmentBg),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: GetBuilder<NavBarController>(
          builder: (controller) => fragments[controller.tabIndex].body,
        ),
        bottomNavigationBar: bottomNavBar(),
      ),
    );
  }

  Widget bottomNavBar() {
    return GetBuilder<NavBarController>(
      builder: (controller) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            32.r,
          ),
          color: G.selectedColor,
        ),
        margin: EdgeInsets.only(
          left: 25.w,
          right: 25.w,
          bottom: 22.h,
        ),
        child: Row(
          children: List.generate(
            fragments.length,
            (i) => Expanded(
              child: GestureDetector(
                onTap: () => controller.changeTabIndex(i),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 7.5.h,
                    // horizontal: 14.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      100.r,
                    ),
                    color: i == controller.tabIndex
                        ? Color(0xff138B71)
                        : G.selectedColor,
                  ),
                  child: SizedBox.square(
                    dimension: 32.w,
                    child: Image.asset(
                      fragments[i].navBarIcon,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HomeFragmentModel {
  final Widget body;
  final String navBarIcon;

  const HomeFragmentModel(
    this.body,
    this.navBarIcon,
  );
}
