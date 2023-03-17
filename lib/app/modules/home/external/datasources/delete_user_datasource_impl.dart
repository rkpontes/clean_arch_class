import 'package:clean_arch_class/app/modules/shared/http/http_client.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../data/datasources/delete_user_datasource.dart';

final $DeleteUserDataSourceImpl = Bind.singleton(
  (i) => DeleteUserDataSourceImpl(i()),
);

class DeleteUserDataSourceImpl implements DeleteUserDataSource {
  DeleteUserDataSourceImpl(this._client);
  final HttpClientAdapter _client;

  @override
  Future<Map<String, dynamic>> call(String id) async {
    var res = await _client.delete('/users/$id');
    return Map.from(res);
  }
}
