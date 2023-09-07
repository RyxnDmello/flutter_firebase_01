class TaskModel {
  const TaskModel({
    required this.title,
    required this.description,
    required this.image,
    required this.date,
  }) : isProgress = true;

  final String title;
  final String description;
  final String image;
  final String date;
  final bool isProgress;
}
