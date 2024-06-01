class TodoModel {
  TodoModel({
    required this.title,
    this.isDone = false,
    required this.description,
  });
  bool isDone;
  final String title;
  final String description;
}
