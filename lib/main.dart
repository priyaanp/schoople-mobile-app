import 'package:Schoople/cubit/attendance_cubit.dart';
import 'package:Schoople/cubit/app_state_cubit.dart';
import 'package:Schoople/cubit/exam_schedule_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/colors/colors.dart';
import 'presentation/splash/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
      BlocProvider(create: (ctx) => AppStateCubit()),
      BlocProvider(
        create: (context) => AttendanceCubit(),       
      ),
       BlocProvider(
        create: (context) => ExamScheduleCubit(),       
      ),
      ],
      child: MaterialApp(
        title: 'Schoople',
        theme: ThemeData(
          pageTransitionsTheme: PageTransitionsTheme(builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          }),
          scaffoldBackgroundColor: backgroundColor,
          primarySwatch: Colors.blue,
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: Colors.white,
              ),
        ),
        home: ScreenSplash(),
      ),
    );
  }
}
