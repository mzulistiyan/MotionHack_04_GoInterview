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
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return Scaffold(
      backgroundColor: Colors.grey,
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.user.name),
                    Text(widget.humanResources.name),
                    Text(widget.humanResources.email),
                    Center(
                        child: Column(
                      children: [
                        DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            isExpanded: true,
                            hint: Row(
                              children: const [
                                Icon(
                                  Icons.list,
                                  size: 16,
                                  color: Colors.yellow,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Expanded(
                                  child: Text(
                                    'Select Item',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.yellow,
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
                                          color: Colors.white,
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
                            iconEnabledColor: Colors.yellow,
                            iconDisabledColor: Colors.grey,
                            buttonHeight: 50,
                            buttonWidth: 160,
                            buttonPadding:
                                const EdgeInsets.only(left: 14, right: 14),
                            buttonDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                color: Colors.black26,
                              ),
                              color: Colors.redAccent,
                            ),
                            buttonElevation: 2,
                            itemHeight: 40,
                            itemPadding:
                                const EdgeInsets.only(left: 14, right: 14),
                            dropdownMaxHeight: 200,
                            dropdownWidth: 200,
                            dropdownPadding: null,
                            dropdownDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: Colors.redAccent,
                            ),
                            dropdownElevation: 8,
                            scrollbarRadius: const Radius.circular(40),
                            scrollbarThickness: 6,
                            scrollbarAlwaysShow: true,
                            offset: const Offset(-20, 0),
                          ),
                        ),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (resume != null) fileDetails(resume!),
                              ElevatedButton(
                                onPressed: () async {
                                  pickFilesResume(fileType);
                                },
                                child: Text('Browse File'),
                              ),
                              if (motivation_letter != null)
                                fileDetails(motivation_letter!),
                              ElevatedButton(
                                onPressed: () async {
                                  pickFilesMotivationLetter(fileType);
                                },
                                child: Text('Browse File'),
                              ),
                              if (portofolio != null) fileDetails(portofolio!),
                              ElevatedButton(
                                onPressed: () async {
                                  pickFilesPortofolio(fileType);
                                },
                                child: Text('Browse File'),
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PaymentPage(
                                          TransactionModel(
                                            position: selectedValue.toString(),
                                            userHrId: widget.humanResources.id
                                                .toString(),
                                            nameUser:
                                                state.user.name.toString(),
                                            userId: state.user.id.toString(),
                                            nameHR: widget.humanResources.name
                                                .toString(),
                                            fileResume: resume.toString(),
                                            fileMotivationLetter:
                                                motivation_letter.toString(),
                                            filePortofolio:
                                                portofolio.toString(),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  child: Text('Payment'))
                            ],
                          ),
                        ),
                      ],
                    ))
                  ],
                ),
              ),
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
