import 'package:clean_arch_class/app/modules/home/domain/models/dtos/user_dto.dart';
import 'package:clean_arch_class/app/modules/shared/response/response_presentation.dart';

abstract class UpdateUserUseCase {
  Future<ResponsePresentation> call(UserDto userDto);
}
