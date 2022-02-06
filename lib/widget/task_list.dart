import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sampleapp/controller/providers.dart';
import 'package:sampleapp/models.dart/task_model.dart';
import 'package:sampleapp/widget/widget.dart';

class TaskList extends StatelessWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            "Today task list",
            style: TextStyle(fontSize: 20.0),
          ),
          Consumer(builder: (context, ref, _) {
            AsyncValue<List<TaskModel>?> taskList = ref.watch(taskListProvider);

            return taskList.when(
                data: (list) {
                  return Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: list!.length,
                      itemBuilder: (BuildContext context, int index) =>
                          TaskItem(task: list[index]),
                    ),
                  );
                },
                loading: () => const Padding(
                      padding: EdgeInsets.only(top: 100),
                      child: Center(child: CircularProgressIndicator()),
                    ),
                error: (e, stackTrace) {
                  return const Text("error");
                });
          }),
        ],
      ),
    );
  }
}
