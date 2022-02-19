import 'package:flutter/material.dart';
import 'package:flutter_application_motionhack/shared/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentMethodPage extends StatelessWidget {
  const PaymentMethodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF6F6F6),
      body: ListView(
        children: [
          header(),
          SizedBox(height: 40),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 12, left: 18, right: 18),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/logo_mandiri.png',
                            width: 100,
                            height: 50,
                          ),
                          SizedBox(
                            width: 24,
                          ),
                          Container(
                            child: Row(
                              children: [
                                Text(
                                  'Mandiri Virtual Account',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 12, left: 18, right: 18),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/logo_bca.png',
                            width: 100,
                            height: 50,
                          ),
                          SizedBox(
                            width: 24,
                          ),
                          Container(
                            child: Row(
                              children: [
                                Text(
                                  'BCA Virtual Account',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 12, left: 18, right: 18),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/logo_dana.png',
                            width: 100,
                            height: 50,
                          ),
                          SizedBox(
                            width: 24,
                          ),
                          Container(
                            child: Row(
                              children: [
                                Text(
                                  'Dana',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 12, left: 18, right: 18),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/logo_gopay.png',
                            width: 100,
                            height: 50,
                          ),
                          SizedBox(
                            width: 24,
                          ),
                          Container(
                            child: Row(
                              children: [
                                Text(
                                  'GoPay',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
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
        children: [
          Icon(
            Icons.arrow_back_ios,
            size: 25,
            color: Colors.white,
          ),
          SizedBox(
            width: 15,
          ),
          Text('Payment Method Page',
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
