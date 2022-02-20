import 'package:flutter/material.dart';
import 'package:flutter_application_motionhack/model/transaction_model.dart';
import 'package:flutter_application_motionhack/pages/interview_detail_accept_page.dart';
import 'package:flutter_application_motionhack/pages/interview_detail_page.dart';
import 'package:flutter_application_motionhack/pages/interview_waiting_page.dart';
import 'package:google_fonts/google_fonts.dart';

class InterViewStatusTransaction extends StatelessWidget {
  final TransactionModel listHr;
  const InterViewStatusTransaction(this.listHr, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (listHr.confirmation_status == 'Accept' ||
            listHr.confirmation_status == 'Waiting') ...[
          GestureDetector(
            onTap: () {
              if (listHr.confirmation_status == 'Waiting') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InterviewDetailPage(listHr),
                  ),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InterviewDetaiAcceptlPage(listHr),
                  ),
                );
              }
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 10),
              width: double.infinity,
              height: 90,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
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
                                listHr.nameUser,
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
                              if (listHr.confirmation_status == 'Accept') ...[
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
                                      listHr.confirmation_status,
                                      style: GoogleFonts.poppins(
                                          fontSize: 10,
                                          color: Color(0xff9BCD8F)),
                                    ),
                                  ),
                                ),
                              ] else ...[
                                Container(
                                  width: 69,
                                  height: 18,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color:
                                            Color(0xff8FA8CD).withOpacity(0.5)),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      listHr.confirmation_status,
                                      style: GoogleFonts.poppins(
                                          fontSize: 10,
                                          color: Color(0xff8FA8CD)
                                              .withOpacity(0.5)),
                                    ),
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ] else ...[
          Container(
            margin: EdgeInsets.only(bottom: 10),
            width: double.infinity,
            height: 90,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(1),
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 16, left: 16),
                  child: Row(
                    children: [
                      Container(
                        width: 55,
                        height: 55,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage('assets/profile1.png'),
                          colorFilter: ColorFilter.mode(
                              Colors.white.withOpacity(0.2), BlendMode.dstATop),
                        )),
                      ),
                      SizedBox(
                        width: 9,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  listHr.nameUser,
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black.withOpacity(0.5)),
                                ),
                                Text(
                                  'Human Resource',
                                  style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      color:
                                          Color(0xff9F9F9F).withOpacity(0.5)),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                if (listHr.confirmation_status ==
                                    'Waiting') ...[
                                  Container(
                                    width: 69,
                                    height: 18,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Color(0xff8FA8CD)
                                              .withOpacity(0.5)),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Text(
                                        listHr.confirmation_status,
                                        style: GoogleFonts.poppins(
                                            fontSize: 10,
                                            color: Color(0xff8FA8CD)
                                                .withOpacity(0.5)),
                                      ),
                                    ),
                                  ),
                                ] else if (listHr.confirmation_status ==
                                    'Denied') ...[
                                  Container(
                                    width: 69,
                                    height: 18,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Color(0xffCD8F8F)
                                              .withOpacity(0.5)),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Text(
                                        listHr.confirmation_status,
                                        style: GoogleFonts.poppins(
                                            fontSize: 10,
                                            color: Color(0xffCD8F8F)
                                                .withOpacity(0.5)),
                                      ),
                                    ),
                                  ),
                                ] else ...[
                                  Container(
                                    width: 69,
                                    height: 18,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Color(0xff9F9F9F)
                                              .withOpacity(0.5)),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Text(
                                        listHr.confirmation_status,
                                        style: GoogleFonts.poppins(
                                            fontSize: 10,
                                            color: Color(0xff9F9F9F)
                                                .withOpacity(0.5)),
                                      ),
                                    ),
                                  ),
                                ],
                              ],
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
        ]
      ],
    );
  }
}
