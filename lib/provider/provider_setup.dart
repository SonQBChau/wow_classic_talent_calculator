import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'core/models/user.dart';
// import 'core/services/api.dart';

List<SingleChildCloneableWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumableProviders
];

List<SingleChildCloneableWidget> independentServices = [
  // Provider<Future<bool>>.value(value: getSharedPreferences())
];

Future<bool> getSharedPreferences() async {
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // bool val = prefs.getBool('maxIncreaseOnTap') ?? true;
  // return val;
}

List<SingleChildCloneableWidget> dependentServices = [
  // ProxyProvider<Api, AuthenticationService>(
  //   builder: (context, api, authenticationService) =>
  //       AuthenticationService(api: api),
  // )
];

List<SingleChildCloneableWidget> uiConsumableProviders = [
  // StreamProvider<User>(
  //   builder: (context) =>
  //       Provider.of<AuthenticationService>(context, listen: false).user,
  // )
];

bool isSwitched;
SharedPreferences prefs;
Future loadSharedPreferences() async {
  prefs = await SharedPreferences.getInstance();
  bool val = prefs.getBool('maxIncreaseOnTap') ?? true;
  isSwitched = val;
  // setState(() {
  //   isSwitched = val;
  // });
}
