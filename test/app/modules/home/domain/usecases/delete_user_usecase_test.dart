import 'package:clean_arch_class/app/modules/home/data/datasources/delete_user_datasource.dart';
import 'package:clean_arch_class/app/modules/home/data/repositories/delete_user_repository_impl.dart';
import 'package:clean_arch_class/app/modules/home/domain/usecases/delete_user_usecase_impl.dart';
import 'package:clean_arch_class/app/modules/home/domain/models/dtos/user_dto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'users_mock.dart';

@GenerateNiceMocks([MockSpec<DeleteUserDataSource>()])
import 'delete_user_usecase_test.mocks.dart';

void main() {
  final MockDeleteUserDataSource datasource = MockDeleteUserDataSource();
  final DeleteUserRepositoryImpl repository =
      DeleteUserRepositoryImpl(datasource);
  final DeleteUserUseCaseImpl usecase = DeleteUserUseCaseImpl(repository);

  group('Delete User', () {
    test('Quando a requisicao for sucesso', () async {
      var id = '1';
      when(datasource(id)).thenAnswer((_) async => mockDto);

      var res = await usecase(id);
      expect(res.success, isTrue);
      expect(res.body, isA<UserDto>());
      expect(res.message, isNull);
    });
    test('Quando a requisicao nao for sucesso', () async {
      var id = '1';
      when(datasource(id)).thenThrow(Exception('ERROR'));

      var res = await usecase(id);
      expect(res.success, isFalse);
      expect(res.body, isNull);
      expect(res.message, isNotNull);
    });
  });
}
