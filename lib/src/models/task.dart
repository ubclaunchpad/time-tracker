class Task {
  final int id;
  final String description;
  final String category;
  final int clock;

  Task({this.id, this.description, this.category, this.clock});

  // Convert a task into a map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'clock': clock,
      'category': category,
    };
  }
}
