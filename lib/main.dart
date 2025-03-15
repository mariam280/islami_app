import 'package:device_preview/device_preview.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:islami_app/core/utils/api_service.dart';
import 'package:islami_app/feature/quran/data/repos/quran_repo_impl.dart';
import 'package:islami_app/feature/quran/presentation/manager/quran_cubit/quran_cubit.dart';
import 'package:islami_app/feature/reciters/data/models/radio_model.dart';
import 'package:islami_app/feature/reciters/presentation/manager/radio_cubit/radio_cubit.dart';
import 'package:islami_app/feature/splash/presentation/view/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(RadioModelAdapter());
  var radioBox = await Hive.openBox<RadioModel>('radioBox');

  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => IslamiApp(radioBox: radioBox),
    ),
  );
}

class IslamiApp extends StatelessWidget {
  final Box<RadioModel> radioBox;
  const IslamiApp({super.key, required this.radioBox});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => RadioCubit(radioBox)),
        BlocProvider(
            create: (context) => QuranCubit(QuranRepoImpl(ApiService(Dio())))),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Color(0xff212121),
        ),
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        home: SplashView(),
      ),
    );
  }
}
