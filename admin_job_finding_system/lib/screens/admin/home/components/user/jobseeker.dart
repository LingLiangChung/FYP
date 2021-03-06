import 'package:flutter/material.dart';
import 'package:jobnow_version_1/constants.dart';
import 'package:jobnow_version_1/screens/admin/home/components/job/jobs_model.dart';
import 'package:jobnow_version_1/screens/admin/home/components/user/jobseeker_details.dart';
import 'package:jobnow_version_1/service/http_service.dart';

import 'jobseeker_model.dart';

class JobseekerPage extends StatelessWidget {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppbarColor,
        title: Text("Jobseekers Management"),
      ),
      body: FutureBuilder(
        future: httpService.getJobseeker(),
        builder: (BuildContext context, AsyncSnapshot<List<JobseekerModel>> snapshot) {
          if (snapshot.hasData) {
            List<JobseekerModel>? jobseekers = snapshot.data;
            return ListView(
              children: jobseekers!
                  .map(
                    (JobseekerModel jobseeker) => ListTile(
                  title: Text("Name: " + jobseeker.name, style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),),
                  subtitle: Text("Contact Number: " + "${jobseeker.contactNumber}" + "..."),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => JobseekerDetail(
                        jobseeker: jobseeker,
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