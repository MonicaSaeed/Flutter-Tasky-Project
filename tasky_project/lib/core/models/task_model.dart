class TaskModel {
  final int id;
  final String name;
  final String description;
  final bool isHighPriority;
  bool isCompleted;

  TaskModel({
    required this.id,
    required this.name,
    required this.description,
    required this.isHighPriority,
    this.isCompleted = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'isHighPriority': isHighPriority,
      'isCompleted': isCompleted,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      isHighPriority: map['isHighPriority'],
      isCompleted: map['isCompleted'] ?? false,
    );
  }
}
