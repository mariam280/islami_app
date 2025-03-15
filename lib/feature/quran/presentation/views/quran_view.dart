import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_images.dart';
import 'package:islami_app/feature/quran/presentation/views/widgets/quran_view_body.dart';

class QuranView extends StatelessWidget {
  const QuranView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.imagesTimeAzkarScreen)),
        ),
        child: QuranViewBody(),
      ),
    );
  }
}
