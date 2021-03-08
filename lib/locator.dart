import 'package:dro/data/drug_dummy_data.dart';
import 'package:dro/utils/database.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;



void setupLocator(){
  locator.registerLazySingleton<DummyDrugDataABS>(() => DummyDrugData());
}