import 'dart:async';
import 'package:sampleapp/constant/url_constant.dart';
import 'package:sampleapp/models.dart/task_model.dart';
import 'package:sampleapp/services/api_service.dart';

Future<List<TaskModel>?> getTaskList() async {
  try {
    Iterable dataBody = await fetchData(UrlConstant.GET_TASK_LIST_URL);
    List<TaskModel> posts = List<TaskModel>.from(
        dataBody.map((model) => TaskModel.fromJson(model)));
    return posts;
  } on Exception catch (exception) {
    // ignore: avoid_print
    print(exception);
    rethrow;
  } catch (error) {
    rethrow;
  }
}
