import 'package:clean_arch_class/app/modules/home/domain/models/dtos/user_dto.dart';
import 'package:clean_arch_class/app/modules/home/domain/repositories/update_user_repository.dart';
import 'package:clean_arch_class/app/modules/shared/response/response_presentation.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'update_user_usecase.dart';

final $UpdateUserUseCaseImpl = Bind.singleton(
  (i) => UpdateUserUseCaseImpl(i()),
);

class UpdateUserUseCaseImpl implements UpdateUserUseCase {
  UpdateUserUseCaseImpl(this._updateUserRepository);

  final UpdateUserRepository _updateUserRepository;

  @override
  Future<ResponsePresentation> call(UserDto userDto) async {
    try {
      var res = await _updateUserRepository(userDto);
      return ResponsePresentation(success: true, body: res);
    } catch (e) {
      return ResponsePresentation(success: false, message: e.toString());
    }
  }
}
