import 'package:clean_arch_class/app/modules/home/domain/models/dtos/user_dto.dart';

abstract class UpdateUserRepository {
  Future<UserDto> call(UserDto dto);
}
