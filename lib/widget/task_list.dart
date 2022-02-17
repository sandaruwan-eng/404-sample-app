import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sampleapp/constant/widgets_constant.dart';
import 'package:sampleapp/controller/providers.dart';
import 'package:sampleapp/models.dart/task_model.dart';
import 'package:sampleapp/widget/widget.dart';

class TaskList extends StatefulWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    final _appTheme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(
          top: 30.0 * WidgetsConstant.height,
          left: 30.0 * WidgetsConstant.width,
          right: 30.0 * WidgetsConstant.width),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Today task list",
            style: _appTheme.textTheme.headline6!.merge(
              const TextStyle(color: Colors.black),
            ),
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
                      itemBuilder: (BuildContext context, int index) {
                        final item = list[index];
                        return Dismissible(
                          key: Key(item.title),
                          onDismissed: (direction) {
                            setState(() {
                              list.removeAt(index);
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('A one item dismissed')));
                          },
                          background: Container(color: Colors.red),
                          child: TaskItem(task: list[index]),
                        );
                      },
                    ),
                  );
                },
                loading: () => Padding(
                      padding:
                          EdgeInsets.only(top: 100.0 * WidgetsConstant.height),
                      child: const Center(child: CircularProgressIndicator()),
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
