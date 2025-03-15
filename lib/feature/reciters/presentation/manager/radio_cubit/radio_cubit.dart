import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:islami_app/feature/reciters/data/models/radio_model.dart';
import 'package:islami_app/feature/reciters/presentation/manager/radio_cubit/radio_state.dart';

class RadioCubit extends Cubit<RadioState> {
  final AudioPlayer audioPlayer = AudioPlayer();
  final Box<RadioModel> radioBox;

  RadioCubit(this.radioBox) : super(RadioInitial()) {
    _initializeRadioStations();

    // الاستماع لانتهاء الصوت لإعادة تشغيله إذا كان التكرار مفعلًا
    audioPlayer.onPlayerComplete.listen((_) {
      if (state is RadioLoaded) {
        final loadedState = state as RadioLoaded;
        if (loadedState.currentStation?.isRepeating == true) {
          playRadio(loadedState.currentStation!);
        }
      }
    });
  }

  /// **تحميل البيانات من Hive أو إدخال بيانات افتراضية**
  void _initializeRadioStations() {
    emit(RadioLoading());

    if (radioBox.isEmpty) {
      radioBox.addAll([
        RadioModel(
          name: "Al-Fatiha",
          url: "https://server6.mp3quran.net/qtm/001.mp3",
          isFavorite: false,
          isRepeating: false,
        ),
        RadioModel(
          name: "Fussilat",
          url: "https://server6.mp3quran.net/qtm/041.mp3",
          isFavorite: false,
          isRepeating: false,
        ),
        RadioModel(
          name: "Al-Najim",
          url: "https://server6.mp3quran.net/qtm/053.mp3",
          isFavorite: false,
          isRepeating: false,
        ),
        RadioModel(
          name: "Al-Molik",
          url: "https://server6.mp3quran.net/qtm/067.mp3",
          isFavorite: false,
          isRepeating: false,
        ),
        RadioModel(
          name: "Al-Ekhlas",
          url: "https://server6.mp3quran.net/qtm/112.mp3",
          isFavorite: false,
          isRepeating: false,
        ),
        RadioModel(
          name: "Al-Falak",
          url: "https://server6.mp3quran.net/qtm/113.mp3",
          isFavorite: false,
          isRepeating: false,
        ),
        RadioModel(
          name: "Al-Nas",
          url: "https://server6.mp3quran.net/qtm/114.mp3",
          isFavorite: false,
          isRepeating: false,
        ),
      ]);
    }
    emit(RadioLoaded(stations: radioBox.values.toList(), isPlaying: false));
  }

  /// **تشغيل أو إيقاف محطة الراديو**
void playRadio(RadioModel station, {bool isRepeating = false}) async {
  if (state is RadioLoaded) {
    final loadedState = state as RadioLoaded;

    // إذا كان نفس الملف يعمل، أوقفه فقط
    if (loadedState.currentStation == station && loadedState.isPlaying) {
      await audioPlayer.stop();
      emit(RadioLoaded(
        stations: loadedState.stations,
        isPlaying: false,
      ));
      return;
    }

    try {
      // تأكد من إيقاف أي تشغيل سابق
      await audioPlayer.stop();
      await audioPlayer.release(); // يمسح أي مصدر صوتي قديم

      // تشغيل الملف الجديد
      await audioPlayer.setSourceUrl(station.url);
      await audioPlayer.resume();

      //  ضبط وضع التكرار
      await audioPlayer.setReleaseMode(
          station.isRepeating ? ReleaseMode.loop : ReleaseMode.stop);

           // الاستماع لانتهاء الصوت وتحديث الحالة ليصبح غير نشط
      audioPlayer.onPlayerComplete.listen((_) {
        emit(RadioLoaded(
          stations: loadedState.stations,
          isPlaying: false,
          currentStation: null, // جعل المحطة غير نشطة
        ));
      });

      emit(RadioLoaded(
        stations: loadedState.stations,
        currentStation: station,
        isPlaying: true,
      ));

    } catch (e) {
      print(" حدث خطأ أثناء تشغيل الراديو: $e");
    }
  }
}

  /// **تبديل حالة المفضلة**
 void toggleFavorite(RadioModel station) {
  if (state is RadioLoaded) {
    final loadedState = state as RadioLoaded;
    int index = loadedState.stations.indexWhere((s) => s.name == station.name);
    if (index != -1) {
      RadioModel updatedStation = loadedState.stations[index].copyWith(
        isFavorite: !station.isFavorite,
      );
      radioBox.putAt(index, updatedStation);
      List<RadioModel> updatedStations = List.from(loadedState.stations);
      updatedStations[index] = updatedStation;

      emit(RadioLoaded(
        stations: updatedStations,
        currentStation: loadedState.currentStation == station
            ? updatedStation // حافظ على المحطة إذا كانت نفسها
            : loadedState.currentStation,
        isPlaying: loadedState.isPlaying, // حافظ على حالة التشغيل
      ));
    }
  }
}

  /// **تبديل وضع التكرار**
 void toggleRepeat(RadioModel station) {
  if (state is RadioLoaded) {
    final loadedState = state as RadioLoaded;
    int index = loadedState.stations.indexWhere((s) => s.name == station.name);
    if (index != -1) {
       bool newRepeatState = !station.isRepeating;
      RadioModel updatedStation = loadedState.stations[index].copyWith(
        isRepeating: newRepeatState,
       // isRepeating: !station.isRepeating,
      );
      radioBox.putAt(index, updatedStation);
      List<RadioModel> updatedStations = List.from(loadedState.stations);
      updatedStations[index] = updatedStation;

      emit(RadioLoaded(
        stations: updatedStations,
        currentStation: loadedState.currentStation == station
            ? updatedStation
            : loadedState.currentStation,
        isPlaying: loadedState.isPlaying,
      ));
      //  تحديث وضع التكرار في `audioPlayer`
      if (loadedState.currentStation == station) {
        audioPlayer.setReleaseMode(
            newRepeatState ? ReleaseMode.loop : ReleaseMode.stop);
      }
    }
  }
}

}