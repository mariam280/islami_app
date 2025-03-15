
class Zekr {
  final String content;
   int count;    //حذفت final

  Zekr({required this.content, required this.count});

  factory Zekr.fromJson(Map<String, dynamic> json) {
    return Zekr(
      content: json['content'],
      count: int.tryParse(json['count'].toString()) ?? 1,
    );
  }
}

class Azkar {
  final String category;
  final List<Zekr> azkar;

  Azkar({required this.category, required this.azkar});

  factory Azkar.fromJson(Map<String, dynamic> json) {
    var list = json['azkar'] as List;
    List<Zekr> azkarList = list.map((i) => Zekr.fromJson(i)).toList();
    return Azkar(category: json['category'], azkar: azkarList);
  }
}