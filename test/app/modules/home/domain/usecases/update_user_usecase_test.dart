import 'package:clean_arch_class/app/modules/home/data/datasources/update_user_datasource.dart';
import 'package:clean_arch_class/app/modules/home/data/repositories/update_user_repository_impl.dart';
import 'package:clean_arch_class/app/modules/home/domain/models/dtos/user_dto.dart';
import 'package:clean_arch_class/app/modules/home/domain/usecases/update_user_usecase_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'users_mock.dart';

@GenerateNiceMocks([MockSpec<UpdateUserDataSource>()])
import 'update_user_usecase_test.mocks.dart';

void main() {
  final MockUpdateUserDataSource datasource = MockUpdateUserDataSource();
  final UpdateUserRepositoryImpl repository =
      UpdateUserRepositoryImpl(datasource);
  final UpdateUserUseCaseImpl usecase = UpdateUserUseCaseImpl(repository);

  group('Update User', () {
    test('Quando a requisicao for sucesso', () async {
      var dto = UserDto(name: '', email: '', phone: '');
      when(datasource(dto)).thenAnswer((_) async => mockDto);

      var res = await usecase(dto);
      expect(res.success, isTrue);
      expect(res.body, isA<UserDto>());
      expect(res.message, isNull);
    });
    test('Quando a requisicao nao for sucesso', () async {
      var dto = UserDto(name: '', email: '', phone: '');
      when(datasource(dto)).thenThrow(Exception('ERROR'));

      var res = await usecase(dto);
      expect(res.success, isFalse);
      expect(res.body, isNull);
      expect(res.message, isNotNull);
    });
  });
}
