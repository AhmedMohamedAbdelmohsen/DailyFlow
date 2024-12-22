class LoginModel {
  num id;
  String name;
  String email;
  num enabled;
  String token;
  String message;
  num admin;
  num warnings;

  LoginModel(this.id, this.name, this.email, this.enabled, this.token,
      this.message, this.admin, this.warnings);
}
