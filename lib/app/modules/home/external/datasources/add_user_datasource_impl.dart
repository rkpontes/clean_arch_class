import 'package:clean_arch_class/app/modules/home/domain/models/dtos/user_dto.dart';
import 'package:clean_arch_class/app/modules/shared/http/http_client.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../data/datasources/add_user_datasource.dart';

final $AddUserDataSourceImpl = Bind.singleton(
  (i) => AddUserDataSourceImpl(i()),
);

class AddUserDataSourceImpl implements AddUserDataSource {
  AddUserDataSourceImpl(this._client);
  final HttpClientAdapter _client;

  @override
  Future<Map<String, dynamic>> call(UserDto dto) async {
    var res = await _client.post('/users', data: dto.toMap());
    return Map.from(res);
  }
}
