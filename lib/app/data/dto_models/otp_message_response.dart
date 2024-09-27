class OtpMessageResponse {
  int otp;
  String message;
  Map<String, dynamic>? errors;

  OtpMessageResponse({
    required this.otp,
    required this.message,
    this.errors,
  });

  factory OtpMessageResponse.fromJson(Map<String, dynamic> json) {
    return OtpMessageResponse(
      otp: json['otp'] as int,
      message: json['message'] as String,
      errors: json['errors'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['otp'] = this.otp;
    data['message'] = this.message;
    return data;
  }
}
