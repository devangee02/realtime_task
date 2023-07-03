import '../../../data/bloc/add_employee/add_em_bloc.dart';
import '../../../res/import/import.dart';

class EmployeeListWidget extends StatelessWidget {
  final EmployeeModel employeeModel;
  final HomeBloc homeBloc;
  const EmployeeListWidget(
      {super.key, required this.employeeModel, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    final config = SizeConfig();
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: realtimetaskWhite,
        border: Border.symmetric(
            horizontal: BorderSide(color: realtimetaskGrey, width: 0.2)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              employeeModel.employeeName,
              style: TextStyle(
                  fontSize: config.sp(16),
                  color: realtimetaskTextColor,
                  fontWeight: FontWeight.w500),
            ),
            YMargin(10),
            Text(
              employeeModel.job,
              style: TextStyle(
                  fontSize: config.sp(14),
                  color: realtimetaskGrey,
                  fontWeight: FontWeight.w500),
            ),
            YMargin(10),
            Text(
              'From ' + employeeModel.startDate!,
              style: TextStyle(
                  fontSize: config.sp(12),
                  color: realtimetaskGrey,
                  fontWeight: FontWeight.w500),
            ),
            YMargin(10),
          ],
        ),
      ),
    );
  }
}

class PreviousEmployeeListWidget extends StatelessWidget {
  final EmployeeModel employeeModel;
  final HomeBloc homeBloc;
  const PreviousEmployeeListWidget(
      {super.key, required this.employeeModel, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    final config = SizeConfig();
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: realtimetaskWhite,
        border: Border.symmetric(
            horizontal: BorderSide(color: realtimetaskGrey, width: 0.2)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              employeeModel.employeeName,
              style: TextStyle(
                  fontSize: config.sp(16),
                  color: realtimetaskTextColor,
                  fontWeight: FontWeight.w500),
            ),
            YMargin(10),
            Text(
              employeeModel.job,
              style: TextStyle(
                  fontSize: config.sp(14),
                  color: realtimetaskGrey,
                  fontWeight: FontWeight.w500),
            ),
            YMargin(10),
            Text(
              employeeModel.startDate! + '-' + employeeModel.endDate!,
              style: TextStyle(
                  fontSize: config.sp(12),
                  color: realtimetaskGrey,
                  fontWeight: FontWeight.w500),
            ),
            YMargin(10),
          ],
        ),
      ),
    );
  }
}
