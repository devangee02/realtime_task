import '../../../../data/bloc/add_employee/add_em_bloc.dart';
import '../../../../data/bloc/add_employee/add_em_state.dart';
import '../../../../data/employee_data.dart';
import '../../../../res/import/import.dart';

class EditEmployee extends StatefulWidget {
  final int index;
  EditEmployee({Key? key, required this.index}) : super(key: key);

  @override
  State<EditEmployee> createState() => _EditEmployeeState();
}

class _EditEmployeeState extends State<EditEmployee> {
  List<DateTime> _dates = [
    DateTime.now(),
  ];

  final HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    homeBloc.add(AddInitialEvent());
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
        if (state is HomePopAddEmPageActionState) {
          Navigator.pushReplacementNamed(context, RouteNames.home);
        } else if (state is HomeProductItemCartedActionState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Item Carted')));
        } else if (state is HomePopAddEmPageActionState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Item Wishlisted')));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case AddEmployeeSuccessState:
            final successState = state as AddEmployeeSuccessState;
            return Scaffold(
              appBar: CustomAppbar(title: 'Edit Employee Details'),
              body: StatefulBuilder(builder: (context, setState) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          CustomTextFormField(
                            obscureText: false,
                            readonly: false,
                            hintText: 'Employee name',
                            prefixIcon: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Image.asset(
                                  'assets/images/person_FILL0_wght300_GRAD0_opsz24 (2) 1.png'),
                            ),
                            controller: successState.employeeNameController,
                            onsaved: (val) {
                              employeeNameController.text = val!;
                              homeBloc.add(AddEmployeeValueEvent(
                                employeeNameController: employeeNameController,
                              ));
                            },
                          ),
                          YMargin(10),
                          Builder(builder: (ctx) {
                            return CustomTextFormField(
                              obscureText: false,
                              readonly: true,
                              controller: successState.jobController,
                              onTap: () {
                                Scaffold.of(ctx).showBottomSheet<void>(
                                  (BuildContext context) {
                                    return BottomSheetWidget();
                                  },
                                );
                              },
                              hintText: 'Select role',
                              prefixIcon: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Image.asset(
                                    'assets/images/work_FILL0_wght300_GRAD0_opsz24 1.png'),
                              ),
                              suffixIcon: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Image.asset(
                                    'assets/images/arrow_drop_down_FILL1_wght400_GRAD0_opsz24 3.png'),
                              ),
                            );
                          }),
                          YMargin(10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2.5,
                                child: CustomTextFormField(
                                  obscureText: false,
                                  readonly: true,
                                  hintText: 'Today',
                                  controller: successState.startDateController,
                                  onTap: () {
                                    showDialog<List<DateTime?>>(
                                      context: context,
                                      // useRootNavigator: useRootNavigator,
                                      // routeSettings: routeSettings,
                                      builder: (BuildContext context) {
                                        return StartDatePicker();
                                      },
                                      barrierDismissible: false,
                                    );
                                  },
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Image.asset(
                                        'assets/images/event_FILL0_wght300_GRAD0_opsz24 (1) 1 (1).png'),
                                  ),
                                ),
                              ),
                              Image.asset(
                                  'assets/images/arrow_right_alt_FILL0_wght500_GRAD0_opsz24 14.png'),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2.5,
                                child: CustomTextFormField(
                                  onTap: () {
                                    showDialog<List<DateTime?>>(
                                      context: context,
                                      // useRootNavigator: useRootNavigator,
                                      // routeSettings: routeSettings,
                                      builder: (BuildContext context) {
                                        return EndDatePicker();
                                      },
                                      barrierDismissible: false,
                                    );
                                  },
                                  obscureText: false,
                                  readonly: true,
                                  hintText: 'No date',
                                  controller: successState.endDateController,
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Image.asset(
                                        'assets/images/event_FILL0_wght300_GRAD0_opsz24 (1) 1 (1).png'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          YMargin(10),
                        ],
                      ),
                      Align(
                        alignment: FractionalOffset.bottomRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                                width: config.sw(73),
                                height: config.sh(40),
                                child: CustomButton2(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  title: 'Cancel',
                                  buttonColor: Color(0xffEDF8FF),
                                  borderColor: Color(0xffEDF8FF),
                                  textColor: Color(0xff1DA1F2),
                                )),
                            XMargin(10),
                            SizedBox(
                                width: config.sw(73),
                                height: config.sh(40),
                                child: CustomButton2(
                                  onPressed: () {
                                    EmployeeModel newModel = EmployeeModel(
                                      employeeName: successState
                                          .employeeNameController.text,
                                      job: successState.jobController.text,
                                      endDate:
                                          successState.endDateController.text,
                                      startDate:
                                          successState.startDateController.text,
                                    );
                                    homeBloc.add(
                                        HomeEditEmployeeButtonClickedEvent(
                                            clickedProduct: newModel,
                                            index: widget.index));
                                  },
                                  title: 'Save',
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }),
            );

          default:
        }
        return Container();
      },
    );
  }
}
