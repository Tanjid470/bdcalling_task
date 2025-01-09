part of 'app_pages.dart';
abstract class Routes {
  Routes._();
  static const homeScreen = _Paths.homeScreen;
  static const assignmentOneView = _Paths.assignmentOneView;


}

abstract class _Paths {
  _Paths._();
  static const homeScreen = '/home_screen';
  static const assignmentOneView = '/assignment_one_view';

}