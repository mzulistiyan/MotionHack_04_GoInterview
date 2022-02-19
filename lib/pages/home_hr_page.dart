import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_motionhack/cubit/auth_cubit.dart';
import 'package:flutter_application_motionhack/cubit/coba_cubit.dart';
import 'package:flutter_application_motionhack/cubit/humanresources_cubit.dart';
import 'package:flutter_application_motionhack/cubit/transaction_cubit.dart';
import 'package:flutter_application_motionhack/model/transaction_model.dart';
import 'package:flutter_application_motionhack/model/user_hr_model.dart';
import 'package:flutter_application_motionhack/model/user_model.dart';
import 'package:flutter_application_motionhack/pages/profile_page.dart';
import 'package:flutter_application_motionhack/pages/succes_page.dart';
import 'package:flutter_application_motionhack/pages/trash.dart';
import 'package:flutter_application_motionhack/pages/widget/interview_status_card.dart';
import 'package:flutter_application_motionhack/pages/widget/interview_status_card_transaction.dart';
import 'package:flutter_application_motionhack/pages/widget/list_hr_card.dart';
import 'package:flutter_application_motionhack/pages/widget/list_hr_card_user.dart';
import 'package:flutter_application_motionhack/pages/widget/list_user.dart';
import 'package:flutter_application_motionhack/pages/widget/list_user_interview.dart';
import 'package:flutter_application_motionhack/shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeHrPage extends StatefulWidget {
  const HomeHrPage({Key? key}) : super(key: key);

  @override
  _HomeHrPageState createState() => _HomeHrPageState();
}

class _HomeHrPageState extends State<HomeHrPage> {
  void initState() {
    // TODO: implement initState
    User? user = FirebaseAuth.instance.currentUser;
    context.read<HumanresourcesCubit>().fetchHumanResources();
    context.read<TransactionCubit>().fetchTransaction(user!.uid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget listHistoryTransaction(List<TransactionModel> userId) {
      return Container(
          child: Column(
        children: userId.map(
          (TransactionModel userId) {
            return InterViewStatusTransaction(userId);
          },
        ).toList(),
      ));
    }

    Widget listTransaction(List<TransactionModel> userId) {
      final List<TransactionModel> user;
      return Container(
          child: Column(
        children: userId.map((
          TransactionModel userId,
        ) {
          return ListUserInterview(userId);
        }).toList(),
      ));
    }

    return Scaffold(
        body: ListView(
      children: [
        BlocConsumer<TransactionCubit, TransactionState>(
          listener: (context, state) {
            // TODO: implement listener
            if (state is TransactionFailed) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(state.error),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is TransactionSuccess) {
              return Column(
                children: [
                  Container(
                    width: double.infinity,
                    color: primaryColor,
                    height: 60,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'GoInterview',
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProfilePage()));
                            },
                            child: Image.asset(
                              'assets/profile.png',
                              width: 32,
                              height: 32,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Upcoming Interview',
                          style: GoogleFonts.poppins(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        listTransaction(state.transactions),
                        SizedBox(height: 40),
                        Text(
                          'Interview List',
                          style: GoogleFonts.poppins(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        listHistoryTransaction(state.transactions),
                        SizedBox(
                          height: 50,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
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
    ));
  }
}
