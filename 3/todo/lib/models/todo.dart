class ToDoModel {
  final int? id;
  final int? taskId;
  final String? title;
  final int? checked;

  ToDoModel(
      {required this.id,
      required this.taskId,
      required this.title,
      required this.checked,
      text});

  Map<String, dynamic> toMap() {
    return {'id': id, 'taskId': taskId, 'title': title, 'checked': checked};
  }
}
