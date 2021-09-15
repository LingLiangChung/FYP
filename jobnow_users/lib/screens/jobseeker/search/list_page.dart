import 'dart:async';
import 'package:flutter/material.dart';
import 'package:jobnow_users/models/jobs_model.dart';
import 'package:jobnow_users/screens/jobseeker/job_details.dart';
import 'package:jobnow_users/screens/jobseeker/search/jobs_api.dart';
import 'package:jobnow_users/screens/jobseeker/search/jobs_page.dart';
import 'package:jobnow_users/screens/jobseeker/search/search_widget.dart';

class JobsListPage extends StatefulWidget {

  const JobsListPage({ 
    Key? key,
    }) : super(key: key);

  @override
  _JobsListPageState createState() => _JobsListPageState();
}

class _JobsListPageState extends State<JobsListPage> {
  List<JobsModel> jobs = [];
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
    final jobs = await JobsApi.getJobs(query);

    setState(() => this.jobs = jobs);
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
                itemCount: jobs.length,
                itemBuilder: (context, index) {
                  final job = jobs[index];
                  return buildJob(job);
                },
              ),
            ),
          ],
        ),
  );
  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Job Name or Job Content',
        onChanged: searchJob,
      );
      
  Future searchJob(String query) async => debounce(() async {
        final jobs = await JobsApi.getJobs(query);

        if (!mounted) return;

        setState(() {
          this.query = query;
          this.jobs = jobs;
        });
      });

      Widget buildJob(JobsModel job) => ListTile(
        leading: Icon(
          Icons.work,
        ),
        title: Text(job.jobTitle),
        subtitle: Text(job.jobContent),
        onTap: (){
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => JobDetails(),
            )
          );
        },
      );
  
}