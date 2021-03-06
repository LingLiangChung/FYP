import 'package:flutter/material.dart';
import 'package:jobnow_users/constants.dart';
import 'package:jobnow_users/models/jobseeker_model.dart';
import 'package:jobnow_users/services/http_service.dart';

import 'jobseekers_details.dart';

class JobseekerPage extends StatelessWidget {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: kAppbarColor,
        title: Text('Jobseekers List', style: TextStyle(color: Colors.white),),
        centerTitle: true,
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
                  title: Text("Name: " + jobseeker.name,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),),
                  subtitle: Text("Contact Number: " + "${jobseeker.contactNumber}"),
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
    );
  }
}