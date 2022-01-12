import 'package:flutter/material.dart';
import 'package:jobnow_users/models/jobs_model.dart';
import 'package:jobnow_users/screens/jobseeker/jobs/apply_chat_room.dart';
import 'package:jobnow_users/services/http_service.dart';

import '../chat_room.dart';
import '../jobseeker_home.dart';

class JobDetail extends StatelessWidget {
  final JobsModel job;
  final HttpService httpService = HttpService();
  JobDetail({required this.job});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text( "Title: " + job.jobTitle),
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
                        title: Text("Title"),
                        subtitle: Text(job.jobTitle),
                      ),
                      ListTile(
                        title: Text("Job Content"),
                        subtitle: Text("${job.jobContent}"),
                      ),
                      ListTile(
                        title: Text("Total Payment(RM)"),
                        subtitle: Text(job.totalPayment.toString()),
                      ),
                      ListTile(
                        title: Text("Start Date"),
                        subtitle: Text(job.startDateAt),
                      ),
                      ListTile(
                        title: Text("End Date"),
                        subtitle: Text(job.endDateAt),
                      ),
                      ListTile(
                        title: Text("Start Time"),
                        subtitle: Text(job.startTimeAt),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(140, 5, 0, 0),
                      child: Row(
                        children: [
                          TextButton(
                            onPressed: (){
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => JobseekerApplyChatRoom(),
                                  )
                              );
                            },
                            child: Text('Apply Job',
                                style: TextStyle(
                                    color: Colors.white
                                )),
                            style: TextButton.styleFrom(
                                backgroundColor: Color(0xFFAB47BC),
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