import 'package:clean_arch_class/app/modules/home/domain/models/dtos/user_dto.dart';
import 'package:clean_arch_class/app/modules/home/domain/usecases/add_user_usecase.dart';
import 'package:clean_arch_class/app/modules/home/domain/usecases/update_user_usecase.dart';
import 'package:clean_arch_class/app/modules/shared/response/response_presentation.dart';
import 'package:flutter_modular/flutter_modular.dart';

final $AddController = Bind.singleton(
  (i) => AddController(i(), i()),
);

class AddController {
  AddController(this._addUserUseCase, this._updateUserUseCase);

  final AddUserUseCase _addUserUseCase;
  final UpdateUserUseCase _updateUserUseCase;

  Future<ResponsePresentation> addContact(UserDto dto) async {
    return await _addUserUseCase(dto);
  }

  Future<ResponsePresentation> editContact(UserDto dto) async {
    return await _updateUserUseCase(dto);
  }
}
