class Exercise {
  String name;
  int sets;
  int reps;
  double weight;

  Exercise({
    required this.name,
    required this.sets,
    required this.reps,
    required this.weight,
  });

  Map<String, dynamic> toMap() {
    return {'name': name, 'sets': sets, 'reps': reps, 'weight': weight};
  }

  factory Exercise.fromMap(Map<String, dynamic> map) {
    return Exercise(
      name: map['name'],
      sets: map['sets'],
      reps: map['reps'],
      weight: map['weight'],
    );
  }
}
