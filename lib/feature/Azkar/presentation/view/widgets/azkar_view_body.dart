import 'package:flutter/material.dart';
import 'package:islami_app/feature/Azkar/presentation/view/widgets/azkar_item_grig_view.dart';

class AzkarViewBody extends StatelessWidget {
  const AzkarViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: AzkarItemGrigView(),
        ),
        SizedBox(
          height: 60,
        ),
      ],
    );
  }
}