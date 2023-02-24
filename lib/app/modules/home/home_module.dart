import 'package:clean_arch_class/app/modules/home/data/repositories/get_users_repository_impl.dart';
import 'package:clean_arch_class/app/modules/home/domain/usecases/get_users_usecase_impl.dart';
import 'package:clean_arch_class/app/modules/home/external/datasources/get_users_datasource_impl.dart';
import 'package:clean_arch_class/app/modules/home/presentation/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/home/home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    // DataSources
    $GetUsersDataSourceImpl,

    // Repositories
    $GetUsersRepositoryImpl,

    // UseCases
    $GetUsersUseCaseImpl,

    // Controllers
    $HomeController,
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage()),
  ];
}
