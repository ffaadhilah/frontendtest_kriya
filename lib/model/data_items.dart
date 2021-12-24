class DataItems {
  final int id;
  final String title;

  DataItems(
      {this.id,
      this.title});

  @override
  String toString() {
    return "{id: $id, title: $title}";
  }

  factory DataItems.fromJson(Map<String, dynamic> json) {
    return DataItems(
        id: json["id"],
        title: json["title"]);
  }
}

