import 'package:realtimetask/view/screens/employee/edit_employee/edit_employee.dart';

import '../../../data/bloc/add_employee/add_em_bloc.dart';
import '../../../data/bloc/add_employee/add_em_state.dart';
import '../../../data/employee_data.dart';
import '../../../res/functions/functions.dart';
import '../../../res/import/import.dart';
import 'employee_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final config = SizeConfig();
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToAddEmPageActionState) {
          Navigator.pushNamed(context, RouteNames.addEmp);
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeEmptyState:
            return Scaffold(
              appBar: CustomAppbar(title: 'Employee List'),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/Group 5363.png'),
                    YMargin(10),
                    Text(
                      'No employee records found',
                      style: TextStyle(
                          fontSize: config.sp(18),
                          color: realtimetaskTextColor,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              floatingActionButton: InkWell(
                onTap: () {
                  employeeNameController.clear();
                  jobController.clear();
                  startDateController.clear();
                  endDateController.clear();
                  homeBloc.add(HomeFloatActionButtonNavigateEvent());
                },
                child: Container(
                  height: config.sh(50),
                  width: config.sw(50),
                  decoration: BoxDecoration(
                    color: realtimetaskPrimaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.add,
                    color: realtimetaskWhite,
                  ),
                ),
              ),
            );
          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;
            return Scaffold(
              appBar: CustomAppbar(title: 'Employee List'),
              body: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          Text(
                            'Current employees',
                            style: TextStyle(
                                fontSize: config.sp(16),
                                color: realtimetaskPrimaryColor,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    YMargin(20),
                    Flexible(
                      child: ListView.builder(
                          itemCount: successState.currentEmployees.length,
                          itemBuilder: (ctx, index) {
                            return GestureDetector(
                              onTap: () {
                                employeeNameController.text = successState
                                    .currentEmployees[index].employeeName;
                                jobController.text =
                                    successState.currentEmployees[index].job;
                                startDateController.text = successState
                                    .currentEmployees[index].startDate!;
                                endDateController.text = successState
                                    .currentEmployees[index].endDate!;
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            EditEmployee(index: index)));
                              },
                              child: Dismissible(
                                // Specify the direction to swipe and delete
                                direction: DismissDirection.endToStart,
                                key: Key('item.Title'),
                                onDismissed: (direction) {
                                  endDateController.text = getTodayDate();
                                  homeBloc.add(
                                      HomeRemoveEmployeeButtonClickedEvent(
                                          clickedProduct: successState
                                              .currentEmployees[index]));
                                },
                                background:
                                    Container(color: realtimetaskDarkSellColor),
                                child: EmployeeListWidget(
                                    homeBloc: homeBloc,
                                    employeeModel:
                                        successState.currentEmployees[index]),
                              ),
                            );
                          }),
                    ),
                    YMargin(20),
                    if (successState.previousEmployees.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          children: [
                            Text(
                              'Previous employees',
                              style: TextStyle(
                                  fontSize: config.sp(16),
                                  color: realtimetaskPrimaryColor,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    if (successState.previousEmployees.isNotEmpty) YMargin(20),
                    if (successState.previousEmployees.isNotEmpty)
                      Flexible(
                        child: ListView.builder(
                            itemCount: successState.previousEmployees.length,
                            shrinkWrap: true,
                            itemBuilder: (ctx, index) {
                              return PreviousEmployeeListWidget(
                                  homeBloc: homeBloc,
                                  employeeModel:
                                      successState.previousEmployees[index]);
                            }),
                      ),
                  ],
                ),
              ),
              floatingActionButton: InkWell(
                onTap: () {
                  employeeNameController.clear();
                  jobController.clear();
                  startDateController.clear();
                  endDateController.clear();
                  homeBloc.add(HomeFloatActionButtonNavigateEvent());
                },
                child: Container(
                  height: config.sh(50),
                  width: config.sw(50),
                  decoration: BoxDecoration(
                    color: realtimetaskPrimaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.add,
                    color: realtimetaskWhite,
                  ),
                ),
              ),
            );

          case HomeErrorState:
            return Scaffold(body: Center(child: Text('Error')));
          default:
            return SizedBox();
        }
      },
    );
  }
}
