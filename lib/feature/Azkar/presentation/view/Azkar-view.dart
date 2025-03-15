import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_images.dart';
import 'package:islami_app/feature/Azkar/presentation/view/widgets/azkar_view_body.dart';

class AzkarView extends StatelessWidget {
  const AzkarView({super.key});

  @override
  Widget build(BuildContext context) {
    return
        SizedBox(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      child: Container(
        decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage(Assets.imagesTimeAzkarScreen)),
        ),
        child: AzkarViewBody(),
      ),
    );
  }
}
