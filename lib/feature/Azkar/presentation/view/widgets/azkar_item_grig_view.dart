import 'package:flutter/material.dart';
import 'package:islami_app/feature/Azkar/data/json_servise.dart';
import 'package:islami_app/feature/Azkar/data/models/zeker_json_model.dart/zeker_json_model.dart';
import 'package:islami_app/feature/Azkar/presentation/view/azkar_details_view.dart';
import 'package:islami_app/feature/Azkar/presentation/view/widgets/azkar_item.dart';

class AzkarItemGrigView extends StatelessWidget {
  const AzkarItemGrigView({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Azkar>>(
      future: AzkarProvider.loadAzkar(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('حدث خطأ في تحميل البيانات'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('لا توجد بيانات متاحة'));
        }

        List<Azkar> azkarCategories = snapshot.data!;

        return Padding(
          padding: const EdgeInsets.only(
            right: 20,
            left: 20,
            top: 170,
            bottom: 10,
          ),
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 185 / 259),
              itemCount: azkarCategories.length,
              itemBuilder: (context, index) {
                Azkar category = azkarCategories[index];
                return AzkarItem(
                  title: category.category,
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return AzkarDetailsView(
                        category: category,
                      );
                    }));
                  },
                );
              }),
        );
      },
    );
  }
}