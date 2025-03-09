class DeepseekModel {
  final String name;
  final String description;
  final List<String> exercises;

  DeepseekModel({
    required this.name,
    required this.description,
    required this.exercises,
  });

  factory DeepseekModel.fromJson(Map<String, dynamic> json) {
    return DeepseekModel(
      name: json['name'],
      description: json['description'],
      exercises: List<String>.from(json['exercises']),
    );
  }
}
