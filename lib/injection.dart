import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

final getIt = GetIt.instance;
const prod = Environment('prod');
const mock = Environment('mock');

@InjectableInit(preferRelativeImports: true)
Future<void> configureDependencies({
  Environment environment = mock,
}) async =>
    getIt.init(
      environment: environment.name,
    );
