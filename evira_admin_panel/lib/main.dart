import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'feature/auth/presentation/bloc/cubit/auth_cubit.dart';
import 'feature/auth/presentation/screens/auth_screens/auth_main_screen.dart';
import 'feature/auth/presentation/screens/auth_screens/create_profile_screen.dart';
import 'feature/auth/presentation/screens/auth_screens/login_screen.dart';
import 'feature/auth/presentation/screens/auth_screens/signup_screen.dart';
import 'feature/auth/presentation/screens/splash_screen/main_splash_screen.dart';
import 'feature/main_app/presentation/screens/main_home_screen.dart';
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await setup();
  runApp(MyApp());
}

String isAuth() {
  if (FirebaseAuth.instance.currentUser != null) {
    return MainHomeScreen.routename;
  }
  return '/';
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: isAuth(),
      routes: {
        '/': (context) => MainSplashScreen(),
        MainHomeScreen.routename:(context)=>MainHomeScreen(),
        AuthMainScreen.routename: (context) => BlocProvider(
              create: (context) => AuthCubit(),
              child: AuthMainScreen(),
            ),
        SignUpScreen.routename: (context) => BlocProvider(
              create: (context) => AuthCubit(),
              child: SignUpScreen(),
            ),
        LoginScreen.routename: ((context) => BlocProvider(
              create: (context) => AuthCubit(),
              child: LoginScreen(),
            )),
        CreateProfileScreen.routename: (context) => BlocProvider(
              create: (context) => AuthCubit(),
              child: CreateProfileScreen(),
            ),
      },
    );
  }
}
