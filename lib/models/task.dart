class Task {
  final int id;
  final String description;
  final String category;
  final int time;

  Task({this.id, this.description, this.category, this.time});

  // Convert a task into a map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'category': category,
      'time': time,
    };
  }
}
