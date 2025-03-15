import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:islami_app/core/errors/failures.dart';
import 'package:islami_app/core/utils/api_service.dart';
import 'package:islami_app/feature/quran/data/models/quran_model/ayah.dart';
import 'package:islami_app/feature/quran/data/models/quran_model/surah.dart';
import 'package:islami_app/feature/quran/data/repos/quran_repo.dart';

class QuranRepoImpl implements QuranRepo {
  final ApiService apiService;

  QuranRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<Ayah>>> fetchAyahs(int surahNumber) async {
    try {
      var response = await apiService.get(
          url: 'http://api.alquran.cloud/v1/surah/$surahNumber');
      final List<Ayah> ayahs = (response['data']['ayahs'] as List)
          .map((e) => Ayah.fromJson(e))
          .toList();

      return right(ayahs);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailer.fromDioException(e));
      }
      return left(ServerFailer(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Surah>>> fetchSurahs() async {
    try {
      var response =
          await apiService.get(url: 'http://api.alquran.cloud/v1/surah');
      final List<Surah> surahs =
          (response['data'] as List).map((e) => Surah.fromJson(e)).toList();

      return right(surahs);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailer.fromDioException(e));
      }
      return left(ServerFailer(e.toString()));
    }
  }

  // @override
  // Future<Either<Failure, QuranModel>> fetchQuran() async {
  //   try {
  //     var response = await apiService.get(
  //         url: 'https://api.alquran.cloud/v1/quran/quran-uthmani');
  //     print('$response');
  //     return right(QuranModel.fromJson(response));
  //   } on Exception catch (e) {
  //     if (e is DioException) {
  //       return left(ServerFailer.fromDioException(e));
  //     }
  //     return left(ServerFailer(e.toString()));
  //     // TODO
  //   }
  // }
}
