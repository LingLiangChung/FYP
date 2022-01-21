class JobsModel {
  final int id;
  final String jobTitle;
  final String jobContent;
  final int totalPayment;
  final String startDateAt;
  final String endDateAt;
  final String startTimeAt;
  final String jobStatus;

  JobsModel({
    required this.id,
    required this.jobTitle,
    required this.jobContent,
    required this.totalPayment,
    required this.startDateAt,
    required this.endDateAt,
    required this.startTimeAt,
    required this.jobStatus,
  });

  factory JobsModel.fromJson(Map<String, dynamic> json) =>
      JobsModel(
        id: json["id"],
        jobTitle: json["job_title"],
        jobContent: json["job_content"],
        totalPayment: json["total_payment"],
        startDateAt: json["startDate_at"],
        endDateAt: json["endDate_at"],
        startTimeAt: json["startTime_at"],
        jobStatus: json["job_status"],
      );
}