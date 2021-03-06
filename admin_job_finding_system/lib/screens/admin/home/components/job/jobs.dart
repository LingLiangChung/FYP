import 'package:flutter/material.dart';
import 'package:jobnow_version_1/screens/admin/home/components/job/jobs_model.dart';
import 'package:jobnow_version_1/service/http_service.dart';
import 'jobs_details.dart';

class JobsPage extends StatelessWidget {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF424242),
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
                      tileColor: Color(0xFFEFEBE9),
                  title: Text( "\n" + "Job Title: " + job.jobTitle ,
                    style: TextStyle(
                        fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  subtitle: Text( "Job Content: " + "${job.jobContent}" + "..."),

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
      backgroundColor: Color(0xFFEFEBE9),
    );
  }
}