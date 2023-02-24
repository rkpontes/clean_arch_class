import 'package:clean_arch_class/app/modules/shared/http/http_client.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../data/datasources/get_users_datasource.dart';

final $GetUsersDataSourceImpl = Bind.singleton(
  (i) => GetUsersDataSourceImpl(i()),
);

class GetUsersDataSourceImpl implements GetUsersDataSource {
  GetUsersDataSourceImpl(this._client);
  final HttpClientAdapter _client;

  @override
  Future<List<Map<String, dynamic>>> call() async {
    var res = await _client.get('/users');
    return List.from(res);
  }
}
