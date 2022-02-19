import 'package:flutter/material.dart';
import 'package:flutter_application_motionhack/pages/home_hr_page.dart';
import 'package:flutter_application_motionhack/pages/schedule2_page.dart';

import 'package:flutter_application_motionhack/shared/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class InterviewFinishedPage extends StatelessWidget {
  const InterviewFinishedPage({Key? key}) : super(key: key);

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
                crossAxisAlignment: CrossAxisAlignment.start,
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
                            'Anindya Arum',
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
                                'Waiting',
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
                  SizedBox(height: 40),
                  Text(
                    'Feedback',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: double.infinity,
                    height: 135,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color(0xff7BAFFE))),
                    child: Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter your feedback here ...",
                              hintStyle: TextStyle(
                                  color: Color(0xff6F6F6F), fontSize: 12)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Center(
                    child: Container(
                      width: 110,
                      height: 35,
                      decoration: BoxDecoration(
                        color: Color(0xff68A5FF),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: TextButton(
                          onPressed: () => showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: Text('Feedback sent',
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  )),
                              content: Text('Thank you for your service!',
                                  style: GoogleFonts.poppins(
                                    color: Color(0xffAFAFAF),
                                  )),
                              actions: <Widget>[
                                Center(
                                  child: Container(
                                    width: 110,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      color: Color(0xff68A5FF),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('Confirm',
                                          style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          child: Text(
                            'Set schedule',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
