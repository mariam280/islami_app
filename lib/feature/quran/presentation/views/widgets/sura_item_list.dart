import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/constant.dart';
import 'package:islami_app/feature/quran/presentation/manager/quran_cubit/quran_cubit.dart';
import 'package:islami_app/feature/quran/presentation/views/widgets/sura_item.dart';

class SuraItemList extends StatelessWidget {
  const SuraItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuranCubit, QuranState>(
      builder: (context, state) {
        if (state is QuranLoading) {
          return SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(
                color: kPrimaryolor,
              ),
            ),
          );
        } else if (state is QuranAyahsSuccess){
           return SliverList.builder(
            itemCount: state.ayahs.length,
            itemBuilder: (context, index) {
              final ayah = state.ayahs[index];
              return SuraItem(
                number: ayah.number!,
                ayaText: ayah.text!,
              );
            });
        } else if (state is QuranFailure){
          return SliverToBoxAdapter(
            child: Center(
              child: Text(state.errMessage),
            ),
          );
        } return SliverToBoxAdapter(child: Center(child: Text('there was an error! '),));
      },
    );
  }
}
