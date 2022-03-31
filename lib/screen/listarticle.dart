import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasiman_test/model/responsejson.dart';
import 'package:wasiman_test/provider/mainprovider.dart';

class ListArticle extends StatefulWidget {
  const ListArticle({Key? key}) : super(key: key);

  @override
  State<ListArticle> createState() => _ListArticleState();
}

class _ListArticleState extends State<ListArticle> {
  final _controller = ScrollController();

  static const snackBarTop = SnackBar(
    content: Text('At the top'),
  );

  static const snackBarBottom = SnackBar(
    content: Text('At the bottom'),
  );

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.position.atEdge) {
        bool isTop = _controller.position.pixels == 0;
        if (isTop) {
          ScaffoldMessenger.of(context).showSnackBar(snackBarTop);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(snackBarBottom);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List Article"),
      ),
      body: Consumer<ProviderUtama>(
        builder: (context, value, child) => FutureBuilder<ResponseListModel>(
            future: value.futureList,
            builder: (context, snapshot) {
              if (snapshot.hasData == false) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                  controller: _controller,
                  itemCount: snapshot.data!.data.length,
                  itemBuilder: (context, index) => ListTile(
                        leading:
                            Text(snapshot.data!.data[index]['id'].toString()),
                        title: Text(
                            snapshot.data!.data[index]['title'].toString()),
                        subtitle:
                            Text(snapshot.data!.data[index]['body'].toString()),
                      ));
            }),
      ),
    );
  }
}

class MainProvider {}
