import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_images.dart';
import 'package:islami_app/feature/sebha/presentation/view/widgets/sebha_view_body_count.dart';

class SebhaView extends StatelessWidget {
  const SebhaView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(Assets.imagesSebhaScreen)),
        ),
        child: SebhaViewBodycount(),
      ),
    );
  }
}
// حذف ال Scaffold
