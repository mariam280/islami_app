import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:islami_app/feature/quran/data/models/quran_model/ayah.dart';
import 'package:islami_app/feature/quran/data/models/quran_model/surah.dart';
import 'package:islami_app/feature/quran/data/repos/quran_repo.dart';

part 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  final QuranRepo quranRepo;
  QuranCubit(this.quranRepo) : super(QuranInitial());

  Future<void> getSurahs() async {
    emit(QuranLoading());
    var result = await quranRepo.fetchSurahs();
    result.fold((failure) {
      emit(QuranFailure(failure.errorMessage));
    }, (surahs) {
      emit(QuranSurahsSuccess(surahs));
    });
  }

  Future<void> getAyahs(int surahNumber) async {
    emit(QuranLoading());
    var result = await quranRepo.fetchAyahs(surahNumber);
    result.fold((failure) {
      emit(QuranFailure(failure.errorMessage));
    }, (ayahs) {
      emit(QuranAyahsSuccess(ayahs));
    });
  }
}
