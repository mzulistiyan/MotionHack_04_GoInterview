import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_motionhack/cubit/auth_cubit.dart';
import 'package:flutter_application_motionhack/cubit/coba_cubit.dart';
import 'package:flutter_application_motionhack/cubit/humanresources_cubit.dart';
import 'package:flutter_application_motionhack/cubit/page_cubit.dart';
import 'package:flutter_application_motionhack/cubit/transaction_cubit.dart';
import 'package:flutter_application_motionhack/pages/detail_interview.dart';
import 'package:flutter_application_motionhack/pages/home_page.dart';
import 'package:flutter_application_motionhack/pages/main_page.dart';
import 'package:flutter_application_motionhack/pages/sign_in_page.dart';
import 'package:flutter_application_motionhack/pages/sign_up_page.dart';
import 'package:flutter_application_motionhack/pages/splash_screen_page.dart';
import 'package:flutter_application_motionhack/pages/succes_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => HumanresourcesCubit(),
        ),
        BlocProvider(
          create: (context) => TransactionCubit(),
        ),
        BlocProvider(
          create: (context) => CobaCubit(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashScreen(),
          '/main-page': (context) => MainPage(),
          '/sign-up': (context) => SignUpPage(),
          '/sign-in': (context) => SignInPage(),
          '/home-page': (context) => HomePage(),
          '/success-page': (context) => SuccessPage(),
        },
      ),
    );
  }
}
