import 'package:clean_arch_class/app/modules/home/domain/models/dtos/user_dto.dart';
import 'package:clean_arch_class/app/modules/home/presentation/add/add_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AddPage extends StatefulWidget {
  const AddPage({
    this.userDto,
    super.key,
  });

  final UserDto? userDto;

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final controller = Modular.get<AddController>();
  final formKey = GlobalKey<FormState>();

  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _phoneTextController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.userDto != null) {
      _nameTextController.text = widget.userDto!.name ?? '';
      _emailTextController.text = widget.userDto!.email ?? '';
      _phoneTextController.text = widget.userDto!.phone ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
              widget.userDto == null ? "Novo Contato" : "Alterar Contato")),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Nome Completo"),
              TextFormField(
                controller: _nameTextController,
                validator: (v) {
                  if (v!.isEmpty) return 'required';
                  return null;
                },
                decoration: const InputDecoration(hintText: "Fulano Sicrano"),
              ),
              const SizedBox(height: 10),
              const Text("E-mail"),
              TextFormField(
                controller: _emailTextController,
                validator: (v) {
                  if (v!.isEmpty) return 'required';
                  return null;
                },
                decoration: const InputDecoration(hintText: "fulano@email.com"),
              ),
              const SizedBox(height: 10),
              const Text("Telefone"),
              TextFormField(
                controller: _phoneTextController,
                validator: (v) {
                  if (v!.isEmpty) return 'required';
                  return null;
                },
                decoration: const InputDecoration(hintText: "888888888888"),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    // Adicionar
                    if (widget.userDto == null) {
                      var res = await controller.addContact(UserDto(
                        name: _nameTextController.text,
                        email: _emailTextController.text,
                        phone: _phoneTextController.text,
                      ));

                      if (res.success) {
                        await alertMessage('Contato adicionado!');
                        Modular.to.pop();
                        Modular.to.pop(true);
                      } else {
                        await alertMessage(res.message ?? 'ERROR');
                      }
                    } else {
                      // Alterar
                      var res = await controller.editContact(UserDto(
                        id: widget.userDto!.id,
                        name: _nameTextController.text,
                        email: _emailTextController.text,
                        phone: _phoneTextController.text,
                      ));

                      if (res.success) {
                        await alertMessage('Contato alterado!');
                        Modular.to.pop();
                        Modular.to.pop(true);
                      } else {
                        await alertMessage(res.message ?? 'ERROR');
                      }
                    }
                  }
                },
                child: Text(widget.userDto == null ? "Adicionar" : "Alterar"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future alertMessage(String message) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Aviso"),
          content: Text(message),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () => Modular.to.pop(),
              child: const Text("Fechar"),
            ),
          ],
        );
      },
    );
  }
}
