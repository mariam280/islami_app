import 'package:equatable/equatable.dart';

import 'edition.dart';
import 'surah.dart';

class QuranModel extends Equatable {
  final List<Surah>? surahs;
  final Edition? edition;

  const QuranModel({this.surahs, this.edition});

  factory QuranModel.fromJson(Map<String, dynamic> json) => QuranModel(
        surahs: (json['surahs'] as List<dynamic>?)
            ?.map((e) => Surah.fromJson(e as Map<String, dynamic>))
            .toList(),
        edition: json['edition'] == null
            ? null
            : Edition.fromJson(json['edition'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'surahs': surahs?.map((e) => e.toJson()).toList(),
        'edition': edition?.toJson(),
      };

  @override
  List<Object?> get props => [surahs, edition];
}
