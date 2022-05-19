class Note{
  final String dateTime;
  final String task;

  Note({
    required this.dateTime,
    required this.task,
  });

  Map<String,dynamic> toMap() {
    return {
      "dateTime":dateTime,
      "task":task,
    };
  }
}