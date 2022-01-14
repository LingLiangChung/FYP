import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jobnow_users/models/jobs_model.dart';
import 'package:jobnow_users/screens/employer/search/jobseeker_model.dart';

class JobseekerApi {
  static Future<List<JobseekerModel>> getJobs(String query) async {
    final url = Uri.parse(
        'http://192.168.0.136:8000/api/all_jobseeker');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List jobseekers = json.decode(response.body);

      return jobseekers.map((json) => JobseekerModel.fromJson(json)).where((jobseeker) {
        final jobseekerNameLower = jobseeker.name.toLowerCase();
        final searchLower = query.toLowerCase();

        return jobseekerNameLower.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}
