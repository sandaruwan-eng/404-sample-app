class TaskModel {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  TaskModel(
      {required this.userId,
      required this.id,
      required this.title,
      required this.completed});

  factory TaskModel.fromJson(dynamic json) {
    if (json == null) {
      throw NullThrownError();
    }

    return TaskModel(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        completed: json['completed']);
  }

  Map<String, dynamic> toJson() =>
      {'userId': userId, 'id': id, 'title': title, 'completed': completed};
}
