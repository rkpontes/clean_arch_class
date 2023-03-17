import 'package:clean_arch_class/app/modules/home/data/datasources/get_users_datasource.dart';
import 'package:clean_arch_class/app/modules/home/data/repositories/get_users_repository_impl.dart';
import 'package:clean_arch_class/app/modules/home/domain/models/dtos/user_dto.dart';
import 'package:clean_arch_class/app/modules/home/domain/repositories/get_users_repository.dart';
import 'package:clean_arch_class/app/modules/home/domain/usecases/get_users_usecase.dart';
import 'package:clean_arch_class/app/modules/home/domain/usecases/get_users_usecase_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'users_mock.dart';

@GenerateNiceMocks([MockSpec<GetUsersDataSource>()])
import 'get_users_usecase_test.mocks.dart';

void main() {
  final GetUsersDataSource getUsersDataSource = MockGetUsersDataSource();
  final GetUsersRepository getUsersRepositoryImpl =
      GetUsersRepositoryImpl(getUsersDataSource);
  final GetUsersUseCase getUsersUseCaseImpl =
      GetUsersUseCaseImpl(getUsersRepositoryImpl);

  group('Get Users', () {
    test('testar se foi sucesso na requisicao', () async {
      when(getUsersDataSource()).thenAnswer((_) async => mockList);

      var res = await getUsersUseCaseImpl();

      expect(res.success, isTrue);
      expect(res.body, isA<List<UserDto>>());
      expect(res.message, isNull);
    });

    test('testar se nao foi sucesso na requisiçao', () async {
      when(getUsersDataSource()).thenThrow(Exception("ERROR"));

      var res = await getUsersUseCaseImpl();

      expect(res.success, isFalse);
      expect(res.body, isNull);
      expect(res.message, isA<String>());
    });
  });
}
