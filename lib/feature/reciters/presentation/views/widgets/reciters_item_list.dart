import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/feature/reciters/presentation/manager/radio_cubit/radio_cubit.dart';
import 'package:islami_app/feature/reciters/presentation/manager/radio_cubit/radio_state.dart';
import 'package:islami_app/feature/reciters/presentation/views/widgets/reciters_item.dart';

class RecitersItemList extends StatelessWidget {
  const RecitersItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RadioCubit, RadioState>(builder: (context, state) {
      if (state is RadioLoading) {
        return Center(child: CircularProgressIndicator());
      } else if (state is RadioLoaded) {
        return SliverList.builder(
            itemCount: state.stations.length,
            itemBuilder: (context, index) {
              final station = state.stations[index];
              final isPlaying = state.currentStation == station;
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: RecitersItem(
                  onRepeated: () {
                    context.read<RadioCubit>().toggleRepeat(station);
                  },
                  onTapFav: () {
                    context.read<RadioCubit>().toggleFavorite(station);
                  },
                  onTapPlay: () {
                    context.read<RadioCubit>().playRadio(station);
                  },
                  name: station.name,
                  isFavorite: station.isFavorite,
                  isPlayed: isPlaying,
                  isRepeated: station.isRepeating,
                ),
              );
            });
      } else {
        return Center(child: Text("حدث خطأ! حاول مرة أخرى."));
      }
    });
  }
}
