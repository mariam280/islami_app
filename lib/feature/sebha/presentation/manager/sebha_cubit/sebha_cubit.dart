import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:islami_app/feature/sebha/data/models/zikr_model.dart';

part 'sebha_state.dart';

class SebhaCubit extends Cubit<SebhaState> {
  List<ZikrModel> azkar = [
    ZikrModel("سبحان الله", 30),
    ZikrModel("الحمد لله", 30),
    ZikrModel("الله أكبر", 30),
    ZikrModel("لا حول ولا قوة إلا بالله", 30),
  ];

  int currentIndex = 0;
  int currentCount = 30;

  SebhaCubit() : super(SebhaUpdate("سبحان الله", 30));

  void decreaseCount() {
    if (currentCount > 1) {
      currentCount--;
      emit(SebhaUpdate(azkar[currentIndex].zikr, currentCount));
    } else {
      nextZikr();
    }
  }

  void nextZikr() {
    if (currentIndex < azkar.length - 1) {
      currentIndex++;
      currentCount = azkar[currentIndex].count;
    }
    emit(SebhaUpdate(azkar[currentIndex].zikr, currentCount));
  }
}

