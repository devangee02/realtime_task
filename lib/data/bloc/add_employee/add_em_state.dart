import '../../../res/import/import.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionState extends HomeState {}

class HomeInitial extends HomeState {}

class HomeEmptyState extends HomeState {}

class HomeLoadedSuccessState extends HomeState {
  final List<EmployeeModel> currentEmployees;
  final List<EmployeeModel> previousEmployees;
  HomeLoadedSuccessState({
    required this.currentEmployees,
    required this.previousEmployees,
  });
}

class AddEmployeeSuccessState extends HomeState {
  final TextEditingController employeeNameController;
  final TextEditingController jobController;
  final TextEditingController startDateController;
  final TextEditingController endDateController;

  AddEmployeeSuccessState({
    required this.employeeNameController,
    required this.jobController,
    required this.startDateController,
    required this.endDateController,
  });
}

class EditEmployeeSuccessState extends HomeState {
  final TextEditingController employeeNameController;
  final TextEditingController jobController;
  final TextEditingController startDateController;
  final TextEditingController endDateController;

  EditEmployeeSuccessState({
    required this.employeeNameController,
    required this.jobController,
    required this.startDateController,
    required this.endDateController,
  });
}

class HomeErrorState extends HomeState {}

class HomeNavigateToWishlistPageActionState extends HomeActionState {}

class HomeNavigateToAddEmPageActionState extends HomeActionState {}

class HomeNavigateToEditEmPageActionState extends HomeActionState {}

class HomePopAddEmPageActionState extends HomeActionState {}

class HomeProductItemCartedActionState extends HomeActionState {}
