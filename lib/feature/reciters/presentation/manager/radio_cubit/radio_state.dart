

import 'package:islami_app/feature/reciters/data/models/radio_model.dart';

abstract class RadioState {}
class RadioInitial extends RadioState {}
class RadioLoading extends RadioState {}
class RadioLoaded extends RadioState {
  final List<RadioModel> stations;
  final RadioModel? currentStation;
  final bool isPlaying;

  RadioLoaded({required this.stations, this.currentStation, required this.isPlaying});
}

class RadioError extends RadioState {
  final String message;
  RadioError(this.message);
}
