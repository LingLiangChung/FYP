import 'package:flutter/material.dart';
import 'package:jobnow_users/models/jobs_model.dart';
import 'package:jobnow_users/services/http_service.dart';
import 'jobs_details.dart';

class JobsPage extends StatelessWidget {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFAB47BC),
        title: Text("Find Jobs"),
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
                  title: Text( "Job Title: " + job.jobTitle),
                  subtitle: Text( "Job Content: " + "${job.jobContent}"),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => JobDetail(
                        job: job,
                      ),
                    ),
                  ),
                ),
              ).toList(),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}