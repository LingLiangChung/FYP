import 'package:flutter/material.dart';
import 'package:jobnow_users/constants.dart';
import 'package:jobnow_users/models/jobs_model.dart';
import 'package:jobnow_users/screens/employer/chat_room.dart';
import 'package:jobnow_users/services/http_service.dart';

import 'make_payment.dart';

class JobsStatusDetail extends StatelessWidget {
  final JobsModel job;
  final HttpService httpService = HttpService();
  JobsStatusDetail({required this.job});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kAppbarColor,
          title: Text("Job Status Detail"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Job Title',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: Color(0xFFE8EAF6),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 6,
                            offset: Offset(2,3),
                          ),
                        ],
                      ),
                      height: 60,
                      child: TextField(
                          enabled: false,
                          keyboardType: TextInputType.name,
                          style: TextStyle(
                            color: Colors.black87,
                          ),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(top: 14),
                              prefixIcon: Icon(
                                  Icons.work,
                                  color: Colors.black87
                              ),
                              hintText: job.jobTitle,
                              hintStyle: TextStyle(
                                  color: Colors.black87
                              )
                          )
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Job Content',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: Color(0xFFE8EAF6),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 6,
                            offset: Offset(2,3),
                          ),
                        ],
                      ),
                      height: 60,
                      child: TextField(
                        enabled: false,
                          minLines: 3,
                          maxLines: 5,
                          keyboardType: TextInputType.name,
                          style: TextStyle(
                            color: Colors.black87,
                          ),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(top: 14),
                              prefixIcon: Icon(
                                  Icons.text_fields,
                                  color: Colors.black87
                              ),
                              hintText: job.jobContent,
                              hintStyle: TextStyle(
                                  color: Colors.black87
                              )
                          )
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Job Salary',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: Color(0xFFE8EAF6),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 6,
                            offset: Offset(2,3),
                          ),
                        ],
                      ),
                      height: 60,
                      child: TextField(
                        enabled: false,
                          keyboardType: TextInputType.name,
                          style: TextStyle(
                            color: Colors.black87,
                          ),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(top: 14),
                              prefixIcon: Icon(
                                  Icons.attach_money,
                                  color: Colors.black87
                              ),
                              hintText: job.totalPayment.toString(),
                              hintStyle: TextStyle(
                                  color: Colors.black87
                              )
                          )
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Job Status',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: Color(0xFFE8EAF6),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 6,
                            offset: Offset(2,3),
                          ),
                        ],
                      ),
                      height: 60,
                      child: TextField(
                          enabled: false,
                          keyboardType: TextInputType.name,
                          style: TextStyle(
                            color: Colors.black87,
                          ),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(top: 14),
                              prefixIcon: Icon(
                                  Icons.hourglass_bottom,
                                  color: Colors.black87
                              ),
                              hintText: job.jobStatus,
                              hintStyle: TextStyle(
                                  color: Colors.black87
                              )
                          )
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Responsible for jobseeker',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: Color(0xFFE8EAF6),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 6,
                            offset: Offset(2,3),
                          ),
                        ],
                      ),
                      height: 60,
                      child: TextField(
                          enabled: false,
                          keyboardType: TextInputType.name,
                          style: TextStyle(
                            color: Colors.black87,
                          ),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(top: 14),
                              prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.black87
                              ),
                              hintText: 'jobseeker',
                              hintStyle: TextStyle(
                                  color: Colors.black87
                              )
                          )
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(100, 5, 0, 0),
                      child: Row(
                        children: [
                          TextButton(
                            onPressed: (){
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => MakePayment(),
                                ),
                              );
                            },
                            child: Text('Job Done',
                                style: TextStyle(
                                    color: kTextColor
                                )),
                            style: TextButton.styleFrom(
                                backgroundColor: kApproveColor
                            ),
                          ),
                          SizedBox(width: 10,),
                          TextButton(
                            onPressed: () async{
                              await httpService.deleteJob(job.id);
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => EmployerChatRoom(),
                                ),
                              );
                            },
                            child: Text('Job Cancel',
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
        ),
      backgroundColor: kBackgroundColor,
    );
  }
}