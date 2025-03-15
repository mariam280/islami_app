part of 'sebha_cubit.dart';

sealed class SebhaState extends Equatable {
  const SebhaState();

  @override
  List<Object> get props => [];
}

//final class SebhaInitial extends SebhaState {}

final class SebhaUpdate extends SebhaState {
  final String zikr;
  final int count;

  const SebhaUpdate(this.zikr, this.count);
}
