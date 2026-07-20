class ChangePasswordParameter {
  ChangePasswordParameter(this.oldPassword, this.newPassword);
  final String oldPassword,newPassword;
    Map<String,dynamic>toJson()=>{
    'old_password':oldPassword,
    'password':newPassword,
    'password_confirmation':newPassword,
  };

}