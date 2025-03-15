import 'package:flutter/material.dart';
import 'package:islami_app/feature/onBoardAndHomeNav/presentation/views/home_view.dart';
import 'package:islami_app/feature/onBoardAndHomeNav/presentation/views/widgets/intro_view_row_bottom.dart';
import 'package:islami_app/feature/onBoardAndHomeNav/presentation/views/widgets/on_board_item_page_view.dart';

class OnBoardViewBody extends StatelessWidget {
  const OnBoardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OnBoardPageView(),
    );
  }
}

class OnBoardPageView extends StatefulWidget {
  const OnBoardPageView({super.key});

  @override
  State<OnBoardPageView> createState() => _OnBoardPageViewState();
}

class _OnBoardPageViewState extends State<OnBoardPageView> {
  late PageController pageController;
  int currentPageIndex = 0;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      currentPageIndex = pageController.page!.round();
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        OnBoardItemPageView(
          pageController: pageController,
        ),
        Positioned(
            right: 10,
            left: 10,
            bottom: 10,
            child: IntroViewRowBottom(
              currentPageIndex: currentPageIndex,
              onTapBack: () {
                pageController.animateToPage(currentPageIndex - 1,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.linear);
              },
              onTapNext: () {
                if (currentPageIndex == 4) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return HomeView();
                  }));
                } else {
                  pageController.animateToPage(currentPageIndex + 1,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.linear);
                }
              },
              next: currentPageIndex == 4 ? 'Finish' : 'Next',
              back: currentPageIndex == 0 ? '' : 'Back',
            ))
      ],
    );
  }
}
