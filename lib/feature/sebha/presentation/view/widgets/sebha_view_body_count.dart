import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:islami_app/feature/sebha/presentation/view/widgets/sebha_view_body.dart';

class SebhaViewBodycount extends StatefulWidget {
  const SebhaViewBodycount({super.key});

  @override
  State<SebhaViewBodycount> createState() => _SebhaViewBodycountState();
}

class _SebhaViewBodycountState extends State<SebhaViewBodycount> {
  List<Map<String, dynamic>> azkar = [
    {"zikr": "سبحان الله", "count": 30},
    {"zikr": "الحمد لله", "count": 30},
    {"zikr": "لا إله إلا الله", "count": 30},
    {"zikr": "الله أكبر", "count": 30},
    {"zikr": "سبحان الله وبحمده", "count": 100},
    {"zikr": "سبحان الله العظيم", "count": 100},
    {"zikr": "لا حول ولا قوة إلا بالله", "count": 30},
  ];

  int currentIndex = 0;
  int currentCount = 30;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SebhaViewBody(
          onTap: () {
            resetZikr();
          },
        ),
        Positioned(
            right: 50,
            left: 50,
            top: 380,
            bottom: 200,
            child: GestureDetector(
              onTap: () {
                decreaseCount();
              },
              child: Column(
                children: [
                  Text(
                    azkar[currentIndex]["zikr"],
                    textAlign: TextAlign.center,
                    style: AppStyles.styleBold36(context),
                  ),
                  Flexible(child: SizedBox(height: 20)),
                  Text(
                    "$currentCount",
                    style: AppStyles.styleBold36(context),
                  ),
                  Flexible(child: SizedBox(height: 20)),
                ],
              ),
            )),
      ],
    );
  }

  void decreaseCount() {
    if (currentCount > 1) {
      setState(() {
        currentCount--;
      });
    } else {
      nextZikr();
    }
  }

  void nextZikr() {
    if (currentIndex < azkar.length - 1) {
      setState(() {
        currentIndex++;
        currentCount = azkar[currentIndex]["count"];
      });
    }
  }

  void resetZikr() {
    setState(() {
      currentIndex = 0;
      currentCount = azkar[currentIndex]["count"];
    });
  }
}
