import '../../../res/import/import.dart';
import '../../employee_data.dart';
import 'add_em_state.dart';

part 'add_em_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<AddInitialEvent>(addInitialEvent);
    on<HomeProductWishlistButtonClickedEvent>(
        homeProductWishlistButtonClickedEvent);
    on<HomeAddEmployeeButtonClickedEvent>(homeAddEmployeeButtonClickedEvent);
    on<HomeRemoveEmployeeButtonClickedEvent>(
        homeRemoveEmployeeButtonClickedEvent);
    on<HomeEditEmployeeButtonClickedEvent>(homeEditEmployeeButtonClickedEvent);
    on<HomeSaveEmployeeButtonNavigateEvent>(
        homeSaveEmployeeButtonNavigateEvent);
    on<HomeFloatActionButtonNavigateEvent>(homeFloatActionButtonNavigateEvent);
    on<AddEmployeeValueEvent>(addEmployeeValueEvent);
    on<HomeEditEmNavigateEvent>(homeEditEmNavigateEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    currentEmployees = await LocalStorage.getList('currentEmployees');
    previousEmployees = await LocalStorage.getList('previousEmployees');
    if (currentEmployees.isEmpty) {
      emit(HomeEmptyState());
    } else {
      emit(HomeLoadedSuccessState(
          currentEmployees: currentEmployees,
          previousEmployees: previousEmployees));
    }
  }

  FutureOr<void> addInitialEvent(
      AddInitialEvent event, Emitter<HomeState> emit) async {
    emit(AddEmployeeSuccessState(
        employeeNameController: employeeNameController,
        jobController: jobController,
        startDateController: startDateController,
        endDateController: endDateController));
  }

  FutureOr<void> homeProductWishlistButtonClickedEvent(
      HomeProductWishlistButtonClickedEvent event,
      Emitter<HomeState> emit) async {
    print('Wishlist Product Clicked');
    emit(HomePopAddEmPageActionState());
    emit(HomeLoadedSuccessState(
        currentEmployees: currentEmployees,
        previousEmployees: previousEmployees));
  }

  FutureOr<void> homeAddEmployeeButtonClickedEvent(
      HomeAddEmployeeButtonClickedEvent event, Emitter<HomeState> emit) async {
    print('Cart Product clicked');
    currentEmployees.add(event.clickedProduct);
    LocalStorage.saveList(currentEmployees, 'currentEmployees');
    emit(HomePopAddEmPageActionState());
  }

  FutureOr<void> homeEditEmployeeButtonClickedEvent(
      HomeEditEmployeeButtonClickedEvent event, Emitter<HomeState> emit) async {
    currentEmployees[event.index] = event.clickedProduct;
    emit(HomePopAddEmPageActionState());
  }

  FutureOr<void> homeRemoveEmployeeButtonClickedEvent(
      HomeRemoveEmployeeButtonClickedEvent event,
      Emitter<HomeState> emit) async {
    currentEmployees.remove(event.clickedProduct);
    previousEmployees.add(event.clickedProduct);
    LocalStorage.saveList(currentEmployees, 'currentEmployees');
    LocalStorage.saveList(previousEmployees, 'previousEmployees');
    emit(HomeLoadedSuccessState(
        currentEmployees: currentEmployees,
        previousEmployees: previousEmployees));
  }

  FutureOr<void> homeSaveEmployeeButtonNavigateEvent(
      HomeSaveEmployeeButtonNavigateEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToWishlistPageActionState());
    print('Wishlist Product Clicked');
    emit(HomePopAddEmPageActionState());
  }

  FutureOr<void> homeFloatActionButtonNavigateEvent(
      HomeFloatActionButtonNavigateEvent event, Emitter<HomeState> emit) async {
    emit(HomeNavigateToAddEmPageActionState());
    await Future.delayed(Duration(seconds: 3));
  }

  FutureOr<void> homeEditEmNavigateEvent(
      HomeEditEmNavigateEvent event, Emitter<HomeState> emit) async {
    emit(HomeNavigateToEditEmPageActionState());
  }

  FutureOr<void> addEmployeeValueEvent(
      AddEmployeeValueEvent event, Emitter<HomeState> emit) async {
    emit(AddEmployeeSuccessState(
        employeeNameController: employeeNameController,
        jobController: jobController,
        startDateController: startDateController,
        endDateController: endDateController));
  }
}
