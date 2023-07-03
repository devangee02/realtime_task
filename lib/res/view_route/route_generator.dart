import '../import/import.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.home:
        return CustomSlideTransition(child: HomeScreen());
      case RouteNames.addEmp:
        return CustomSlideTransition(child: AddEmployee());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return CustomSlideTransition(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Page not found',
            style: TextStyle(color: Colors.red),
          ),
        ),
        body: Center(
          child: Text(
            'Error! Page not found',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ),
    );
  }
}

class CustomSlideTransition extends PageRouteBuilder {
  final Widget? child;
  CustomSlideTransition({this.child})
      : super(
          transitionDuration: Duration(seconds: 2000),
          pageBuilder: (context, animation, secondaryAnimation) => child!,
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            var begin = const Offset(0.0, 1.0);
            var end = Offset.zero;
            var curve = Curves.bounceIn;

            var tween = Tween(begin: Offset.zero, end: const Offset(0.0, 1.0))
                .chain(CurveTween(curve: curve));
            return Material(
              color: Theme.of(context).primaryColorLight,
              child: SlideTransition(
                position: animation.drive(tween),
                child: child,
              ),
            );
          },
        );
}
