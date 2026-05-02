import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:progress1_project/injection.config.dart';

final locator = GetIt.instance;

@injectableInit
Future<void> configureDependencies() async => await locator.init();