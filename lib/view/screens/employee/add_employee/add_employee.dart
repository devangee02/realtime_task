import '../../../../data/bloc/add_employee/add_em_bloc.dart';
import '../../../../data/bloc/add_employee/add_em_state.dart';
import '../../../../data/employee_data.dart';
import '../../../../res/import/import.dart';

class AddEmployee extends StatefulWidget {
  AddEmployee({Key? key}) : super(key: key);

  @override
  State<AddEmployee> createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
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
              appBar: CustomAppbar(title: 'Add Employee Details'),
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
                                    if (endDateController.text.isEmpty ||
                                        endDateController.text == '') {
                                      endDateController.text = 'No date';
                                    }
                                    EmployeeModel newModel = EmployeeModel(
                                      employeeName: successState
                                          .employeeNameController.text,
                                      job: successState.jobController.text,
                                      endDate:
                                          successState.startDateController.text,
                                      startDate:
                                          successState.startDateController.text,
                                    );
                                    homeBloc.add(
                                        HomeAddEmployeeButtonClickedEvent(
                                            clickedProduct: newModel));
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

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final config = SizeConfig();
    final HomeBloc homeBloc = HomeBloc();
    return Container(
      width: MediaQuery.of(context).size.width,
      height: config.sh(211),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: realtimetaskWhite),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          children: [
            YMargin(15),
            GestureDetector(
              onTap: () {
                jobController.text = 'Product Designer';
                homeBloc.add(AddEmployeeValueEvent(
                  jobController: jobController,
                ));
                Navigator.pop(context);
              },
              child: BottomSheetOptions(
                title: 'Product Designer',
                last: false,
              ),
            ),
            YMargin(15),
            GestureDetector(
              onTap: () {
                jobController.text = 'Flutter Developer';
                homeBloc.add(AddEmployeeValueEvent(
                  jobController: jobController,
                ));
                Navigator.pop(context);
              },
              child: BottomSheetOptions(
                title: 'Flutter Developer',
                last: false,
              ),
            ),
            YMargin(15),
            GestureDetector(
              onTap: () {
                jobController.text = 'QA Tester';
                homeBloc.add(AddEmployeeValueEvent(
                  jobController: jobController,
                ));
                Navigator.pop(context);
              },
              child: BottomSheetOptions(
                title: 'QA Tester',
                last: false,
              ),
            ),
            YMargin(15),
            GestureDetector(
              onTap: () {
                jobController.text = 'Product Owner';
                homeBloc.add(AddEmployeeValueEvent(
                  jobController: jobController,
                ));
                Navigator.pop(context);
              },
              child: BottomSheetOptions(
                title: 'Product Owner',
                last: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomSheetOptions extends StatelessWidget {
  String title;
  bool last;
  BottomSheetOptions({Key? key, required this.title, required this.last})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final config = SizeConfig();
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: config.sp(16),
              color: realtimetaskTextColor,
              fontWeight: FontWeight.w500),
        ),
        YMargin(5),
        if (!last) Divider()
      ],
    );
  }
}
