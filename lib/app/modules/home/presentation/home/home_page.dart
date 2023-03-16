import 'package:clean_arch_class/app/modules/home/domain/models/dtos/user_dto.dart';
import 'package:clean_arch_class/app/modules/home/presentation/home/home_controller.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Modular.get<HomeController>();

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    await controller.getData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contatos"),
      ),
      body: ListView.builder(
        itemCount: controller.contacts.length,
        itemBuilder: (_, index) {
          final model = controller.contacts[index];
          return Slidable(
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  flex: 2,
                  onPressed: (_) => _updateContact(model),
                  backgroundColor: Colors.yellow,
                  foregroundColor: Colors.black,
                  icon: Icons.edit_outlined,
                  label: 'Alterar',
                ),
                SlidableAction(
                  flex: 2,
                  onPressed: (_) => _confirmDelete(model),
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  icon: Icons.delete_outlined,
                  label: 'Remover',
                ),
              ],
            ),
            child: ListTile(
              leading: CircleAvatar(
                child: Text(model.name?.substring(0, 2).toUpperCase() ?? ''),
              ),
              title: Text(model.name ?? ''),
              subtitle: Text("${model.email ?? ''}\n${model.phone ?? ''}"),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          var res = await Modular.to.pushNamed('/add');
          if (res == true) {
            getData();
          }
        },
      ),
    );
  }

  _confirmDelete(UserDto dto) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Remover Contato"),
          content: Text("Deseja mesmo remover o ${dto.name ?? 'Contato'} "),
          actions: [
            ElevatedButton(
              onPressed: () async {
                var res = await controller.deleteData(dto.id);
                if (res.success) {
                  getData();
                }
                Modular.to.pop();
              },
              child: const Text("SIM"),
            ),
            OutlinedButton(
              onPressed: Modular.to.pop,
              child: const Text("Não"),
            ),
          ],
        );
      },
    );
  }

  _updateContact(UserDto model) async {
    var res = await Modular.to.pushNamed('/add', arguments: model);
    if (res == true) {
      getData();
    }
  }
}
