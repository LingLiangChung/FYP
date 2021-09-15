class JobsModel {
    final int id;
    final int? employerId;
    final int? jobseekerId;
    final int? adminId;
    final int? paymentId;
    final String jobTitle;
    final String jobContent;
    final int totalPayment;
    final String startDateAt;
    final String endDateAt;
    final String startTimeAt;
    final String jobStatus;
    final int jobVerification;

    const JobsModel({
        required this.id,
        required this.employerId,
        required this.jobseekerId,
        required this.adminId,
        required this.paymentId,
        required this.jobTitle,
        required this.jobContent,
        required this.totalPayment,
        required this.startDateAt,
        required this.endDateAt,
        required this.startTimeAt,
        required this.jobStatus,
        required this.jobVerification,
    });

    factory JobsModel.fromJson(Map<String, dynamic> json) => JobsModel(
        id: json["id"],
        employerId: json["employer_id"],
        jobseekerId: json["jobseeker_id"],
        adminId: json["admin_id"],
        paymentId: json["payment_id"],
        jobTitle: json["job_title"],
        jobContent: json["job_content"],
        totalPayment: json["total_payment"],
        startDateAt: json["startDate_at"],
        endDateAt: json["endDate_at"],
        startTimeAt: json["startTime_at"],
        jobStatus: json["job_status"],
        jobVerification: json["job_verification"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "employer_id": employerId,
        "jobseeker_id": jobseekerId,
        "admin_id": adminId,
        "payment_id": paymentId,
        "job_title": jobTitle,
        "job_content": jobContent,
        "total_payment": totalPayment,
        "startDate_at": startDateAt,
        "endDate_at": endDateAt,
        "startTime_at": startTimeAt,
        "job_status": jobStatus,
        "job_verification": jobVerification,
    };
}