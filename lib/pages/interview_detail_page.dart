import 'package:flutter/material.dart';
import 'package:flutter_application_motionhack/cubit/transaction_cubit.dart';
import 'package:flutter_application_motionhack/model/interview_model.dart';
import 'package:flutter_application_motionhack/model/transaction_model.dart';
import 'package:flutter_application_motionhack/pages/interview_detail_accept_page.dart';
import 'package:flutter_application_motionhack/pages/interview_detail_finished_page.dart';
import 'package:flutter_application_motionhack/pages/schedule2_page.dart';

import 'package:flutter_application_motionhack/shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class InterviewDetailPage extends StatelessWidget {
  final TransactionModel user;
  const InterviewDetailPage(this.user, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        width: double.infinity,
        color: primaryColor,
        height: 65,
        child: Padding(
          padding: EdgeInsets.only(
            left: 20,
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 25,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Text('Interviewee',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  )),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: ListView(
        children: [
          header(),
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        child: Image.asset(
                          'assets/profile2.png',
                        ),
                      ),
                      SizedBox(
                        width: 28,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user.nameUser,
                            style: GoogleFonts.poppins(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'UX Researcher',
                            style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff9F9F9F)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 69,
                            height: 18,
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xff8FA8CD)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                user.confirmation_status,
                                style: GoogleFonts.poppins(
                                    fontSize: 10, color: Color(0xff8FA8CD)),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      Text(
                        'Applying for ',
                      ),
                      Text(
                        'UX Designer.',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/icon_folder.png',
                              width: 93,
                              height: 76,
                            ),
                            Text(
                              'CV/Resume',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/icon_folder.png',
                              width: 93,
                              height: 76,
                            ),
                            Text(
                              'Motivation Letter',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/icon_folder.png',
                              width: 93,
                              height: 76,
                            ),
                            Text(
                              'Portfolio',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Accept interviewee?',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        BlocConsumer<TransactionCubit, TransactionState>(
                          listener: (context, state) {
                            // TODO: implement listener
                            if (state is TransactionSuccess) {
                              Navigator.pushNamed(context, '/');
                            } else if (state is TransactionFailed) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text(state.error),
                                ),
                              );
                            }
                          },
                          builder: (context, state) {
                            return Container(
                              width: 110,
                              height: 35,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(color: Color(0xff7BAFFE)),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                  child: TextButton(
                                onPressed: () {
                                  context
                                      .read<TransactionCubit>()
                                      .updateUserDeny(user.id);
                                },
                                child: Text(
                                  'Deny',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: Color(0xff7BAFFE),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              )),
                            );
                          },
                        ),
                        BlocConsumer<TransactionCubit, TransactionState>(
                          listener: (context, state) {
                            // TODO: implement listener
                            if (state is TransactionSuccess) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SchedulePages(
                                      InterviewModel(
                                          transactionId: user.id,
                                          userId: user.userId,
                                          userHrId: user.userHrId,
                                          nameUser: user.nameUser,
                                          nameHR: user.nameHR),
                                      user),
                                ),
                              );
                            } else if (state is TransactionFailed) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text(state.error),
                                ),
                              );
                            }
                          },
                          builder: (context, state) {
                            return Container(
                              width: 110,
                              height: 35,
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                  child: TextButton(
                                onPressed: () {
                                  context
                                      .read<TransactionCubit>()
                                      .updateUserAccept(user.id);
                                },
                                child: Text(
                                  'Accept',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              )),
                            );
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
