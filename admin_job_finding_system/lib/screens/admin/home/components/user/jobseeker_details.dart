import 'package:flutter/material.dart';
import 'package:jobnow_version_1/constants.dart';
import 'package:jobnow_version_1/screens/admin/home/components/body.dart';
import 'package:jobnow_version_1/screens/admin/home/components/user/jobseeker_model.dart';
import 'package:jobnow_version_1/service/http_service.dart';

class JobseekerDetail extends StatelessWidget {
  final JobseekerModel jobseeker;
  final HttpService httpService = HttpService();
  JobseekerDetail({required this.jobseeker});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kAppbarColor,
          title: Text("Jobseeker Detail"),
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
                      ListTile(
                        title: Text("IC"),
                        subtitle: Text("${jobseeker.nric}"),
                      ),
                    ],
                  ),
                ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: (){
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Body(),
                                ),
                              );
                            },
                            child: Text('Legal',
                                style: TextStyle(
                                    color: Colors.white
                                )),
                            style: TextButton.styleFrom(
                                backgroundColor: kApproveColor,
                            ),
                          ),
                          SizedBox(width: 10,),
                          TextButton(
                            onPressed: () async {
                              await httpService.deleteJobseeker(jobseeker.id);
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Body(),
                                ),
                              );
                            },
                            child: Text('Block',
                                style: TextStyle(
                                    color: Colors.white
                                )),
                            style: TextButton.styleFrom(
                                backgroundColor: kRejectColor,
                            ),
                          ),
                        ],
                      ),
                  ],
                )
          ),
        ),
      backgroundColor: kBackgroundColor,
    );
  }
}