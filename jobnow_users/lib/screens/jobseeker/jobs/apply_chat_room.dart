import 'package:flutter/material.dart';
import 'package:jobnow_users/screens/jobseeker/jobs/apply_job.dart';
import 'package:jobnow_users/screens/jobseeker/jobseeker_home.dart';
import 'package:url_launcher/url_launcher.dart';

final String phoneNum = "123456789";

launchEmail() async {
  launch("mailto:liangjun487@gmail.com?subject=Job Application&body=I am very interested in accepting this job%20plugin");
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
      launch('tel:+12 3456789122');
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

class JobseekerApplyChatRoom extends StatelessWidget {
  const JobseekerApplyChatRoom({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFAB47BC),
        title: Text('Contact Employer'),
        centerTitle: true,
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
              Row(
                children: [
                  SizedBox(width: 40,),
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
                        backgroundColor: Color(0xFFAB47BC)
                    ),
                  ),
                  SizedBox(width: 15,),
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
                            color: Color(0xFFAB47BC)
                        )),
                    style: TextButton.styleFrom(
                        backgroundColor: Color(0xFFFFF176)
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
    );
  }
}