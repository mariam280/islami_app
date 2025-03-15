part of 'quran_cubit.dart';

sealed class QuranState extends Equatable {
  const QuranState();

  @override
  List<Object> get props => [];
}

final class QuranInitial extends QuranState {}

final class QuranLoading extends QuranState {}

 final class QuranSurahsSuccess extends QuranState {
  final List<Surah> surahs;

 const QuranSurahsSuccess(this.surahs);
}

 final class QuranAyahsSuccess extends QuranState {
  final List<Ayah> ayahs;

const  QuranAyahsSuccess(this.ayahs);
}

final class QuranFailure extends QuranState {
  final String errMessage;

 const QuranFailure(this.errMessage);
}
