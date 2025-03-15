import 'package:flutter/material.dart';
import 'package:islami_app/feature/Azkar/data/models/zeker_json_model.dart/zeker_json_model.dart';
import 'package:islami_app/feature/Azkar/presentation/view/widgets/azkar_details_item.dart';

class AzkarDetailsItemList extends StatefulWidget {
  const AzkarDetailsItemList({
    super.key,
    required this.category,
  });
  final Azkar category;

  @override
  State<AzkarDetailsItemList> createState() => _AzkarDetailsItemListState();
}

class _AzkarDetailsItemListState extends State<AzkarDetailsItemList> {
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
        itemCount: widget.category.azkar.length,
        itemBuilder: (context, index) {
          final zekr = widget.category.azkar[index];
          return Padding(
            padding: const EdgeInsets.only(top: 30),
            child: AzkarDetailsItem(
              text: zekr.content,
              count: zekr.count,
              onTap: () {
                setState(() {
                  if (zekr.count > 0) {
                  zekr.count--;
                }
                });
              },
            ),
          );
        });
  }
}