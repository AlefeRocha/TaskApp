import 'package:flutter/material.dart';
import 'package:tarefas/data/task_inherited.dart';

class TasksInfos extends StatefulWidget {
  const TasksInfos({Key? key}) : super(key: key);

  @override
  State<TasksInfos> createState() => _TasksInfosState();
}

class _TasksInfosState extends State<TasksInfos> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 200,
          ),
          const Text(
            'Painel de tarefas',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              decoration: TextDecoration.none,
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 140,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFF3B00E4),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Column(
                  children: [
                    Text(
                      'Progresso geral',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    Text(
                      '${TaskInherited.of(context).taskList.length} tarefas em andamento',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
