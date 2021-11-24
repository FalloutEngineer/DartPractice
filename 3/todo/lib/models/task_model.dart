class TaskModel {
  final int? id;
  final String? title;
  final String? text;

  TaskModel({this.id, this.title, this.text});

  Map<String, dynamic> toMap() {
    return {'id': id, 'title': title, 'text': text};
  }
}
