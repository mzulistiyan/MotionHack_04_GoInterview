import 'package:flutter/material.dart';
import 'package:flutter_application_motionhack/cubit/auth_cubit.dart';
import 'package:flutter_application_motionhack/cubit/humanresources_cubit.dart';
import 'package:flutter_application_motionhack/model/user_hr_model.dart';
import 'package:flutter_application_motionhack/model/user_model.dart';
import 'package:flutter_application_motionhack/pages/trash.dart';
import 'package:flutter_application_motionhack/pages/widget/list_hr_card.dart';
import 'package:flutter_application_motionhack/shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

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
        body: ListView(
      children: [
        BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            if (state is AuthSuccess && state.user.level == 1) {
              return SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                color: primaryColor,
                                height: 60,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 20, top: 15),
                                  child: Text('Interviewer List',
                                      style: GoogleFonts.poppins(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      )),
                                ),
                              ),
                              SizedBox(height: 40),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Container(
                                  width: double.infinity,
                                  child: Image.asset(
                                    'assets/screen_interview.png',
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Available Interviewer',
                                      style: GoogleFonts.poppins(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    listHR(state.humanresources),
                                    SizedBox(height: 60),
                                  ],
                                ),
                              ),
                            ],
                          );
                        }
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ],
                ),
              );
            } else {
              return SizedBox();
            }
          },
        ),
      ],
    ));
  }
}
