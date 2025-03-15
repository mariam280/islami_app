import 'package:flutter/material.dart';
import 'package:islami_app/constant.dart';
import 'package:islami_app/core/utils/app_styles.dart';

class AzkarDetailsItem extends StatelessWidget {
  const AzkarDetailsItem(
      {super.key, this.onTap, required this.text, required this.count});
  final Function()? onTap;
  final String text;
  final int count;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
            text,
            style: AppStyles.styleBold20(context)
                .copyWith(color: Color(0xFFE2BE7F), height: 1.7),
            textAlign: TextAlign.center),
        SizedBox(
          height: 40,
        ),
        InkWell(
          onTap: () {},
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            height: 50,
            decoration: ShapeDecoration(
              color: Color(0xFFE2BE7F),
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: Color(0xFFE2BE7F)),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: InkWell(
              onTap: onTap,
              child: Text(
                count.toString(),
                style: AppStyles.styleBold20(context).copyWith(fontSize: 30),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        Divider(
          height: 40,
          color: kPrimaryolor,
          indent: 30,
          endIndent: 30,
        ),
      ],
    );
  }
}
