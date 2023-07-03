class EmployeeModel {
  String employeeName;
  String job;
  String? startDate;
  String? endDate;

  EmployeeModel(
      {this.startDate,
      this.endDate,
      required this.employeeName,
      required this.job});
}
