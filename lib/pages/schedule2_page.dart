import 'package:flutter/material.dart';
import 'package:flutter_application_motionhack/cubit/interview_cubit.dart';
import 'package:flutter_application_motionhack/model/interview_model.dart';
import 'package:flutter_application_motionhack/model/transaction_model.dart';
import 'package:flutter_application_motionhack/pages/interview_detail_accept_page.dart';
import 'package:flutter_application_motionhack/shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';

class SchedulePages extends StatefulWidget {
  final InterviewModel user;
  final TransactionModel userTrans;
  const SchedulePages(this.user, this.userTrans, {Key? key}) : super(key: key);

  @override
  State<SchedulePages> createState() => _SchedulePagesState();
}

class _SchedulePagesState extends State<SchedulePages> {
  String _date = "Not set";
  final TextEditingController link = TextEditingController(text: '');
  String _time = "Not set";

  void initState() {
    super.initState();
  }

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
              Text(
                'Interview Schedule',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
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
                            'John Doe',
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
                                widget.userTrans.confirmation_status,
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
                  Text(
                    'Interview Schedule',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Text(
                        'Time',
                        style: GoogleFonts.poppins(fontSize: 18),
                      ),
                      SizedBox(
                        width: 37,
                      ),
                      Container(
                        width: 132,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text("$_time"),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 110,
                        height: 35,
                        decoration: BoxDecoration(
                          color: Color(0xff68A5FF),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                            child: TextButton(
                          onPressed: () {
                            DatePicker.showTimePicker(context,
                                theme: DatePickerTheme(
                                  containerHeight: 210.0,
                                ),
                                showTitleActions: true, onConfirm: (time) {
                              print('confirm $time');
                              _time =
                                  '${time.hour} : ${time.minute} : ${time.second}';
                              setState(() {});
                            },
                                currentTime: DateTime.now(),
                                locale: LocaleType.en);
                          },
                          child: Text(
                            'Pick Time',
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
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        'Date',
                        style: GoogleFonts.poppins(fontSize: 18),
                      ),
                      SizedBox(
                        width: 37,
                      ),
                      Container(
                        width: 132,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(" $_date"),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 110,
                        height: 35,
                        decoration: BoxDecoration(
                          color: Color(0xff68A5FF),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                            child: TextButton(
                          onPressed: () {
                            DatePicker.showDatePicker(context,
                                theme: DatePickerTheme(
                                  containerHeight: 210.0,
                                ),
                                showTitleActions: true,
                                minTime: DateTime(2000, 1, 1),
                                maxTime: DateTime(2022, 12, 31),
                                onConfirm: (date) {
                              print('confirm $date');
                              _date =
                                  '${date.year} - ${date.month} - ${date.day}';
                              setState(() {});
                            },
                                currentTime: DateTime.now(),
                                locale: LocaleType.en);
                          },
                          child: Text(
                            'Pick date',
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
                  SizedBox(
                    height: 18,
                  ),
                  Text(
                    'Meeting Link',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Container(
                    width: double.infinity,
                    height: 45,
                    padding: EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextField(
                      controller: link,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Paste your video conference link here ...",
                        hintStyle:
                            TextStyle(color: Color(0xff6F6F6F), fontSize: 12),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 14,
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
                          child: Container(
                        child: TextButton(
                          onPressed: () => showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: Text('Confirm schedule?',
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  )),
                              content: Text(
                                  'Make sure you’re available at the choosen timesss.',
                                  style: GoogleFonts.poppins(
                                    color: Color(0xffAFAFAF),
                                  )),
                              actions: <Widget>[
                                Center(
                                  child: BlocConsumer<InterviewCubit,
                                      InterviewState>(
                                    listener: (context, state) {
                                      // TODO: implement listener
                                      if (state is InterviewSuccess) {
                                        Navigator.pushNamed(
                                            context, '/home-hr-page');
                                      } else if (state is InterviewFailed) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            backgroundColor: Colors.red,
                                            content: Text(state.error),
                                          ),
                                        );
                                      }
                                    },
                                    builder: (context, state) {
                                      if (state is InterviewLoading) {
                                        return Container(
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.only(top: 30),
                                          child: CircularProgressIndicator(),
                                        );
                                      }
                                      return Container(
                                        width: 110,
                                        height: 35,
                                        decoration: BoxDecoration(
                                          color: Color(0xff68A5FF),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: TextButton(
                                          onPressed: () {
                                            context
                                                .read<InterviewCubit>()
                                                .createInterview(
                                                    widget.user,
                                                    widget.user.transactionId,
                                                    _date,
                                                    _time);
                                          },
                                          child: Text('Confirm',
                                              style: GoogleFonts.poppins(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600)),
                                        ),
                                      );
                                    },
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
                      )),
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
