import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/di/di_getit.dart';
import 'package:flutter_application_1/core/bloc/navbar_cubit/navbar_cubit.dart';
import 'package:flutter_application_1/core/widgets/main_wrapper.dart';
import 'package:flutter_application_1/features/home/presentation/bloc/Home/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  //*init locator
  await dependencyInjection();
  //*provider
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale('fa', 'IR'),
      supportedLocales: const [Locale('fa', 'IR')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => locator<HomeBloc>()),
          BlocProvider(create: (context) => NavbarCubit()),
        ],
        child: MainWrapper(),
      ),
    ),
  );
}
