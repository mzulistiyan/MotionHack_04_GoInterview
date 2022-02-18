import 'package:flutter/material.dart';
import 'package:flutter_application_motionhack/cubit/transaction_cubit.dart';
import 'package:flutter_application_motionhack/model/transaction_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentPage extends StatelessWidget {
  final TransactionModel transaction;
  const PaymentPage(this.transaction, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Text('userHrId : ${transaction.userHrId}'),
          Text(transaction.nameUser),
          Text(transaction.position),
          Text(transaction.userId),
          Text(transaction.nameHR),
          Text(transaction.fileResume),
          Text(transaction.fileMotivationLetter),
          Text(transaction.filePortofolio),
          BlocConsumer<TransactionCubit, TransactionState>(
            listener: (context, state) {
              // TODO: implement listener
              if (state is TransactionSuccess) {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/success-page', (route) => false);
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
              return ElevatedButton(
                onPressed: () {
                  context
                      .read<TransactionCubit>()
                      .createTransaction(transaction);
                },
                child: Text(
                  'Bayar',
                ),
              );
            },
          ),
        ],
      )),
    );
  }
}
