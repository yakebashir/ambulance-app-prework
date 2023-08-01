import 'package:ambulance/observer/app_bloc_observer.dart';
import 'package:google_fonts/google_fonts.dart';

import 'cubits/error_handling/error_handling_cubit.dart';
import 'cubits/intenet_services/internet_services_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'constants.dart';
import 'cubits/ambulance_list/ambulance_list_cubit.dart';
import 'cubits/district_list/district_list_cubit.dart';
import 'cubits/user/user_cubit.dart';
import 'pages/home_page.dart';
import 'pages/splash_screen_page.dart';

void main() async {
  //Initialize Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // Set the status bar color
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: kMainDarkColor,
  ));
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

//This is my first comment!

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetServicesCubit>(
          create: (context) => InternetServicesCubit(),
        ),
        BlocProvider<UserCubit>(
          create: (context) => UserCubit(),
        ),
        BlocProvider<DistrictListCubit>(
          create: (context) => DistrictListCubit(
            userCubit: context.read<UserCubit>(),
            internetServicesCubit: context.read<InternetServicesCubit>(),
          ),
        ),
        BlocProvider<AmbulanceListCubit>(
          create: (context) => AmbulanceListCubit(
            userCubit: context.read<UserCubit>(),
            districtListCubit: context.read<DistrictListCubit>(),
          ),
        ),
        BlocProvider<ErrorHandlingCubit>(
          create: (context) => ErrorHandlingCubit(
            internetServicesCubit: context.read<InternetServicesCubit>(),
            userCubit: context.read<UserCubit>(),
            districtListCubit: context.read<DistrictListCubit>(),
            ambulanceListCubit: context.read<AmbulanceListCubit>(),
          ),
        ),
      ],
      child: MaterialApp(
        routes: {
          SplashScreenPage.routeName: (context) => const SplashScreenPage(),
          HomePage.routeName: (context) => const HomePage(),
        },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
        theme: _buildTheme(Brightness.dark),
        initialRoute: SplashScreenPage.routeName,
      ),
    );
  }
}

ThemeData _buildTheme(brightness) {
  var baseTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: kMainColor),
    //brightness: brightness,
    useMaterial3: true,
  );

  return baseTheme.copyWith(
    textTheme: GoogleFonts.handleeTextTheme(baseTheme.textTheme),
  );
}
