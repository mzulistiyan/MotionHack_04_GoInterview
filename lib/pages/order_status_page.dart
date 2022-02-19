import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_motionhack/cubit/auth_cubit.dart';
import 'package:flutter_application_motionhack/cubit/humanresources_cubit.dart';
import 'package:flutter_application_motionhack/cubit/transaction_cubit.dart';
import 'package:flutter_application_motionhack/model/transaction_model.dart';
import 'package:flutter_application_motionhack/pages/widget/interview_status_card.dart';
import 'package:flutter_application_motionhack/pages/widget/list_hr_card_user.dart';
import 'package:flutter_application_motionhack/pages/widget/list_user.dart';

import 'package:flutter_application_motionhack/shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderStatusPage extends StatefulWidget {
  const OrderStatusPage({Key? key}) : super(key: key);

  @override
  _OrderStatusPageState createState() => _OrderStatusPageState();
}

class _OrderStatusPageState extends State<OrderStatusPage> {
  @override
  void initState() {
    // TODO: implement initState

    User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      print("Kosong");
      Navigator.pushNamedAndRemoveUntil(context, '/sign-in', (route) => false);
    } else {
      context.read<HumanresourcesCubit>().fetchHumanResources();
      context
          .read<TransactionCubit>()
          .fetchTransactionUserStatus(user.uid, user.uid);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget listHistoryTransaction(List<TransactionModel> userId) {
      return Container(
          child: Column(
        children: userId.map(
          (TransactionModel userId) {
            return InterViewStatus(userId);
          },
        ).toList(),
      ));
    }

    return Scaffold(
      body: ListView(
        children: [
          Container(
            child: BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                if (state is AuthSuccess) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                                    padding: EdgeInsets.only(left: 20, top: 15),
                                    child: Text('GoInterview',
                                        style: GoogleFonts.poppins(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        )),
                                  ),
                                ),
                                SizedBox(height: 40),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Interview Status',
                                        style: GoogleFonts.poppins(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      listHistoryTransaction(
                                          state.transactions),
                                      SizedBox(
                                        height: 50,
                                      )
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
                  );
                }

                return SizedBox();
              },
            ),
          )
        ],
      ),
    );
  }
}
