import 'package:flutter/material.dart';
import 'package:jobnow_users/constants.dart';
import 'package:jobnow_users/models/jobs_model.dart';
import 'package:jobnow_users/services/http_service.dart';

import 'job_detail.dart';
import 'job_status_detail.dart';

class CheckJobStatus extends StatelessWidget {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: kAppbarColor,
        title: Text('Job Status', style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: httpService.getJobs(),
        builder: (BuildContext context, AsyncSnapshot<List<JobsModel>> snapshot) {
          if (snapshot.hasData) {
            List<JobsModel>? jobs = snapshot.data;
            return ListView(
              children: jobs!
                  .map(
                    (JobsModel job) => ListTile(
                  title: Text("Name: " + job.jobTitle),
                  subtitle: Text("Contact Number: " + "${job.jobContent}"),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => JobsStatusDetail(
                        job: job,
                      ),
                    ),
                  ),
                      leading: Container(
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(
                          color: job.jobStatus.toString() == "Pending"?Colors.redAccent:kApproveColor,
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Center(
                          child: Text(job.jobStatus,
                            style: TextStyle(
                                color: Colors.white
                            ),),
                        )
                      )
                ),
              )
                  .toList(),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      backgroundColor: kBackgroundColor,
    );
  }
}