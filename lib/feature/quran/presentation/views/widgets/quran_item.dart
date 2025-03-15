import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_styles.dart';

class QuranItem extends StatelessWidget {
  const QuranItem(
      {super.key,
      required this.id,
      required this.nameAr,
      required this.nameEn,
      required this.kind});
  final int id;
  final String nameAr;
  final String nameEn;
  final String kind;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Text(
              '$id',
              style: AppStyles.styleBold16(context).copyWith(
                color: Colors.black,
              ),
            ),
          ),
          title: Text(
            nameEn,
            style: AppStyles.styleBold20(context).copyWith(
              color: Colors.white,
            ),
          ),
          subtitle: Text(
            kind,
            style: AppStyles.styleBold16(context).copyWith(
              color: Colors.grey,
            ),
          ),
          trailing: Text(
            nameAr,
            style: AppStyles.styleBold20(context).copyWith(
              color: Colors.white,
            ),
          ),
        ),
        Divider(
          height: 40,
          color: Colors.white,
          indent: 30,
          endIndent: 30,
        ),
      ],
    );
  }
}
