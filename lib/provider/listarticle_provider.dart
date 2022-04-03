import 'package:dio/dio.dart';
import 'package:wasiman_test/model/responsejson.dart';

class ListArticleProv {
  Future<ResponseListModel> getArticle({int? start, int? limit = 20}) async {
    try {
      Response response = await Dio().get(
          'https://jsonplaceholder.typicode.com/posts?_start=$start&_limit=$limit');
      return ResponseListModel(data: response.data);
    } on DioError catch (e) {
      return e.response?.data;
    }
  }
}
