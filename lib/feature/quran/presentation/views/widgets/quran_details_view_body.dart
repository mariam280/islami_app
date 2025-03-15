import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_images.dart';
import 'package:islami_app/feature/Azkar/presentation/view/widgets/azkar_details_view_header.dart';
import 'package:islami_app/feature/quran/presentation/views/widgets/quran_details_view_app_bar.dart';
import 'package:islami_app/feature/quran/presentation/views/widgets/sura_item_list.dart';

class QuranDetailsViewBody extends StatelessWidget {
  const QuranDetailsViewBody({
    super.key, required this.surahNameAr, required this.surahNameEn,
    
  });
  final String surahNameAr,surahNameEn;

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
                  child: QuranDetailsViewAppBar(
                    name: surahNameEn,
                  ),
                ),
                SliverToBoxAdapter(
                  child: AzkarDetailViewHeader(
                    title: surahNameAr,
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 20,
                  ),
                ),
                SuraItemList(
                 // surah: surah,
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
