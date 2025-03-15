import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_images.dart';
import 'package:islami_app/feature/reciters/presentation/views/widgets/reciters_view_body.dart';

class RecitersView extends StatelessWidget {
  const RecitersView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      child: Container(
        decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage(Assets.imagesRecitersScreen)),
        ),
        child: RecitersViewBody(),
      ),
    );
  }
}
