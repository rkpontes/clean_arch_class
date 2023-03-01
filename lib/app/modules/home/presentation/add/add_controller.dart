import 'package:clean_arch_class/app/modules/home/domain/models/dtos/user_dto.dart';
import 'package:clean_arch_class/app/modules/home/domain/usecases/add_user_usecase.dart';
import 'package:clean_arch_class/app/modules/shared/response/response_presentation.dart';
import 'package:flutter_modular/flutter_modular.dart';

final $AddController = Bind.singleton(
  (i) => AddController(i()),
);

class AddController {
  AddController(this._addUserUseCase);

  final AddUserUseCase _addUserUseCase;

  Future<ResponsePresentation> addContact(UserDto dto) async {
    return await _addUserUseCase(dto);
  }
}
