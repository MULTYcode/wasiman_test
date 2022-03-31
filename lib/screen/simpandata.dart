import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SimpanData extends StatefulWidget {
  const SimpanData({Key? key}) : super(key: key);

  @override
  State<SimpanData> createState() => _SimpanDataState();
}

class _SimpanDataState extends State<SimpanData> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final _formKey = GlobalKey<FormState>();
  final _nama = TextEditingController();
  final _umur = TextEditingController();

  @override
  void initState() {
    super.initState();
    _prefs.then((SharedPreferences pref) {
      _nama.text = pref.getString("nama") ?? "";
      _umur.text = pref.getString("umur") ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Simpan Data")),
      body: Form(
          key: _formKey,
          child: Container(
            margin: const EdgeInsets.all(50),
            child: Column(
              children: [
                TextFormField(
                  controller: _nama,
                  decoration: const InputDecoration(hintText: "Input nama"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Masukan Nama";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _umur,
                  decoration: const InputDecoration(hintText: "Input umur"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Masukan Umur";
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          simpan();
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Berhasil disimpan!")));
                        }
                      },
                      child: const Text("Submit")),
                )
              ],
            ),
          )),
    );
  }

  Future<void> simpan() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      prefs.setString("nama", _nama.text);
      prefs.setString("umur", _umur.text);
    });
  }
}
