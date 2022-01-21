import 'package:flutter/material.dart';
import 'package:jobnow_version_1/constants.dart';
import 'package:url_launcher/url_launcher.dart';

import '../body.dart';

final String phoneNum = "123456789";

launchEmail() async {
  launch("mailto:employer@gmail.com?subject=Job Verification Result&body=Your job is approve%20");
}

Widget cardEmail(BuildContext context){
  return InkWell(
    onTap: (){
      launchEmail();
    },
    child: Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)
      ),
      elevation: 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.email,
            color: Colors.black,
            size: 100,
          ),
          Text('Email'),
        ],
      ),
    ),
  );
}

Widget cardPhoneCall(BuildContext context){
  return InkWell(
    onTap: (){
      launch('sms:+12 3456?body=Your job is approved');
    },
    child: Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)
      ),
      elevation: 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.message,
            color: Colors.black,
            size: 100,
          ),
          Text('SMS'),
        ],
      ),
    ),
  );
}

class SendNotification extends StatelessWidget {
  const SendNotification({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppbarColor,
        title: Text('Send Notification'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Expanded(
                    child: GridView.count(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      crossAxisCount: 2,
                      children: [
                        cardEmail(context),
                        cardPhoneCall(context),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Body(),
                        ),
                      );
                    },
                    child: Text('Back to home',
                        style: TextStyle(
                            color: Colors.white
                        )),
                    style: TextButton.styleFrom(
                      backgroundColor: kAppbarColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      backgroundColor: kBackgroundColor,
    );
  }
}