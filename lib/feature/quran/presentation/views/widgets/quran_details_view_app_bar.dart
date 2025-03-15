import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/constant.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:islami_app/feature/quran/presentation/manager/quran_cubit/quran_cubit.dart';

class QuranDetailsViewAppBar extends StatelessWidget {
  const QuranDetailsViewAppBar({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              context.read<QuranCubit>().getSurahs();
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: kPrimaryolor,
            )),
        Flexible(
            child: SizedBox(
          width: 110,
        )),
        Center(
          child: Text(
            name,
            style: AppStyles.styleBold20(context).copyWith(
              color: kPrimaryolor,
            ),
          ),
        ),
      ],
    );
  }
}
