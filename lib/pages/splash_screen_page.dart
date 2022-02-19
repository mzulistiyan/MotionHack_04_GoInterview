import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_motionhack/cubit/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        print("Kosong");
        Navigator.pushNamedAndRemoveUntil(
            context, '/sign-in', (route) => false);
      } else {
        context.read<AuthCubit>().getCurrentUser(user.uid);
        if (user.uid == 'SS5ODoSDtggmrviRnain7fGVvCk2') {
          Navigator.pushNamedAndRemoveUntil(
              context, '/home-hr-page', (route) => false);
        } else {
          Navigator.pushNamedAndRemoveUntil(
              context, '/main-page', (route) => false);
        }
      }
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff0353A4),
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.zero,
            child: Image.asset(
              'assets/splash_screen.png',
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
        ));
  }
}
