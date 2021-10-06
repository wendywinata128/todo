class Task {
  late int id;
  late String title;
  late String description;
  late double progress;

  Task(this.id, this.title, this.description, this.progress);

  Task.fromMap(Map<String, dynamic> mapData) {
    id = mapData['id'];
    title = mapData['title'].toString();
    description = mapData['description'].toString();
    progress = double.parse(mapData['progress'].toString());
  }
}
