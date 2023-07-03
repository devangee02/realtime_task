import '../import/import.dart';

class RouteNames {
  // All veiw route names
  static const addEmp = 'addEmp';
  static const home = 'home';

  static Map<String, Widget Function(BuildContext)> routes = {
    ///Named routes to be added here in this format
    ///RouteNames.splashScreen: (context) => SplashScreen(),

    addEmp: (context) => AddEmployee(),
    home: (context) => HomeScreen(),
  };
}
