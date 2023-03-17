import 'package:clean_arch_class/app/modules/home/domain/models/dtos/user_dto.dart';
import 'package:clean_arch_class/app/modules/home/domain/repositories/add_user_repository.dart';
import 'package:clean_arch_class/app/modules/shared/response/response_presentation.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'add_user_usecase.dart';

final $AddUserUseCaseImpl = Bind.singleton(
  (i) => AddUserUseCaseImpl(i()),
);

class AddUserUseCaseImpl implements AddUserUseCase {
  AddUserUseCaseImpl(this._addUserRepository);
  final AddUserRepository _addUserRepository;

  @override
  Future<ResponsePresentation> call(UserDto dto) async {
    try {
      var res = await _addUserRepository(dto);
      return ResponsePresentation(success: true, body: res);
    } catch (e) {
      return ResponsePresentation(success: false, message: e.toString());
    }
  }
}
