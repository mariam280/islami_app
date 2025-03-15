import 'package:hive/hive.dart';

part 'radio_model.g.dart';

@HiveType(typeId: 0)
class RadioModel {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String url;

  @HiveField(2)
  final bool isFavorite;

  @HiveField(3) // إضافة هذا السطر للحقل الجديد
  final bool isRepeating;

  RadioModel({
    required this.name,
    required this.url,
    required this.isFavorite,
    required this.isRepeating, // تأكد من إضافته هنا أيضًا
  });

  // دالة copyWith لتحديث القيم دون تغيير الكائن الأصلي
  RadioModel copyWith({
    String? name,
    String? url,
    bool? isFavorite,
    bool? isRepeating,
  }) {
    return RadioModel(
      name: name ?? this.name,
      url: url ?? this.url,
      isFavorite: isFavorite ?? this.isFavorite,
      isRepeating: isRepeating ?? this.isRepeating, // إضافة المتغير الجديد
    );
  }
}





/*import 'package:hive/hive.dart';

part 'radio_model.g.dart';

@HiveType(typeId: 0)
class RadioModel {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String url;

  @HiveField(2)
  final bool isFavorite;

  RadioModel({
    required this.name,
    required this.url,
    required this.isFavorite,
  });

  //  دالة copyWith لتحديث القيم دون تغيير الكائن الأصلي
  RadioModel copyWith({
    String? name,
    String? url,
    bool? isFavorite,
  }) {
    return RadioModel(
      name: name ?? this.name,
      url: url ?? this.url,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}*/
