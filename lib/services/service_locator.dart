import 'package:get_it/get_it.dart';
import 'package:wow_classic_talent_calculator/model/user.dart';
import 'package:wow_classic_talent_calculator/services/localstorage_service.dart';

GetIt sl = GetIt.instance;

Future setupLocator() async {
  var instance = await LocalStorageService.getInstance();
  sl.registerSingleton<LocalStorageService>(instance);
}
