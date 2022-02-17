import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_motionhack/pages/file_list.dart';

import 'package:open_file/open_file.dart';

class FilePickerDemo extends StatefulWidget {
  const FilePickerDemo({Key? key}) : super(key: key);

  @override
  _FilePickerDemoState createState() => _FilePickerDemoState();
}

class _FilePickerDemoState extends State<FilePickerDemo> {
  String fileType = 'All';
  var fileTypeList = ['All', 'Image', 'Video', 'Audio', 'MultipleFile'];

  FilePickerResult? result;
  PlatformFile? file1;
  PlatformFile? file2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (file1 != null) fileDetails(file1!),
            ElevatedButton(
              onPressed: () async {
                pickFiles1(fileType);
              },
              child: Text('Pick file'),
            ),
            if (file2 != null) fileDetails(file2!),
            ElevatedButton(
              onPressed: () async {
                pickFiles2(fileType);
              },
              child: Text('Pick file'),
            ),
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

  void pickFiles1(String? filetype) async {
    result = await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result == null) return;
    file1 = result!.files.first;
    setState(() {});
  }

  void pickFiles2(String? filetype) async {
    result = await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result == null) return;
    file2 = result!.files.first;
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
