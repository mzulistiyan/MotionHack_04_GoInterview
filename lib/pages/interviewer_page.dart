import 'package:flutter/material.dart';
import 'package:flutter_application_motionhack/shared/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class InterviewerPage extends StatelessWidget {
  const InterviewerPage({Key? key}) : super(key: key);

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
              Text('Interviewer',
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
      backgroundColor: Color(0xffF6F6F6),
      body: ListView(
        children: [
          header(),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  width: double.infinity,
                  height: 95,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 16, left: 16),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/profile1.png',
                            ),
                            SizedBox(
                              width: 9,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'John Doe',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Human Resource',
                                    style: GoogleFonts.poppins(
                                        fontSize: 12, color: Color(0xff9F9F9F)),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Container(
                                    width: 69,
                                    height: 18,
                                    decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Color(0xff9BCD8F)),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Accept',
                                        style: GoogleFonts.poppins(
                                            fontSize: 10,
                                            color: Color(0xff9BCD8F)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Feedback',
                  style: GoogleFonts.poppins(
                      fontSize: 20, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: <Widget>[
                        Flexible(
                            child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'Great work, I recommend you to join The Abyss boot camp that will be held by Fatui next month. You may also polish your portfolio as we’ve discussed before.',
                            style: GoogleFonts.poppins(),
                          ),
                        ))
                      ],
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
