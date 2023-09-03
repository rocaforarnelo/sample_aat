import 'package:injectable/injectable.dart';
import 'package:get_it/get_it.dart';
import 'injector.config.dart';

final locator = GetIt.instance;

@InjectableInit(preferRelativeImports: true)
configInjector(
  GetIt getIt, {
  String? env,
  EnvironmentFilter? environmentFilter,
}) {
  return getIt.init(
    environmentFilter: environmentFilter,
    environment: env,
  );
}

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void configureDependencies(String env) => locator.init(environment: env);
