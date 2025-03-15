import 'package:flutter/material.dart';
import 'package:islami_app/constant.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:islami_app/feature/reciters/presentation/views/widgets/reciters_item_list.dart';

class RecitersViewBody extends StatelessWidget {
  const RecitersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          SizedBox(
            height: 190,
          ),
          AspectRatio(
            aspectRatio: 390 / 40,
            child: Container(
              decoration: ShapeDecoration(
                color: kPrimaryolor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Center(
                child: Text(
                  'reciters',
                  style: AppStyles.styleBold16(context).copyWith(
                    color: Color(0xFF202020),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: CustomScrollView(
              slivers: [
                RecitersItemList(),
              ],
            ),
          ),
          SizedBox(
            height: 70,
          ),
        ],
      ),
    );
  }
}
