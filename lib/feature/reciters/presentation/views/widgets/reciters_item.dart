import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_images.dart';
import 'package:islami_app/core/utils/app_styles.dart';

class RecitersItem extends StatelessWidget {
  const RecitersItem({
    super.key,
    required this.isFavorite,
    required this.isPlayed,
    required this.isRepeated,
    required this.name,
    required this.onTapFav,
    required this.onTapPlay,
    required this.onRepeated,
  });
  final bool isFavorite;
  final bool isPlayed;
  final bool isRepeated;
  final String name;
  final Function() onTapFav;
  final Function() onTapPlay;
  final Function() onRepeated;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 390 / 133,
      child: Container(
        decoration: ShapeDecoration(
          image: DecorationImage(
              image: isPlayed
                  ? AssetImage(Assets.imagesActiveReciters)
                  : AssetImage(Assets.imagesInActivereciters),
              fit: BoxFit.fill),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                name,
                style: AppStyles.styleBold20(context),
              ),
              Flexible(
                  child: SizedBox(
                height: 20,
              )),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: onTapFav,
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: Colors.black,
                          size: 30,
                        )),
                    IconButton(
                        onPressed: onTapPlay,
                        icon: Icon(
                          isPlayed ? Icons.pause : Icons.play_arrow,
                          color: Colors.black,
                          size: 45,
                        )),
                    IconButton(
                        onPressed: onRepeated,
                        icon: Icon(
                          isRepeated ? Icons.repeat_one : Icons.repeat,
                          color: Colors.black,
                          size: 30,
                        )),
                  ],
                ),
              ),
              // SizedBox(
              //   height: 10,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
