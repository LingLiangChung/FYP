import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jobnow_users/constants.dart';
import 'package:jobnow_users/models/jobseeker_model.dart';
import 'package:jobnow_users/screens/employer/chat_room.dart';
import 'package:jobnow_users/services/http_service.dart';

import '../employer_home.dart';

class JobseekerDetail extends StatelessWidget {
  final JobseekerModel jobseeker;
  final HttpService httpService = HttpService();
  JobseekerDetail({required this.jobseeker});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kAppbarColor,
          title: Text("Jobseeker Details"),
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
                      padding: EdgeInsets.fromLTRB(5, 5, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                            onPressed: (){
                              final data = ClipboardData(text: "${jobseeker.contactNumber}");
                              Clipboard.setData(data);
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Copied")));
                            },
                            child: Text('Copy Contact Number',
                                style: TextStyle(
                                    color: Colors.white,
                                )),
                            style: TextButton.styleFrom(
                                backgroundColor: kAppbarColor
                            ),
                          ),
                          TextButton(
                            onPressed: (){
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => EmployerChatRoom(),
                                ),
                              );
                            },
                            child: Text('Contact Jobseeker',
                                style: TextStyle(
                                    color: kTextColor,
                                )),
                            style: TextButton.styleFrom(
                                backgroundColor: kApproveColor
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
        ),
      backgroundColor: kBackgroundColor,
    );
  }
}