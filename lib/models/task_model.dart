class TaskModel {
  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.background,
    required this.priority,
    required this.date,
  });

  final String id;
  final String title;
  final String description;
  final int background;
  final int priority;
  final String date;
}
