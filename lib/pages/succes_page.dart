import 'package:flutter/material.dart';
import 'package:flutter_application_motionhack/shared/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            header(),
            SizedBox(
              height: 85,
            ),
            Image.asset(
              'assets/check-circle.png',
              width: 132,
              height: 132,
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              'Payment Successful',
              style: GoogleFonts.poppins(
                  fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              width: 110,
              height: 35,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                  child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/main-page');
                },
                child: Text(
                  'Check Status',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )),
            ),
          ],
        ),
      )),
    );
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
        children: [],
      ),
    ),
  );
}
