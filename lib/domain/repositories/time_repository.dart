// time_repository.dart

abstract class TimeRepository {
  String get time;
  Stream<String> get stream;
  void dispose();
}
