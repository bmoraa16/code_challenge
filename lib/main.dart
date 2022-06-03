import 'package:code_challenge/bloc/home/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'api/api_repository.dart';
import 'src/pages/login/login_page.dart';
import 'src/pages/splash/splash.dart';
import 'src/utils/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    /*
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: splashScreen,
      routes: {
        splashScreen: (BuildContext context) => const SplashScreenPage(),
        login: (BuildContext context) => const LoginPage(),
      },
    );
    */

    
    return RepositoryProvider(
      create: (context) => ApiRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<HomeBloc>(create: (BuildContext context) => HomeBloc()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: splashScreen,
          routes: {
            splashScreen: (BuildContext context) => const SplashScreenPage(),
        login: (BuildContext context) => const LoginPage(),
          },
        ),
      ),
    );

    
  }
}
