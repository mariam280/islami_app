import 'package:flutter/material.dart';

class OnBoardItem extends StatelessWidget {
  const OnBoardItem({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
        ),
        //child:
      ),
    );
  }
}
