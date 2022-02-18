import 'package:flutter/material.dart';

import 'package:flutter_application_motionhack/model/transaction_model.dart';
import 'package:flutter_application_motionhack/pages/interview_waiting_page.dart';

class ListUser extends StatelessWidget {
  final TransactionModel userHr;

  const ListUser(this.userHr, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => InterviewWaitingPage(userHr)));
      },
      child: Container(
        margin: EdgeInsets.all(20),
        width: double.infinity,
        color: Colors.amber,
        child: Column(
          children: [
            Text(userHr.nameUser),
            Text(userHr.id),
            Text(userHr.confirmation_status)
          ],
        ),
      ),
    );
  }
}
