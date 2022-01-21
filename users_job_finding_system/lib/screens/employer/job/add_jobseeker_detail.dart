import 'package:flutter/material.dart';
import 'package:jobnow_users/models/jobseeker_model.dart';
import 'package:jobnow_users/screens/employer/chat/chat_room.dart';
import 'package:jobnow_users/screens/employer/employer_home.dart';
import 'package:jobnow_users/screens/employer/job/add_jobseeker.dart';
import 'package:jobnow_users/services/http_service.dart';

import '../../../constants.dart';

class AddJobseekerDetail extends StatelessWidget {
  final JobseekerModel jobseeker;
  final HttpService httpService = HttpService();
  AddJobseekerDetail({required this.jobseeker});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          backgroundColor: kAppbarColor,
          title: Text('Approve Jobseeker', style: TextStyle(color: Colors.white),),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ListTile(
                        title: Text("Name"),
                        subtitle: Text(jobseeker.name),
                      ),
                      ListTile(
                        title: Text("Contact Number"),
                        subtitle: Text("${jobseeker.contactNumber}"),
                      ),
                      ListTile(
                        title: Text("Email"),
                        subtitle: Text(jobseeker.email),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(110, 5, 0, 0),
                      child: Row(
                        children: [
                          TextButton(
                            onPressed: (){
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Jobseeker is Added !")));
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => EmployerHome(),
                                ),
                              );
                            },
                            child: Text('Approve',
                                style: TextStyle(
                                    color: Colors.white
                                )),
                            style: TextButton.styleFrom(
                                backgroundColor: kApproveColor
                            ),
                          ),
                          SizedBox(width: 15,),
                          TextButton(
                            onPressed: (){
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => EmployerHome(),
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
                      ),
                    )

                  ],
                )
              ],
            ),
          ),
        )
    );
  }
}