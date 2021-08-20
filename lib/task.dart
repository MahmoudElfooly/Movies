class Task {
  String name;
  String description;
  late String screen;

  Task({
    required this.name,
    required this.description,
    required String screen,
  }) {
    this.screen = screen;
  }
}
