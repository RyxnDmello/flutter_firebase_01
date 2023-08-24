class TaskModel {
  const TaskModel({
    required this.title,
    required this.description,
    required this.priority,
    this.completed = false,
    required this.date,
  });

  final String title;
  final String description;
  final Priority priority;
  final bool completed;
  final String date;
}

enum Priority {
  high,
  medium,
  low,
}
