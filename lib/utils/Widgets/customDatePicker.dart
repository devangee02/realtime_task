import 'package:calendar_date_picker2/calendar_date_picker2.dart';

import '../../data/bloc/add_employee/add_em_bloc.dart';
import '../../data/employee_data.dart';
import '../../res/functions/functions.dart';
import '../../res/import/import.dart';

class StartDatePicker extends StatelessWidget {
  StartDatePicker({Key? key}) : super(key: key);

  List<DateTime> _dates = [
    DateTime.now(),
  ];
  List<DateTime?> _Selecteddates = [];
  String _displayDate = 'No Date';
  String _key = 'None';
  @override
  Widget build(BuildContext context) {
    final config = SizeConfig();
    final HomeBloc homeBloc = HomeBloc();
    return Dialog(
      insetPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      backgroundColor: Colors.transparent,
      clipBehavior: Clip.hardEdge,
      child: Material(
        color: Colors.white,
        // borderRadius: BorderRadius.circular(borderRadius),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: config.sh(544),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
            child: StatefulBuilder(builder: (context, setter) {
              return Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 2.4,
                          height: config.sh(36),
                          child: CustomButton2(
                            onPressed: () {
                              startDateController.text = getTodayDate();
                              _displayDate = getTodayDate();
                              homeBloc.add(AddEmployeeValueEvent(
                                startDateController: startDateController,
                              ));
                              _key = 'Today';
                              setter(() {});
                            },
                            title: 'Today',
                            buttonColor:
                                _key != 'Today' ? Color(0xffEDF8FF) : null,
                            borderColor:
                                _key != 'Today' ? Color(0xffEDF8FF) : null,
                            textColor:
                                _key != 'Today' ? Color(0xff1DA1F2) : null,
                          )),
                      XMargin(10),
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 2.4,
                          height: config.sh(36),
                          child: CustomButton2(
                            onPressed: () {
                              startDateController.text = getNextMonday();
                              _displayDate = getNextMonday();
                              homeBloc.add(AddEmployeeValueEvent(
                                startDateController: startDateController,
                              ));
                              _key = 'Next Monday';
                              setter(() {});
                            },
                            title: 'Next Monday',
                            buttonColor: _key != 'Next Monday'
                                ? Color(0xffEDF8FF)
                                : null,
                            borderColor: _key != 'Next Monday'
                                ? Color(0xffEDF8FF)
                                : null,
                            textColor: _key != 'Next Monday'
                                ? Color(0xff1DA1F2)
                                : null,
                          )),
                    ],
                  ),
                  YMargin(10),
                  Row(
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 2.4,
                          height: config.sh(36),
                          child: CustomButton2(
                            onPressed: () {
                              startDateController.text = getNextTuesday();
                              _displayDate = getNextTuesday();
                              homeBloc.add(AddEmployeeValueEvent(
                                startDateController: startDateController,
                              ));
                              _key = 'Next Tuesday';
                              setter(() {});
                            },
                            title: 'Next Tuesday',
                            buttonColor: _key != 'Next Tuesday'
                                ? Color(0xffEDF8FF)
                                : null,
                            borderColor: _key != 'Next Tuesday'
                                ? Color(0xffEDF8FF)
                                : null,
                            textColor: _key != 'Next Tuesday'
                                ? Color(0xff1DA1F2)
                                : null,
                          )),
                      XMargin(10),
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 2.4,
                          height: config.sh(36),
                          child: CustomButton2(
                            onPressed: () {
                              startDateController.text = getOneWeekFromNow();
                              _displayDate = getOneWeekFromNow();
                              homeBloc.add(AddEmployeeValueEvent(
                                startDateController: startDateController,
                              ));
                              _key = 'After 1 week';
                              setter(() {});
                            },
                            title: 'After 1 week',
                            buttonColor: _key != 'After 1 week'
                                ? Color(0xffEDF8FF)
                                : null,
                            borderColor: _key != 'After 1 week'
                                ? Color(0xffEDF8FF)
                                : null,
                            textColor: _key != 'After 1 week'
                                ? Color(0xff1DA1F2)
                                : null,
                          )),
                    ],
                  ),
                  YMargin(10),
                  Flexible(
                    child: Stack(
                      children: [
                        CalendarDatePicker2(
                          config: CalendarDatePicker2WithActionButtonsConfig(
                            firstDayOfWeek: 1,
                            calendarType: CalendarDatePicker2Type.single,
                            selectedDayTextStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                            selectedDayHighlightColor: Colors.purple[800],
                            centerAlignModePicker: true,
                            customModePickerIcon: SizedBox(),
                            // dayBuilder: yourDayBuilder(),
                            // yearBuilder: yourYearBuilder(),
                          ),
                          value:
                              _Selecteddates.isEmpty ? _dates : _Selecteddates,
                          onValueChanged: (dates) {
                            _Selecteddates = dates;
                            startDateController.text =
                                convertDateFormat(dates.toString());
                            _key = 'None';
                            _displayDate = convertDateFormat(dates.toString());
                            homeBloc.add(AddEmployeeValueEvent(
                              startDateController: startDateController,
                            ));
                            setter(() {});
                          },
                        ),
                        Align(
                          alignment: FractionalOffset.bottomRight,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Divider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                          'assets/images/event_FILL0_wght300_GRAD0_opsz24 (1) 1 (1).png'),
                                      XMargin(10),
                                      Text(
                                        _displayDate,
                                        style: TextStyle(
                                            fontSize: config.sp(18),
                                            color: realtimetaskTextColor,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                  Row(
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
                                              Navigator.pop(context);
                                            },
                                            title: 'Save',
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}

class EndDatePicker extends StatelessWidget {
  EndDatePicker({Key? key}) : super(key: key);

  List<DateTime> _dates = [
    DateTime.now(),
  ];
  List<DateTime?> _Selecteddates = [];
  String _displayDate = 'No Date';
  String _key = 'None';
  @override
  Widget build(BuildContext context) {
    final config = SizeConfig();
    final HomeBloc homeBloc = HomeBloc();
    return Dialog(
      insetPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      backgroundColor: Colors.transparent,
      clipBehavior: Clip.hardEdge,
      child: Material(
        color: Colors.white,
        // borderRadius: BorderRadius.circular(borderRadius),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: config.sh(544),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
            child: StatefulBuilder(builder: (context, setter) {
              return Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 2.4,
                          height: config.sh(36),
                          child: CustomButton2(
                            onPressed: () {
                              endDateController.text = 'No Date';
                              _displayDate = 'No Date';
                              homeBloc.add(AddEmployeeValueEvent(
                                endDateController: endDateController,
                              ));
                              _key = 'No Date';
                              setter(() {});
                            },
                            title: 'No Date',
                            buttonColor:
                                _key != 'No Date' ? Color(0xffEDF8FF) : null,
                            borderColor:
                                _key != 'No Date' ? Color(0xffEDF8FF) : null,
                            textColor:
                                _key != 'No Date' ? Color(0xff1DA1F2) : null,
                          )),
                      XMargin(10),
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 2.4,
                          height: config.sh(36),
                          child: CustomButton2(
                            onPressed: () {
                              endDateController.text = getTodayDate();
                              _displayDate = getTodayDate();
                              homeBloc.add(AddEmployeeValueEvent(
                                endDateController: endDateController,
                              ));
                              _key = 'Today';
                              setter(() {});
                            },
                            title: 'Today',
                            buttonColor:
                                _key != 'Today' ? Color(0xffEDF8FF) : null,
                            borderColor:
                                _key != 'Today' ? Color(0xffEDF8FF) : null,
                            textColor:
                                _key != 'Today' ? Color(0xff1DA1F2) : null,
                          )),
                    ],
                  ),
                  YMargin(10),
                  Flexible(
                    child: Stack(
                      children: [
                        CalendarDatePicker2(
                          config: CalendarDatePicker2WithActionButtonsConfig(
                            firstDayOfWeek: 1,
                            calendarType: CalendarDatePicker2Type.single,
                            selectedDayTextStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                            selectedDayHighlightColor: Colors.purple[800],
                            centerAlignModePicker: true,
                            customModePickerIcon: SizedBox(),
                            // dayBuilder: yourDayBuilder(),
                            // yearBuilder: yourYearBuilder(),
                          ),
                          value:
                              _Selecteddates.isEmpty ? _dates : _Selecteddates,
                          onValueChanged: (dates) {
                            _Selecteddates = dates;
                            endDateController.text =
                                convertDateFormat(dates.toString());
                            _key = 'None';
                            _displayDate = convertDateFormat(dates.toString());
                            homeBloc.add(AddEmployeeValueEvent(
                              endDateController: endDateController,
                            ));
                            setter(() {});
                          },
                        ),
                        Align(
                          alignment: FractionalOffset.bottomRight,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Divider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                          'assets/images/event_FILL0_wght300_GRAD0_opsz24 (1) 1 (1).png'),
                                      XMargin(10),
                                      Text(
                                        _displayDate,
                                        style: TextStyle(
                                            fontSize: config.sp(18),
                                            color: realtimetaskTextColor,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                  Row(
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
                                              Navigator.pop(context);
                                            },
                                            title: 'Save',
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
