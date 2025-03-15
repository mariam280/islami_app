import 'package:flutter/material.dart';
import 'package:islami_app/constant.dart';
import 'package:islami_app/core/utils/app_styles.dart';

class AzkarDetailsViewAppBar extends StatelessWidget {
  const AzkarDetailsViewAppBar({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: kPrimaryolor,
            )),
        Flexible(
            child: SizedBox(
          width: 110,
        )),
        Center(
          child: Text(
            name,
            style: AppStyles.styleBold20(context).copyWith(
              color: kPrimaryolor,
            ),
          ),
        ),
      ],
    );
  }
}
