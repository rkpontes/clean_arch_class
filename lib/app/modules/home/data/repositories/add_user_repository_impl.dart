import 'package:clean_arch_class/app/modules/home/data/datasources/add_user_datasource.dart';
import 'package:clean_arch_class/app/modules/home/domain/models/dtos/user_dto.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../domain/repositories/add_user_repository.dart';

final $AddUserRepositoryImpl = Bind.singleton(
  (i) => AddUserRepositoryImpl(i()),
);

class AddUserRepositoryImpl implements AddUserRepository {
  AddUserRepositoryImpl(this._addUserDataSource);
  final AddUserDataSource _addUserDataSource;
  @override
  Future<UserDto> call(UserDto dto) async {
    try {
      var res = await _addUserDataSource(dto);
      return UserDto.fromMap(res);
    } catch (e) {
      rethrow;
    }
  }
}
