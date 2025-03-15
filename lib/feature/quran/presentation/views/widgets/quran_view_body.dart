import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/feature/quran/presentation/manager/quran_cubit/quran_cubit.dart';
import 'package:islami_app/feature/quran/presentation/views/widgets/quran_item_list.dart';

class QuranViewBody extends StatefulWidget {
  const QuranViewBody({super.key});

  @override
  State<QuranViewBody> createState() => _QuranViewBodyState();
}

class _QuranViewBodyState extends State<QuranViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<QuranCubit>().getSurahs();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 160,
        ),
        Expanded(
          child: QuranItemList(),
        ),
        SizedBox(
          height: 60,
        ),
      ],
    );
  }
}

