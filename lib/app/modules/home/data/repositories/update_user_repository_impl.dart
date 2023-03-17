import 'package:clean_arch_class/app/modules/home/data/datasources/update_user_datasource.dart';
import 'package:clean_arch_class/app/modules/home/domain/models/dtos/user_dto.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../domain/repositories/update_user_repository.dart';

final $UpdateUserRepositoryImpl = Bind.singleton(
  (i) => UpdateUserRepositoryImpl(i()),
);

class UpdateUserRepositoryImpl implements UpdateUserRepository {
  UpdateUserRepositoryImpl(this._updateUserDataSource);

  final UpdateUserDataSource _updateUserDataSource;

  @override
  Future<UserDto> call(UserDto dto) async {
    try {
      var res = await _updateUserDataSource(dto);
      return UserDto.fromMap(res);
    } catch (e) {
      rethrow;
    }
  }
}
