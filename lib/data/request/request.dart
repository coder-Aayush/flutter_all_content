class LoginRequest {
  String email;
  String password;
  String imei;
  String deviceType;

  LoginRequest(this.email, this.password, this.imei, this.deviceType);
}

class RegisterRequest {
  String userName;
  String countryMobileCode;
  String email;
  String password;
  String mobileNumber;
  String profilePicture;

  RegisterRequest(this.userName, this.countryMobileCode, this.email,
      this.password, this.mobileNumber, this.profilePicture);
}
