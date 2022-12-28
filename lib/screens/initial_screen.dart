import 'package:flutter/material.dart';
import 'package:tarefas/components/tasks.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opacityTask = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarefas'),
      ),
      body: AnimatedOpacity(
        opacity: opacityTask ? 1 : 0,
        duration: const Duration(milliseconds: 500),
        child: ListView(
          children: const [
            Task(
                'Estudar Flutter',
                'assets/images/flutter_img.png',
                4),
            Task(
                'Lavar o carro para o passeio',
                'assets/images/lavar_carro_img.jpg',
                1),
            Task(
                'Compras',
                'assets/images/compras_img.jpg',
                2),
            Task(
                'Trabalho',
                'assets/images/trabalho_img.webp',
                5),
            Task(
                'Academia',
                'assets/images/academia_img.jpeg',
                3),
            SizedBox(
              height: 80,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            opacityTask = !opacityTask;
          });
        },
        child: const Icon(Icons.remove_red_eye),
      ),
    );
  }
}