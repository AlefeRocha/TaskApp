import 'package:flutter/material.dart';
import 'package:tarefas/components/tasks.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List<Task> taskList = [
    Task('Estudar Flutter', 'assets/images/flutter_img.png', 4),
    Task('Lavar o carro para o passeio', 'assets/images/lavar_carro_img.jpg', 1),
    Task('Compras', 'assets/images/compras_img.jpg', 2),
    Task('Trabalho', 'assets/images/trabalho_img.webp', 5),
    Task('Academia', 'assets/images/academia_img.jpeg', 3),
  ];

  void newTask(String name, String photo, int difficulty) {
    taskList.add(Task(name, photo, difficulty));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
