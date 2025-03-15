import 'package:dartz/dartz.dart';
import 'package:islami_app/core/errors/failures.dart';
import 'package:islami_app/feature/quran/data/models/quran_model/ayah.dart';
import 'package:islami_app/feature/quran/data/models/quran_model/surah.dart';

abstract class QuranRepo {
 // Future<Either<Failure, QuranModel>> fetchQuran();
 Future<Either<Failure, List<Surah>>> fetchSurahs();
  Future<Either<Failure, List<Ayah>>> fetchAyahs(int surahNumber);
}
