import 'package:flutter/material.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            Text(
              'SUCCESS PAGEs',
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/main-page');
                },
                child: Text('Home'))
          ],
        ),
      )),
    );
  }
}
