import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sampleapp/constant/widgets_constant.dart';
import 'package:sampleapp/models.dart/task_model.dart';

// ignore: must_be_immutable
class TaskItem extends ConsumerWidget {
  TaskItem({Key? key, required this.task}) : super(key: key);

  final TaskModel task;
  final checkProvider = StateProvider<bool>((ref) => false);
  Random random = Random();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Color itemColor =
        Colors.primaries[Random().nextInt(Colors.primaries.length)];
    return Padding(
      padding: EdgeInsets.only(
          top: 10 * WidgetsConstant.height,
          bottom: 10.0 * WidgetsConstant.width),
      child: InkWell(
        onTap: () {
          _showDialog(context, task);
        },
        child: Row(
          children: [
            CircleAvatar(
                backgroundColor: itemColor,
                radius: 22,
                child: const Icon(
                  Icons.book,
                  color: Colors.white,
                )),
            Padding(
              padding: EdgeInsets.only(left: 10.0 * WidgetsConstant.width),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: 200 * WidgetsConstant.width,
                    child: Text(
                      task.title,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    ),
                  ),
                  Text(
                    "${random.nextInt(10)} completed",
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                        fontSize: 17),
                  )
                ],
              ),
            ),
            const Spacer(),
            Consumer(builder: (context, ref, _) {
              final isClicked = ref.watch(checkProvider.state).state;
              return Center(
                  child: InkWell(
                onTap: () {
                  ref.read(checkProvider.state).state = !isClicked;
                },
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(color: itemColor),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: isClicked || task.completed
                        ? const Icon(
                            Icons.check,
                            size: 25.0,
                            color: Colors.black,
                          )
                        : const Icon(
                            Icons.check_box_outline_blank,
                            size: 25.0,
                            color: Colors.white,
                          ),
                  ),
                ),
              ));
            }),
          ],
        ),
      ),
    );
  }
}

Future<void> _showDialog(BuildContext context, TaskModel _task) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title:
            _task.completed ? const Text('Completed') : const Text('Pending'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(_task.title),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
