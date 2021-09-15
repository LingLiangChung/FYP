import 'package:flutter/material.dart';
import 'package:jobnow_users/models/jobs_model.dart';
import 'package:jobnow_users/screens/employer/employer_home.dart';
import 'package:jobnow_users/services/http_service.dart';

import 'add_jobseeker.dart';

class JobsDetail extends StatelessWidget {
  final JobsModel job;
  final HttpService httpService = HttpService();
  JobsDetail({required this.job});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFAB47BC),
          title: Text("Job Management"),
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
                      color: Colors.white,
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
                        color: Colors.white,
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
                        color: Colors.white,
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
                      'Job Start Date',
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
                        color: Colors.white,
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
                          keyboardType: TextInputType.name,
                          style: TextStyle(
                            color: Colors.black87,
                          ),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(top: 14),
                              prefixIcon: Icon(
                                  Icons.date_range_outlined,
                                  color: Colors.black87
                              ),
                              hintText: job.startDateAt,
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
                      'Job End Date',
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
                        color: Colors.white,
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
                          keyboardType: TextInputType.name,
                          style: TextStyle(
                            color: Colors.black87,
                          ),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(top: 14),
                              prefixIcon: Icon(
                                  Icons.date_range_outlined,
                                  color: Colors.black87
                              ),
                              hintText: job.endDateAt,
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
                      'Job Start Time',
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
                        color: Colors.white,
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
                          keyboardType: TextInputType.name,
                          style: TextStyle(
                            color: Colors.black87,
                          ),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(top: 14),
                              prefixIcon: Icon(
                                  Icons.timelapse,
                                  color: Colors.black87
                              ),
                              hintText: job.startTimeAt,
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
                      padding: EdgeInsets.fromLTRB(60, 5, 0, 0),
                      child: Row(
                        children: [
                          TextButton(
                            onPressed: (){
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => AddJobseeker(),
                                ),
                              );
                            },
                            child: Text('Add Jobseeker',
                                style: TextStyle(
                                    color: Colors.white
                                )),
                            style: TextButton.styleFrom(
                                backgroundColor: Color(0xFFAB47BC)
                            ),
                          ),
                          SizedBox(width: 10,),
                          TextButton(
                            onPressed: (){
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => EmployerHome(),
                                ),
                              );
                            },
                            child: Text('Edit',
                                style: TextStyle(
                                    color: Color(0xFFAB47BC)
                                )),
                            style: TextButton.styleFrom(
                                backgroundColor: Color(0xFFFFF176)
                            ),
                          ),
                          SizedBox(width: 10,),
                          TextButton(
                            onPressed: () async {
                              await httpService.deleteJob(job.id);
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => EmployerHome(),
                                ),
                              );
                            },
                            child: Text('Delete',
                                style: TextStyle(
                                    color: Colors.white
                                )),
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.red
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