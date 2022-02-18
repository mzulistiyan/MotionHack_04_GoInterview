import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_motionhack/cubit/transaction_cubit.dart';
import 'package:flutter_application_motionhack/model/interview_model.dart';
import 'package:flutter_application_motionhack/model/transaction_model.dart';
import 'package:flutter_application_motionhack/pages/schedule_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_file/open_file.dart';
import 'dart:convert';

class InterviewWaitingPage extends StatefulWidget {
  final TransactionModel transaction;
  const InterviewWaitingPage(this.transaction, {Key? key}) : super(key: key);

  @override
  State<InterviewWaitingPage> createState() => _InterviewWaitingPageState();
}

class _InterviewWaitingPageState extends State<InterviewWaitingPage> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            Text(widget.transaction.fileMotivationLetter),
            Text(widget.transaction.nameUser),
            Text(widget.transaction.id),
            BlocConsumer<TransactionCubit, TransactionState>(
              listener: (context, state) {
                // TODO: implement listener
                if (state is TransactionSuccess) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SchedulePage(InterviewModel(
                              transactionId: widget.transaction.id,
                              userId: widget.transaction.userId,
                              userHrId: widget.transaction.userHrId,
                              nameUser: widget.transaction.nameUser,
                              nameHR: widget.transaction.nameHR))));
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
                if (state is TransactionLoading) {
                  return Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 30),
                    child: CircularProgressIndicator(),
                  );
                }
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context
                            .read<TransactionCubit>()
                            .updateUserAccept(widget.transaction.id);
                      },
                      child: Text('Accepted'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context
                            .read<TransactionCubit>()
                            .updateUserDeny(widget.transaction.id);
                      },
                      child: Text('Deny'),
                    ),
                  ],
                );
              },
            )
          ],
        ),
      )),
    );
  }
}
