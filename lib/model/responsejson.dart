class ResponseListModel {
  late final int id;
  late final String title;
  late final String body;

  ResponseListModel(
      {required this.id, required this.title, required this.body});

  factory ResponseListModel.fromJson(Map<String, dynamic> usersjson) =>
      ResponseListModel(
        id: usersjson["id"] ?? "",
        title: usersjson["title"] ?? "",
        body: usersjson["body"] ?? "",
      );
}
