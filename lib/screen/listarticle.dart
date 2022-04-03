import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasiman_test/provider/mainprovider.dart';

class ListArticle extends StatefulWidget {
  const ListArticle({Key? key}) : super(key: key);

  @override
  State<ListArticle> createState() => _ListArticleState();
}

class _ListArticleState extends State<ListArticle> {
  final _controller = ScrollController();
  late bool isLoading = false;

  static const snackBarTop = SnackBar(
    content: Text('At the top'),
  );

  static const snackBarBottom = SnackBar(
    content: Text('Please wait while loading more data'),
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
          setState(() {
            isLoading = true;
          });
          ScaffoldMessenger.of(context).showSnackBar(snackBarBottom);
          Provider.of<ProviderUtama>(context, listen: false).currentPage();
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
          builder: (context, value, child) => ListView.builder(
              controller: _controller,
              itemCount: value.list.length,
              itemBuilder: (context, index) => ListTile(
                    leading: CircleAvatar(
                      child: Text(value.list[index]['id'].toString()),
                    ),
                    title: Text(value.list[index]['title']),
                    subtitle: Text(value.list[index]['body']),
                  ))),
    );
  }
}

class MainProvider {}
