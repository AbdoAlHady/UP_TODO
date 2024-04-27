class TaskModel {
  final String title;
  final String note;
  final String startTime;
  final String endTime;
  final int color;
  final int? id;
  final int isComplete;
  final String date;

  TaskModel({
    required this.title,
    required this.note,
    required this.startTime,
    required this.endTime,
    required this.date,
    this.id,
    required this.isComplete,
    required this.color,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
        id: json['id'],
        title: json['title'],
        note: json['notes'],
        startTime: json['startTime'],
        endTime: json['endTime'],
        date: json['date'],
        isComplete: json['isCompeleted'],
        color: json['color']);
  }
}
