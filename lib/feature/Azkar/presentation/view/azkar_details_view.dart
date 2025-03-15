import 'package:flutter/material.dart';
import 'package:islami_app/feature/Azkar/data/models/zeker_json_model.dart/zeker_json_model.dart';
import 'package:islami_app/feature/Azkar/presentation/view/widgets/azkar_details_view_body.dart';

class AzkarDetailsView extends StatelessWidget {
  const AzkarDetailsView({
    super.key,
    required this.category,
  });
  final Azkar category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AzkarDetailsViewBody(
        category: category,
      ),
    );
  }
}