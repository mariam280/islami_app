import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_app/constant.dart';
import 'package:islami_app/core/utils/app_images.dart';
import 'package:islami_app/core/utils/app_styles.dart';

class SebhaViewBody extends StatelessWidget {
  const SebhaViewBody({super.key, required this.onTap});
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Image.asset(Assets.imagesZekr),
          ),
          SizedBox(
            height: 20,
          ),
          SvgPicture.asset(Assets.imagesSebhaBody1),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: ElevatedButton(
                onPressed: onTap,
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryolor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                ),
                child: Text(
                  'Reset',
                  style: AppStyles.styleBold20(context).copyWith(
                    color: Colors.white,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
