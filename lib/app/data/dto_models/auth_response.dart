class AuthResponse {
  String? message;
  String? token;
  Map<String, dynamic>? errors;
  CustomerData? data;

  AuthResponse({required this.message, this.errors});

  AuthResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    token = json['token'];
    errors = json['errors'];
    data = json['data'] != null ? CustomerData.fromJson(json['data']) : null;
  }
}

class CustomerData {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? gender;
  String? dateOfBirth;
  String? phone;
  dynamic status;
  dynamic notes;
  String? createdAt;
  String? updatedAt;

  CustomerData(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.gender,
      this.dateOfBirth,
      this.phone,
      this.status,
      this.notes,
      this.createdAt,
      this.updatedAt});

  CustomerData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    gender = json['gender'];
    dateOfBirth = json['date_of_birth'];
    phone = json['phone'];
    status = json['status'];
    notes = json['notes'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['gender'] = this.gender;
    data['date_of_birth'] = this.dateOfBirth;
    data['phone'] = this.phone;
    data['status'] = this.status;
    data['notes'] = this.notes;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
