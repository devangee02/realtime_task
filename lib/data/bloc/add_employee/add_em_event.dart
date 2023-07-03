part of 'add_em_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class AddInitialEvent extends HomeEvent {}

class HomeProductWishlistButtonClickedEvent extends HomeEvent {
  final EmployeeModel clickedProduct;
  HomeProductWishlistButtonClickedEvent({
    required this.clickedProduct,
  });
}

class HomeAddEmployeeButtonClickedEvent extends HomeEvent {
  final EmployeeModel clickedProduct;
  HomeAddEmployeeButtonClickedEvent({
    required this.clickedProduct,
  });
}

class HomeRemoveEmployeeButtonClickedEvent extends HomeEvent {
  final EmployeeModel clickedProduct;
  HomeRemoveEmployeeButtonClickedEvent({
    required this.clickedProduct,
  });
}

class HomeEditEmployeeButtonClickedEvent extends HomeEvent {
  final EmployeeModel clickedProduct;
  final int index;
  HomeEditEmployeeButtonClickedEvent({
    required this.clickedProduct,
    required this.index,
  });
}

class HomeSaveEmployeeButtonNavigateEvent extends HomeEvent {}

class AddEmployeeValueEvent extends HomeEvent {
  final TextEditingController? employeeNameController;
  final TextEditingController? jobController;
  final TextEditingController? startDateController;
  final TextEditingController? endDateController;

  AddEmployeeValueEvent({
    this.employeeNameController,
    this.jobController,
    this.startDateController,
    this.endDateController,
  });
}

class EditEmployeeValueEvent extends HomeEvent {
  final TextEditingController? employeeNameController;
  final TextEditingController? jobController;
  final TextEditingController? startDateController;
  final TextEditingController? endDateController;

  EditEmployeeValueEvent({
    this.employeeNameController,
    this.jobController,
    this.startDateController,
    this.endDateController,
  });
}

class HomeFloatActionButtonNavigateEvent extends HomeEvent {}

class HomeEditEmNavigateEvent extends HomeEvent {}

class SaveAddEmPageActionState extends HomeActionState {}
