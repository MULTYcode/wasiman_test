class ResponseListModel {
  late final List data;
  ResponseListModel({required this.data});

  factory ResponseListModel.fromJson(Map<String, dynamic> json) =>
      ResponseListModel(data: json[0]);

  Map<String, dynamic> toJson() => {'data': data};
}
