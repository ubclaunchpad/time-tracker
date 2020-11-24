class Task {
  final int id;
  final String description;
  final String category;
  final int startTime;
  final int stopTime;

  Task(
      {this.id = -1,
      this.description,
      this.startTime,
      this.stopTime,
      this.category});

  // Convert a task into a map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'startTime': startTime,
      'stopTime': stopTime,
      'category': category,
    };
  }
}
