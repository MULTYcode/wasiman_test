import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasiman_test/provider/mainprovider.dart';
import 'package:wasiman_test/screen/listarticle.dart';
import 'package:wasiman_test/screen/simpandata.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () => getArticle(context),
                child: const Text("List Articles")),
            ElevatedButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SimpanData(),
                  )),
              child: const Text("Simpan Data"),
            )
          ],
        ),
      ),
    );
  }

  getArticle(context) {
    final _p = Provider.of<ProviderUtama>(context, listen: false);
    _p.listarticle();
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ListArticle(),
        ));
  }
}
