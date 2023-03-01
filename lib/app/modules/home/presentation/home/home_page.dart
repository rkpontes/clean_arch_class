import 'package:clean_arch_class/app/modules/home/presentation/home/home_controller.dart';
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
          return ListTile(
            leading: CircleAvatar(
              child: Text(model.name?.substring(0, 2).toUpperCase() ?? ''),
            ),
            title: Text(model.name ?? ''),
            subtitle: Text("${model.email ?? ''}\n${model.phone ?? ''}"),
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
}
