import 'package:flutter/material.dart';
import 'package:jobnow_users/screens/employer/employer_home.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants.dart';

final String phoneNum = "123456789";

launchEmail() async {
  launch("mailto:jobseeker@gmail.com?subject=Job Application Approve&body=I am approve your job application%20plugin");
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
      launch('tel:+98 7456231');
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
            Icons.phone,
            color: Colors.black,
            size: 100,
          ),
          Text('Phone Call'),
        ],
      ),
    ),
  );
}

class EmployerChatRoom extends StatelessWidget {
  const EmployerChatRoom({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppbarColor,
        title: Text('Contact Methods'),
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
                          builder: (context) => EmployerHome(),
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