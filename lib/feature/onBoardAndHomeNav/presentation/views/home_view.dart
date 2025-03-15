import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:islami_app/feature/Azkar/presentation/view/Azkar-view.dart';
import 'package:islami_app/feature/onBoardAndHomeNav/presentation/views/widgets/custom_nav_bar.dart';
import 'package:islami_app/feature/quran/presentation/views/quran_view.dart';
import 'package:islami_app/feature/reciters/presentation/views/reciters_view.dart';
import 'package:islami_app/feature/sebha/presentation/view/sebha_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final PageController pageController = PageController();
  int currentIndex = 0;
  void onItemTabbed(int index) {
    if (currentIndex != index) {
      pageController.animateToPage(index,
          duration: Duration(
            milliseconds: 300,
          ),
          curve: Curves.ease);
      currentIndex = index;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;

        bool exitApp = await showExitDialog(context);
        if (exitApp) {
          SystemNavigator.pop();
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            ExpandablePageView(
              controller: pageController,
              physics: NeverScrollableScrollPhysics(), 
              children: [
              AzkarView(),
              RecitersView(),
              SebhaView(),
              QuranView(),
            ]),
            Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomNavBar(
                      onTap: onItemTabbed, currentIndex: currentIndex),
                )),
          ],
        ),
      ),
    );
  }

  Future<bool> showExitDialog(BuildContext context) async {
    return await showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(
                  'Exit Confirmation',
                  style: AppStyles.styleBold24(context),
                ),
                content: Text(
                  'Do you want to exit the app',
                  style: AppStyles.styleBold16(context),
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                      child: Text(
                        'No',
                        style: AppStyles.styleBold16(context),
                      )),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(true);
                        //SystemNavigator.pop();
                      },
                      child: Text(
                        'yes',
                        style: AppStyles.styleBold16(context),
                      )),
                ],
              );
            }) ??
        false;
  }
}
