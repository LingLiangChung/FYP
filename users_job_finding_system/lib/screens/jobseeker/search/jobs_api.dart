import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jobnow_users/models/jobs_model.dart';

class JobsApi {
  static Future<List<JobsModel>> getJobs(String query) async {
    final url = Uri.parse(
        'http://192.168.0.136:8000/api/all_jobs');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List jobs = json.decode(response.body);

      return jobs.map((json) => JobsModel.fromJson(json)).where((job) {
        final jobTitleLower = job.jobTitle.toLowerCase();
        final jobContentLower = job.jobContent.toLowerCase();
        final searchLower = query.toLowerCase();

        return jobTitleLower.contains(searchLower) ||
          jobContentLower.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}
