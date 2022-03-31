import 'package:dio/dio.dart';
import 'package:wasiman_test/model/responsejson.dart';

class ListArticleProv {
  Future<ResponseListModel> getArticle({int? start, int? limit}) async {
    try {
      Response response =
          await Dio().get('http://jsonplaceholder.typicode.com/photos');
      return ResponseListModel.fromJson(response.data[0]);
    } on DioError catch (e) {
      return ResponseListModel.fromJson(e.response!.data);
    }
  }
}
