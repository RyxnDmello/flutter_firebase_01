import 'package:uuid/uuid.dart';

const _uuid = Uuid();

class TaskModel {
  TaskModel({
    required this.title,
    required this.description,
    required this.image,
    required this.date,
  })  : id = _uuid.v4(),
        isProgress = true;

  final String id;
  final String title;
  final String description;
  final String image;
  final String date;
  final bool isProgress;
}
