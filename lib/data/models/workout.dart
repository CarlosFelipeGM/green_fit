import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:green_fit/data/models/exercise.dart';

class Workout {
  String id;
  String userId;
  String name;
  DateTime date;
  List<Exercise> exercises;

  Workout({
    required this.id,
    required this.userId,
    required this.name,
    required this.date,
    required this.exercises,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'name': name,
      'date': date,
      'exercises': exercises.map((exercise) => exercise.toMap()).toList(),
    };
  }

  factory Workout.fromMap(Map<String, dynamic> map) {
    return Workout(
      id: map['id'],
      userId: map['userId'],
      name: map['name'],
      date: (map['date'] as Timestamp).toDate(),
      exercises:
          (map['exercises'] as List)
              .map((exerciseMap) => Exercise.fromMap(exerciseMap))
              .toList(),
    );
  }
}
