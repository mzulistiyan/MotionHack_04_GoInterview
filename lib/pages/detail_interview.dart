import 'dart:io';

import 'package:dropdown_below/dropdown_below.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_motionhack/cubit/auth_cubit.dart';
import 'package:flutter_application_motionhack/model/transaction_model.dart';
import 'package:flutter_application_motionhack/model/user_hr_model.dart';
import 'package:flutter_application_motionhack/model/user_model.dart';

import 'package:flutter_application_motionhack/pages/payment_page.dart';

import 'package:flutter_application_motionhack/services/transaction_service.dart';
import 'package:flutter_application_motionhack/shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_file/open_file.dart';

class DetailInterviewer extends StatefulWidget {
  final UserHrModel humanResources;

  const DetailInterviewer(this.humanResources, {Key? key}) : super(key: key);

  @override
  State<DetailInterviewer> createState() => _DetailInterviewerState();
}

class _DetailInterviewerState extends State<DetailInterviewer> {
  String fileType = 'All';
  var fileTypeList = ['All', 'Image', 'Video', 'Audio', 'MultipleFile'];

  FilePickerResult? result;
  PlatformFile? resume;
  PlatformFile? motivation_letter;
  PlatformFile? portofolio;

  String? selectedValue;
  List<String> items = [
    'UI Designer',
    'Front End Developer',
    'Back End Developer',
    'UX Designer',
  ];

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
              Icon(
                Icons.arrow_back_ios,
                size: 25,
                color: Colors.white,
              ),
              SizedBox(
                width: 15,
              ),
              Text('Apply Interview',
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
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    header(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 40),
                          Text(
                            'Interviewer',
                            style: GoogleFonts.poppins(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 16),
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            width: double.infinity,
                            height: 84,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(),
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
                                        padding:
                                            const EdgeInsets.only(bottom: 5),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              widget.humanResources.name,
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              'Human Resource',
                                              style: GoogleFonts.poppins(
                                                  fontSize: 12,
                                                  color: Color(0xff9F9F9F)),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 50,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 30),
                          Text(
                            'Application Form',
                            style: GoogleFonts.poppins(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Position',
                            style: GoogleFonts.poppins(fontSize: 18),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          DropdownButtonHideUnderline(
                            child: DropdownButton2(
                              isExpanded: true,
                              hint: Row(
                                children: const [
                                  Expanded(
                                    child: Text(
                                      'Select Item',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              items: items
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ))
                                  .toList(),
                              value: selectedValue,
                              onChanged: (value) {
                                setState(() {
                                  selectedValue = value as String;
                                });
                              },
                              icon: const Icon(
                                Icons.arrow_forward_ios_outlined,
                              ),
                              iconSize: 14,
                              iconEnabledColor: Colors.black,
                              iconDisabledColor: Colors.grey,
                              buttonHeight: 40,
                              buttonWidth: double.infinity,
                              buttonPadding:
                                  const EdgeInsets.only(left: 14, right: 14),
                              buttonDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white,
                              ),
                              buttonElevation: 2,
                              itemHeight: 40,
                              itemPadding:
                                  const EdgeInsets.only(left: 14, right: 14),
                              dropdownMaxHeight: 200,
                              dropdownWidth: 392,
                              dropdownPadding: null,
                              dropdownDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: Colors.white,
                              ),
                              dropdownElevation: 8,
                              scrollbarRadius: const Radius.circular(40),
                              scrollbarThickness: 6,
                              scrollbarAlwaysShow: true,
                              offset: const Offset(-20, 0),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'CV/Resume',
                            style: GoogleFonts.poppins(fontSize: 18),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Container(
                            width: double.infinity,
                            height: 95,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (resume != null) fileDetails(resume!),
                                  Container(
                                    width: 110,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      color: Color(0xff68A5FF),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: TextButton(
                                        onPressed: () {
                                          pickFilesResume(fileType);
                                        },
                                        child: Text(
                                          'Browse File',
                                          style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            'Motivation Letter',
                            style: GoogleFonts.poppins(fontSize: 18),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Container(
                            width: double.infinity,
                            height: 95,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (motivation_letter != null)
                                    fileDetails(motivation_letter!),
                                  Container(
                                    width: 110,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      color: Color(0xff68A5FF),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: TextButton(
                                        onPressed: () {
                                          pickFilesMotivationLetter(fileType);
                                        },
                                        child: Text(
                                          'Browse File',
                                          style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            'Portofolio',
                            style: GoogleFonts.poppins(fontSize: 18),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Container(
                            width: double.infinity,
                            height: 95,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (portofolio != null)
                                    fileDetails(portofolio!),
                                  Container(
                                    width: 110,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      color: Color(0xff68A5FF),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: TextButton(
                                        onPressed: () {
                                          pickFilesPortofolio(fileType);
                                        },
                                        child: Text(
                                          'Browse File',
                                          style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Center(
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
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PaymentPage(
                                        TransactionModel(
                                          position: selectedValue.toString(),
                                          userHrId: widget.humanResources.id
                                              .toString(),
                                          nameUser: state.user.name.toString(),
                                          userId: state.user.id.toString(),
                                          nameHR: widget.humanResources.name
                                              .toString(),
                                          fileResume: resume.toString(),
                                          fileMotivationLetter:
                                              motivation_letter.toString(),
                                          filePortofolio: portofolio.toString(),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Payment',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              )),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          }
          return SizedBox();
        },
      ),
    );
  }

  Widget fileDetails(PlatformFile file) {
    final kb = file.size / 1024;
    final mb = kb / 1024;
    final size = (mb >= 1)
        ? '${mb.toStringAsFixed(2)} MB'
        : '${kb.toStringAsFixed(2)} KB';
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('File Name: ${file.name}'),
        ],
      ),
    );
  }

  void pickFilesResume(String? filetype) async {
    result = await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result == null) return;
    resume = result!.files.first;
    setState(() {});
  }

  void pickFilesMotivationLetter(String? filetype) async {
    result = await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result == null) return;
    motivation_letter = result!.files.first;
    setState(() {});
  }

  void pickFilesPortofolio(String? filetype) async {
    result = await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result == null) return;
    portofolio = result!.files.first;
    setState(() {});
  }

  // multiple file selected
  // navigate user to 2nd screen to show selected files

  // open the picked file
  void viewFile(PlatformFile file) {
    OpenFile.open(file.path);
  }
}
