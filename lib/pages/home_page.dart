import 'package:flutter/material.dart';
import 'package:flutter_application_motionhack/cubit/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      state.user.name,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    Text(state.user.level.toString()),
                    Container(
                      child: Text(
                        'INI HOMEPAGE',
                      ),
                    ),
                    BlocConsumer<AuthCubit, AuthState>(
                      listener: (context, state) {
                        // TODO: implement listener
                        if (state is AuthFailed) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.red,
                              content: Text(state.error),
                            ),
                          );
                        } else if (state is AuthInitial) {
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/sign-up', (route) => false);
                        }
                      },
                      builder: (context, state) {
                        if (state is AuthLoading) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return Container(
                          child: TextButton(
                            onPressed: () {
                              context.read<AuthCubit>().signOut();
                            },
                            child: Text('LOGOUT'),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
