import 'package:flutter/material.dart';
import 'package:jobnow_users/constants.dart';
import 'package:jobnow_users/screens/employer/chat/screens/chat_page.dart';
import 'package:jobnow_users/screens/jobseeker/jobs/apply_job.dart';
import 'package:jobnow_users/screens/jobseeker/jobseeker_home.dart';
import 'package:url_launcher/url_launcher.dart';

final String phoneNum = "123456789";

launchEmail() async {
  launch("mailto:liangjun487@gmail.com?subject=Job Application&body=I am very interested in accepting this job%20");
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

Widget cardChatRoom(BuildContext context){
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

class JobseekerApplyChatRoom extends StatelessWidget {
  const JobseekerApplyChatRoom({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: kAppbarColor,
        title: Text('Job Confirmation', style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Card(
                    child: Center(
                      child: Text(
                        'Before you apply this job,\n'
                            'you may contact employer to get\n'
                            'more information.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: kTextColor,
                        ),
                      ),
                    ),
                  ),

              SizedBox(height: 15,),
              Expanded(
                child: GridView.count(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: [
                    cardEmail(context),
                    cardChatRoom(context),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ConfirmApply(),
                        ),
                      );
                    },
                    child: Text('Confirm Apply Job',
                        style: TextStyle(
                            color: Colors.white
                        )),
                    style: TextButton.styleFrom(
                        backgroundColor: kApproveColor
                    ),
                  ),
                  TextButton(
                    onPressed: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => JobseekerHome(),
                        ),
                      );
                    },
                    child: Text('Decide Later',
                        style: TextStyle(
                            color: Colors.white
                        )),
                    style: TextButton.styleFrom(
                        backgroundColor: kRejectColor
                    ),
                  ),
                ],
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