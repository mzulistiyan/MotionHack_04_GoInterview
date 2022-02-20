import 'package:flutter/material.dart';
import 'package:flutter_application_motionhack/cubit/auth_cubit.dart';
import 'package:flutter_application_motionhack/shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 60, vertical: 50),
                    child: Column(
                      children: [
                        Image.asset('assets/logo.png'),
                        SizedBox(
                          height: 90,
                        ),
                        Text(
                          'Login',
                          style: blackTextStyle.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 224,
                          height: 45,
                          padding: EdgeInsets.only(left: 20),
                          decoration: BoxDecoration(
                            color: Color(0xffF2F2F2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextField(
                            controller: emailController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Email",
                                hintStyle: TextStyle(
                                    color: Color(0xff6F6F6F), fontSize: 12)),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 224,
                          height: 45,
                          padding: EdgeInsets.only(left: 20),
                          decoration: BoxDecoration(
                            color: Color(0xffF2F2F2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextField(
                            controller: passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Password",
                                hintStyle: TextStyle(
                                    color: Color(0xff6F6F6F), fontSize: 12)),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        BlocConsumer<AuthCubit, AuthState>(
                          listener: (context, state) {
                            // TODO: implement listener
                            if (state is AuthSuccess) {
                              if (state.user.level == 1) {
                                Navigator.pushNamedAndRemoveUntil(
                                    context, '/main-page', (route) => false);
                              } else if (state.user.level == 2) {
                                Navigator.pushNamedAndRemoveUntil(
                                    context, '/home-hr-page', (route) => false);
                              }
                              {}
                            } else if (state is AuthFailed) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text(state.error),
                                ),
                              );
                            }
                          },
                          builder: (context, state) {
                            if (state is AuthLoading) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            return Container(
                              width: 224,
                              height: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: primaryColor,
                              ),
                              child: TextButton(
                                onPressed: () {
                                  context.read<AuthCubit>().signIn(
                                        email: emailController.text,
                                        password: passwordController.text,
                                      );
                                },
                                child: Text(
                                  'Login',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 150,
                  ),
                  Container(
                      width: double.infinity,
                      height: 50,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 3,
                            width: double.infinity,
                            color: Color(0xffEBEBEB),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Don’t have an account? ',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/sign-up');
                                },
                                child: Text(
                                  'Register here',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      )),
                ],
              ),
            ],
          ),
        ));
  }
}
