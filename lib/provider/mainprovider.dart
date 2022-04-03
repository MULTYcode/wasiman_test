import 'package:flutter/cupertino.dart';
import 'package:wasiman_test/model/responsejson.dart';
import 'package:wasiman_test/provider/listarticle_provider.dart';

class ProviderUtama with ChangeNotifier {
  late Future<ResponseListModel> futureList;
  late List list = [];
  late int startPage = 0;
  late int limitPage = 20;

  Future<List> getList() async {
    futureList = ListArticleProv().getArticle(start: startPage);
    await futureList.then((value) {
      list.addAll(value.data.toList());
    });
    notifyListeners();
    return list;
  }

  currentPage() async {
    startPage = startPage + limitPage;
    getList();
  }
}
