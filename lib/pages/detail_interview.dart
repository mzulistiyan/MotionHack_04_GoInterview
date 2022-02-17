import 'dart:io';

import 'package:dropdown_below/dropdown_below.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_motionhack/cubit/auth_cubit.dart';
import 'package:flutter_application_motionhack/model/transaction_model.dart';
import 'package:flutter_application_motionhack/model/user_hr_model.dart';
import 'package:flutter_application_motionhack/model/user_model.dart';
import 'package:flutter_application_motionhack/pages/file_list.dart';
import 'package:flutter_application_motionhack/pages/file_picker.dart';
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
  List _testList = [
    {'no': 1, 'keyword': 'Front End Developer'},
    {'no': 2, 'keyword': 'Back End Developer'},
    {'no': 3, 'keyword': 'UI Designer'},
    {'no': 4, 'keyword': 'UX Designer'}
  ];
  List<DropdownMenuItem<Object?>> _dropdownTestItems = [];
  var _selectedTest;

  @override
  void initState() {
    _dropdownTestItems = buildDropdownTestItems(_testList);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<DropdownMenuItem<Object?>> buildDropdownTestItems(List _testList) {
    List<DropdownMenuItem<Object?>> items = [];
    for (var i in _testList) {
      items.add(
        DropdownMenuItem(
          value: i,
          child: Text(i['keyword']),
        ),
      );
    }
    return items;
  }

  onChangeDropdownTests(selectedTest) {
    print(selectedTest);
    setState(() {
      _selectedTest = selectedTest;
    });
  }

  String fileType = 'All';
  var fileTypeList = ['All', 'Image', 'Video', 'Audio', 'MultipleFile'];

  FilePickerResult? result;
  PlatformFile? resume;
  PlatformFile? motivation_letter;
  PlatformFile? portofolio;

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
                        DropdownBelow(
                          dropdownColor: Colors.white,
                          itemWidth: 250,
                          itemTextstyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                          boxTextstyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                          boxPadding: EdgeInsets.fromLTRB(13, 12, 13, 12),
                          boxWidth: 250,
                          boxHeight: 45,
                          boxDecoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border:
                                  Border.all(width: 1, color: Colors.black)),
                          icon: Icon(
                            Icons.settings,
                            color: Colors.white54,
                          ),
                          hint: Text(
                            'Please choose a position',
                            style: TextStyle(color: Colors.black),
                          ),
                          value: _selectedTest,
                          items: _dropdownTestItems,
                          onChanged: onChangeDropdownTests,
                        ),
                        // ElevatedButton(
                        //   onPressed: () {
                        //     Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //             builder: (context) => FilePickerDemo()));
                        //   },
                        //   child: Text('FilePicker Demo'),
                        // ),
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
                              // if (file != null)
                              //   ElevatedButton(
                              //     onPressed: () {
                              //       viewFile(file!);
                              //     },
                              //     child: Text('View Selected File'),
                              //   )
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
  void loadSelectedFiles(List<PlatformFile> files) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => FileList(files: files, onOpenedFile: viewFile)));
  }

  // open the picked file
  void viewFile(PlatformFile file) {
    OpenFile.open(file.path);
  }
}
