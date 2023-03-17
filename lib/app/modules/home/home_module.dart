import 'package:clean_arch_class/app/modules/home/data/repositories/add_user_repository_impl.dart';
import 'package:clean_arch_class/app/modules/home/data/repositories/delete_user_repository_impl.dart';
import 'package:clean_arch_class/app/modules/home/data/repositories/get_users_repository_impl.dart';
import 'package:clean_arch_class/app/modules/home/domain/usecases/add_user_usecase_impl.dart';
import 'package:clean_arch_class/app/modules/home/domain/usecases/delete_user_usecase_impl.dart';
import 'package:clean_arch_class/app/modules/home/domain/usecases/get_users_usecase_impl.dart';
import 'package:clean_arch_class/app/modules/home/external/datasources/add_user_datasource_impl.dart';
import 'package:clean_arch_class/app/modules/home/external/datasources/delete_user_datasource_impl.dart';
import 'package:clean_arch_class/app/modules/home/external/datasources/get_users_datasource_impl.dart';
import 'package:clean_arch_class/app/modules/home/presentation/add/add_controller.dart';
import 'package:clean_arch_class/app/modules/home/presentation/add/add_page.dart';
import 'package:clean_arch_class/app/modules/home/presentation/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/home/home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    // DataSources
    $GetUsersDataSourceImpl,
    $AddUserDataSourceImpl,
    $DeleteUserDataSourceImpl,

    // Repositories
    $GetUsersRepositoryImpl,
    $AddUserRepositoryImpl,
    $DeleteUserRepositoryImpl,

    // UseCases
    $GetUsersUseCaseImpl,
    $AddUserUseCaseImpl,
    $DeleteUserUseCaseImpl,

    // Controllers
    $HomeController,
    $AddController,
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage()),
    ChildRoute('/add', child: (_, args) => const AddPage()),
  ];
}
