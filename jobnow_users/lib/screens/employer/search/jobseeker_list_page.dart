import 'dart:async';
import 'package:flutter/material.dart';
import 'package:jobnow_users/screens/employer/search/jobseeker_api.dart';
import 'package:jobnow_users/screens/employer/search/jobseeker_detail.dart';
import 'package:jobnow_users/screens/employer/search/jobseeker_model.dart';
import 'package:jobnow_users/screens/jobseeker/search/jobs_page.dart';
import 'package:jobnow_users/screens/jobseeker/search/search_widget.dart';

class JobseekerListPage extends StatefulWidget {

  const JobseekerListPage({ 
    Key? key,
    }) : super(key: key);

  @override
  _JobseekerListPageState createState() => _JobseekerListPageState();
}

class _JobseekerListPageState extends State<JobseekerListPage> {
  List<JobseekerModel> jobseekers = [];
  String query = '';
  Timer? debouncer;
  
  @override
  void initState() { 
    super.initState();
    
    init();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void debounce(
    VoidCallback callback, {
      Duration duration = const Duration(milliseconds: 1000),
    }) {
      if (debouncer != null) {
      debouncer!.cancel();
    }

    debouncer = Timer(duration, callback);
    }

    Future init() async {
    final jobseekers = await JobseekerApi.getJobs(query);

    setState(() => this.jobseekers = jobseekers);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
          title: Text(JobsList.title),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            buildSearch(),
            Expanded(
              child: ListView.builder(
                itemCount: jobseekers.length,
                itemBuilder: (context, index) {
                  final jobseeker = jobseekers[index];
                  return buildJobseeker(jobseeker);
                },
              ),
            ),
          ],
        ),
  );
  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Jobseeker Name',
        onChanged: searchJobseeker,
      );
      
  Future searchJobseeker(String query) async => debounce(() async {
        final jobseekers = await JobseekerApi.getJobs(query);

        if (!mounted) return;

        setState(() {
          this.query = query;
          this.jobseekers = jobseekers;
        });
      });

      Widget buildJobseeker(JobseekerModel jobseeker) => ListTile(
        leading: Icon(
          Icons.work,
        ),
        title: Text(jobseeker.name),
        onTap: (){
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => JobseekerDetails(),
            )
          );
        },
      );
  
}