import 'package:clean_arch_class/app/modules/home/domain/models/dtos/user_dto.dart';
import 'package:clean_arch_class/app/modules/home/domain/usecases/delete_user_usecase.dart';
import 'package:clean_arch_class/app/modules/home/domain/usecases/get_users_usecase.dart';
import 'package:clean_arch_class/app/modules/shared/response/response_presentation.dart';
import 'package:flutter_modular/flutter_modular.dart';

final $HomeController = Bind.singleton(
  (i) => HomeController(i(), i()),
);

class HomeController {
  HomeController(this._getUsersUseCase, this._deleteUserUseCase);

  final GetUsersUseCase _getUsersUseCase;
  final DeleteUserUseCase _deleteUserUseCase;

  List<UserDto> contacts = [];

  Future<void> getData() async {
    var res = await _getUsersUseCase();

    if (!res.success) {
      contacts = [];
      print(res.message);
      return;
    }

    contacts = res.body as List<UserDto>;
  }

  Future<ResponsePresentation> deleteData(String? id) async {
    if (id == null) {
      print("id is null");
      return ResponsePresentation(success: false);
    }
    var res = await _deleteUserUseCase(id);

    if (!res.success) {
      print(res.message);
    }

    return res;
  }
}
