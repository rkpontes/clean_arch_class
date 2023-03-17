import 'package:clean_arch_class/app/modules/home/data/datasources/delete_user_datasource.dart';
import 'package:clean_arch_class/app/modules/home/domain/models/dtos/user_dto.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../domain/repositories/delete_user_repository.dart';

final $DeleteUserRepositoryImpl = Bind.singleton(
  (i) => DeleteUserRepositoryImpl(i()),
);

class DeleteUserRepositoryImpl implements DeleteUserRepository {
  DeleteUserRepositoryImpl(this._deleteUserDataSource);
  final DeleteUserDataSource _deleteUserDataSource;

  @override
  Future<UserDto> call(String id) async {
    try {
      var res = await _deleteUserDataSource(id);
      return UserDto.fromMap(res);
    } catch (e) {
      rethrow;
    }
  }
}
