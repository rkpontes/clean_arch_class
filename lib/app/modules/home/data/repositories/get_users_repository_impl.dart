import 'package:clean_arch_class/app/modules/home/data/datasources/get_users_datasource.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../domain/models/dtos/user_dto.dart';
import '../../domain/repositories/get_users_repository.dart';

final $GetUsersRepositoryImpl = Bind.singleton(
  (i) => GetUsersRepositoryImpl(i()),
);

class GetUsersRepositoryImpl implements GetUsersRepository {
  GetUsersRepositoryImpl(this._getUsersDataSource);

  final GetUsersDataSource _getUsersDataSource;

  @override
  Future<List<UserDto>> call() async {
    try {
      var res = await _getUsersDataSource();
      List<UserDto> list = [];
      for (var e in res) {
        list.add(UserDto.fromMap(e));
      }
      return list;
    } catch (e) {
      rethrow;
    }
  }
}
