import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/constant.dart';
import 'package:islami_app/feature/quran/presentation/manager/quran_cubit/quran_cubit.dart';
import 'package:islami_app/feature/quran/presentation/views/quran_detals_view.dart';
import 'package:islami_app/feature/quran/presentation/views/widgets/quran_item.dart';

class QuranItemList extends StatelessWidget {
  const QuranItemList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuranCubit, QuranState>(
      builder: (context, state) {
        if (state is QuranLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: kPrimaryolor,
            ),
          );
        } else if (state is QuranSurahsSuccess) {
          return ListView.builder(
              itemCount: state.surahs.length,
              itemBuilder: (context, index) {
                final surah = state.surahs[index];
                return GestureDetector(
                  onTap: () {
                    BlocProvider.of<QuranCubit>(context).getAyahs(surah.number!);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return QuranDetalsView(
                        surahNameAr: surah.name!,
                        surahNameEn: surah.englishName!,

                      );
                    }));
                  },
                  child: QuranItem(
                      id: surah.number!,
                      nameAr: surah.name!,
                      nameEn: surah.englishName!,
                      kind: surah.revelationType!),
                );
              });
        } else if (state is QuranFailure) {
          return Center(
            child: Text(state.errMessage),
          );
        }
        return Center(child: Text('there was an error! '),);
      },
    );
  }
}
