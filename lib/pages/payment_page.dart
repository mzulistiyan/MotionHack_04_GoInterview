import 'package:flutter/material.dart';
import 'package:flutter_application_motionhack/cubit/transaction_cubit.dart';
import 'package:flutter_application_motionhack/model/transaction_model.dart';
import 'package:flutter_application_motionhack/pages/payment_method_page.dart';
import 'package:flutter_application_motionhack/shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentPage extends StatelessWidget {
  final TransactionModel transaction;
  const PaymentPage(this.transaction, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF6F6F6),
        body: ListView(
          children: [
            header(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 40),
                    Text(
                      'Summary',
                      style: GoogleFonts.poppins(
                          fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 12, left: 18, right: 18),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total Bill',
                                  style: GoogleFonts.poppins(
                                      fontSize: 12, color: Color(0xff9F9F9F)),
                                ),
                                Text(
                                  'Rp100.000',
                                  style: GoogleFonts.poppins(
                                      fontSize: 12, color: Color(0xff9F9F9F)),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Service Bill',
                                  style: GoogleFonts.poppins(
                                      fontSize: 12, color: Color(0xff9F9F9F)),
                                ),
                                Text(
                                  'Rp0',
                                  style: GoogleFonts.poppins(
                                      fontSize: 12, color: Color(0xff9F9F9F)),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    Text(
                      'Payment Method',
                      style: GoogleFonts.poppins(
                          fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PaymentMethodPage()));
                      },
                      child: Container(
                        width: double.infinity,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 12, left: 18, right: 18),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                'assets/logo_mandiri.png',
                                width: 100,
                                height: 50,
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Text(
                                      'Mandiri Virtual Account',
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      size: 20,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
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
                        return Center(
                          child: Container(
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
                                    .createTransaction(transaction);
                              },
                              child: Text(
                                'Pay Now',
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

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
          Icon(
            Icons.arrow_back_ios,
            size: 25,
            color: Colors.white,
          ),
          SizedBox(
            width: 15,
          ),
          Text('Payment',
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
