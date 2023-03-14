import 'package:flutter/material.dart';
import 'package:tarefas/components/difficulty.dart';

class Task extends StatefulWidget {
  final String nameTask;
  final String photo;
  final int difficultyLevel;

  Task(this.nameTask, this.photo, this.difficultyLevel, {Key? key})
      : super(key: key);

  int level = 0;

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {

  bool assetOrNetwork() {
    if (widget.photo.contains('https')) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    int levelMax = widget.difficultyLevel * 10;

    Color colorFinished() {
      if (widget.level >= (levelMax)) {
        return Colors.green;
      } else {
        return Colors.blue;
      }
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: colorFinished(),
            ),
            height: 140,
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                ),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4),
                          bottomLeft: Radius.circular(4),
                        ),
                        color: Colors.black26,
                      ),
                      width: 100,
                      height: 100,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4),
                          bottomLeft: Radius.circular(4),
                        ),
                        child: assetOrNetwork()
                            ? Image.asset(
                                widget.photo,
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                widget.photo,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Text(
                            widget.nameTask,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Difficulty(
                          difficultyLevel: widget.difficultyLevel,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 52,
                      width: 52,
                      child: ElevatedButton(
                          onPressed: (widget.level == (widget.difficultyLevel * 10))
                              ? null
                              : () {
                                  setState(() {
                                    widget.level++;
                                  });
                                },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              Icon(Icons.arrow_drop_up),
                              Text(
                                'Up',
                                style: TextStyle(fontSize: 12),
                              )
                            ],
                          )),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                        color: Colors.white,
                        value: (widget.difficultyLevel > 0)
                            ? (widget.level / widget.difficultyLevel) / 10
                            : 1,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Level: ${widget.level}',
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
