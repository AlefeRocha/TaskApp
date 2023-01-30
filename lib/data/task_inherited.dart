import 'package:flutter/material.dart';

class TaskInherited extends InheritedWidget {
  const TaskInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List taskList = [];

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result = context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited old) {
    return ;
  }
}
