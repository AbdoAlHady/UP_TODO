class TaskModel {
  final String title;
  final String note;
  final String startTime;
  final String endTime;
  final int color;
  final String id;
  final bool isComplete;
  final String date;

  TaskModel({
    required this.title,
    required this.note,
    required this.startTime,
    required this.endTime,
    required this.date,
    required this.id,
    required this.isComplete,
    required this.color,
  });
}
