class TaskModel {
  final int id;
  final String name;
  final String description;
  final bool isHighPriority;

  TaskModel({
    required this.id,
    required this.name,
    required this.description,
    required this.isHighPriority,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'isHighPriority': isHighPriority,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      isHighPriority: map['isHighPriority'],
    );
  }
}
