import 'package:flutter/material.dart';
import 'package:jobnow_users/constants.dart';
import 'package:jobnow_users/models/jobs_model.dart';
import 'package:jobnow_users/services/http_service.dart';
import 'job_detail.dart';

class ManageJob extends StatelessWidget {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppbarColor,
        title: Text("Jobs Management"),
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
                  title: Text("Name: " + job.jobTitle,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),),
                  subtitle: Text("Contact Number: " + "${job.jobContent}" + "..."),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => JobsDetail(
                        job: job,
                      ),
                    ),
                  ),
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