import 'package:flutter/material.dart';
import 'package:jobnow_users/screens/employer/employer_home.dart';
import 'package:jobnow_users/screens/jobseeker/jobseeker_home.dart';

import '../../../constants.dart';


class ConfirmApply extends StatelessWidget {
  const ConfirmApply({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: kAppbarColor,
        title: Text('Confirm Apply Job', style: TextStyle(color: Colors.white),),
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
                      crossAxisCount: 1,
                      children: [
                        payment(context),
                      ],
                    ),
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
Widget payment(BuildContext context){
  return Card(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8)
    ),
    elevation: 4,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.work,
          color: Colors.black,
          size: 100,
        ),
        Text('Are you sure to apply this job ?'),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => JobseekerHome(),
                  ),
                );
              },
              child: Text('Yes',
                  style: TextStyle(
                      color: Colors.white
                  )),
              style: TextButton.styleFrom(
                  backgroundColor: kApproveColor
              ),
            ),
            SizedBox(width: 10,),
            TextButton(
              onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => JobseekerHome(),
                  ),
                );
              },
              child: Text('Cancel',
                  style: TextStyle(
                      color: Colors.white
                  )),
              style: TextButton.styleFrom(
                  backgroundColor: kRejectColor
              ),
            ),
          ],
        )

      ],
    ),
  );
}
