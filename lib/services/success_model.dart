class AppSuccess {
  bool? success;
  AppSuccess({this.success});
}

List<AppSuccess> SuccessLog = [
  AppSuccess(success: true),
  AppSuccess(success: false),
];