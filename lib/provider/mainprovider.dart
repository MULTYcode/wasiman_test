import 'package:flutter/cupertino.dart';
import 'package:wasiman_test/model/responsejson.dart';
import 'package:wasiman_test/provider/listarticle_provider.dart';

class ProviderUtama with ChangeNotifier {
  late Future<ResponseListModel> futureList;

  Future listarticle() async {
    var _article = ListArticleProv();
    futureList = _article.getArticle(start: 0, limit: 20);
    notifyListeners();
  }
}
