import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_images.dart';
import 'package:islami_app/feature/Azkar/data/models/zeker_json_model.dart/zeker_json_model.dart';
import 'package:islami_app/feature/Azkar/presentation/view/widgets/azkar_details_item_list.dart';
import 'package:islami_app/feature/Azkar/presentation/view/widgets/azkar_details_view_app_bar.dart';
import 'package:islami_app/feature/Azkar/presentation/view/widgets/azkar_details_view_header.dart';

class AzkarDetailsViewBody extends StatelessWidget {
  const AzkarDetailsViewBody({
    super.key,
    required this.category,
  });
  final Azkar category;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 40,
                  ),
                ),
                SliverToBoxAdapter(
                  child: AzkarDetailsViewAppBar(
                    name: 'Azkar',
                  ),
                ),
                SliverToBoxAdapter(
                  child: AzkarDetailViewHeader(
                    title: category.category,
                  ),
                ),
                AzkarDetailsItemList(
                  category: category,
                ),
              ],
            ),
          ),
        ),
        Image.asset(
          Assets.imagesMaskgroupmosque,
          alignment: Alignment.bottomCenter,
        ),
      ],
    );
  }
}