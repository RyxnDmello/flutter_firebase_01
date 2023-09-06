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

const tasks = [
  TaskModel(
    title: "TASK NAME",
    description: "Some Random Task",
    image: "./lib/images/progress/high.png",
    date: "7th Sept, 2023",
  ),
  TaskModel(
    title: "TASK NAME",
    description: "Some Random Task",
    image: "./lib/images/progress/medium.png",
    date: "7th Sept, 2023",
  ),
  TaskModel(
    title: "TASK NAME",
    description: "Some Random Task",
    image: "./lib/images/progress/low.png",
    date: "7th Sept, 2023",
  ),
  TaskModel(
    title: "TASK NAME",
    description: "Some Random Task",
    image: "./lib/images/progress/high.png",
    date: "7th Sept, 2023",
  ),
  TaskModel(
    title: "TASK NAME",
    description: "Some Random Task",
    image: "./lib/images/progress/medium.png",
    date: "7th Sept, 2023",
  ),
  TaskModel(
    title: "TASK NAME",
    description: "Some Random Task",
    image: "./lib/images/progress/low.png",
    date: "7th Sept, 2023",
  ),
  TaskModel(
    title: "TASK NAME",
    description: "Some Random Task",
    image: "./lib/images/progress/high.png",
    date: "7th Sept, 2023",
  ),
];
