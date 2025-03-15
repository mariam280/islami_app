import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_images.dart';
import 'package:islami_app/feature/onBoardAndHomeNav/presentation/views/widgets/on_board_item.dart';

class OnBoardItemPageView extends StatelessWidget {
  const OnBoardItemPageView({
    super.key,
    required this.pageController,
  });
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return ExpandablePageView(
        controller: pageController,
        scrollDirection: Axis.horizontal,
        children: [
          OnBoardItem(
            image: Assets.imagesIntroScreen1,
          ),
          OnBoardItem(
            image: Assets.imagesIntroScreen2,
          ),
          OnBoardItem(
            image: Assets.imagesIntroScreen3,
          ),
          OnBoardItem(
            image: Assets.imagesIntroScreen4,
          ),
          OnBoardItem(
            image: Assets.imagesIntroScreen5,
          ),
        ]);
  }
}
