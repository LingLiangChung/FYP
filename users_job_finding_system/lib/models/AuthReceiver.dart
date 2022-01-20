class AuthReceiver {
  Jobseeker? jobseeker;
  String? token;

  AuthReceiver({this.jobseeker, this.token});

  AuthReceiver.fromJson(Map<String, dynamic> json) {
    jobseeker = json['jobseeker'] != null
        ? new Jobseeker.fromJson(json['jobseeker'])
        : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.jobseeker != null) {
      data['jobseeker'] = this.jobseeker!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class Jobseeker {
  int? id;
  String? name;
  int? contactNumber;
  int? nric;
  String? email;
  String? position;
  String? createdAt;
  String? updatedAt;

  Jobseeker(
      {this.id,
        this.name,
        this.contactNumber,
        this.nric,
        this.email,
        this.position,
        this.createdAt,
        this.updatedAt});

  Jobseeker.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    contactNumber = json['contact_number'];
    nric = json['nric'];
    email = json['email'];
    position = json['position'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['contact_number'] = this.contactNumber;
    data['nric'] = this.nric;
    data['email'] = this.email;
    data['position'] = this.position;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}