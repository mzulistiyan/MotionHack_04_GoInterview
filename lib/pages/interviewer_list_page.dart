import 'package:flutter/material.dart';
import 'package:flutter_application_motionhack/cubit/auth_cubit.dart';
import 'package:flutter_application_motionhack/cubit/humanresources_cubit.dart';
import 'package:flutter_application_motionhack/model/user_hr_model.dart';
import 'package:flutter_application_motionhack/model/user_model.dart';
import 'package:flutter_application_motionhack/pages/widget/list_hr_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InterviewerListPage extends StatefulWidget {
  const InterviewerListPage({Key? key}) : super(key: key);

  @override
  _InterviewerListPageState createState() => _InterviewerListPageState();
}

class _InterviewerListPageState extends State<InterviewerListPage> {
  void initState() {
    // TODO: implement initState
    context.read<HumanresourcesCubit>().fetchHumanResources();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget listHR(
      List<UserHrModel> userHr,
    ) {
      return Container(
          child: Column(
        children: userHr.map((UserHrModel userHr) {
          return ListHr(userHr);
        }).toList(),
      ));
    }

    return Scaffold(
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess && state.user.level == 1) {
            return SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BlocConsumer<HumanresourcesCubit, HumanresourcesState>(
                      listener: (context, state) {
                        // TODO: implement listener
                        if (state is HumanresourcesFailed) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.red,
                              content: Text(state.error),
                            ),
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is HumanresourcesSuccess) {
                          return Column(
                            children: [
                              listHR(state.humanresources),
                              Text('Hallo')
                            ],
                          );
                        }
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                    BlocConsumer<AuthCubit, AuthState>(
                      listener: (context, state) {
                        // TODO: implement listener
                        if (state is AuthFailed) {
                          print('Hallos');
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.red,
                              content: Text(state.error),
                            ),
                          );
                        } else if (state is AuthInitial) {
                          print('Hallos');
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/sign-in', (route) => false);
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
