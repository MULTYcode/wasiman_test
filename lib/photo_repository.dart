import 'package:dio/dio.dart';

import 'photos_model.dart';

class PhotoRepository {
  Future<List<PhotosModel>?> getPhotos({int? start, int? limit}) async {
    var dio = Dio();
    final response = await dio.get(
        "http://jsonplaceholder.typicode.com/photos?_start=$start&_limit=${limit ?? 10}");
    if (response.statusCode == 200) {
      return photosModelFromJson(response.data);
    } else {
      return null;
    }
  }
}
