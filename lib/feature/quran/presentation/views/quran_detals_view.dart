import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/feature/quran/presentation/manager/quran_cubit/quran_cubit.dart';
import 'package:islami_app/feature/quran/presentation/views/widgets/quran_details_view_body.dart';

class QuranDetalsView extends StatelessWidget {
  const QuranDetalsView({
    super.key,
    required this.surahNameAr,
    required this.surahNameEn,
  });
  final String surahNameAr, surahNameEn;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        context.read<QuranCubit>().getSurahs();
      },
      child: Scaffold(
          body: QuranDetailsViewBody(
        surahNameAr: surahNameAr,
        surahNameEn: surahNameEn,
      )),
    );
  }
}
