import 'package:flutter/material.dart';
import 'package:modul_app/provider/done_module_provider.dart';
import 'package:provider/provider.dart';

class ModuleList extends StatefulWidget {
  const ModuleList({Key? key}) : super(key: key);

  @override
  State<ModuleList> createState() => _ModuleListState();
}

class _ModuleListState extends State<ModuleList> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _moduleList.length,
      itemBuilder: (context, index) {
        return Consumer<DoneModuleProvider>(
            builder: (context, DoneModuleProvider data, widget) {
              return ModuleTile(
                moduleName: _moduleList[index],
                isDone: data.doneModuleList.contains(_moduleList[index]),
                onClick: () {
                  setState(() {
                    data.doneModuleList.add(_moduleList[index]);
                  });
                },
              );
            },
        );
      },
    );
  }

  final List<String> _moduleList = const [
    'Modul 1 - Pengenalan Dart',
    'Modul 2 - Program Dart Pertamamu',
    'Modul 3 - Dart Fundamental',
    'Modul 4 - Control Flow',
    'Modul 5 - Collections',
    'Modul 6 - Object Oriented Programming',
    'Modul 7 - Functional Styles',
    'Modul 8 - Dart Type System',
    'Modul 9 - Dart Futures',
    'Modul 10 - Effective Dart',
  ];
}

class ModuleTile extends StatelessWidget {
  final String moduleName;
  final bool isDone;
  final Function() onClick;

  const ModuleTile({Key? key,
    required this.moduleName,
    required this.isDone,
    required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(moduleName),
      trailing: isDone ? const Icon(Icons.done)
          : ElevatedButton(
        onPressed: onClick,
        child: const Text('Done'),
      ),
    );
  }
}
