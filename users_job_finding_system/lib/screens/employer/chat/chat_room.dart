import 'package:flutter/material.dart';
import 'package:jobnow_users/screens/employer/chat/screens/chat_page.dart';
import 'package:jobnow_users/screens/employer/employer_home.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants.dart';

final String phoneNum = "123456789";

launchEmail() async {
  launch("mailto:jobseeker@gmail.com?subject=Job Cancel&body=Job is cancel%20");
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
Widget chatRoom(BuildContext context){
  return InkWell(
    onTap: (){
      Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ChatPage(),
          )
      );
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
          Text('Chat Room'),
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
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: kAppbarColor,
        title: Text('Contact Methods', style: TextStyle(color: Colors.white),),
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
                        chatRoom(context)
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