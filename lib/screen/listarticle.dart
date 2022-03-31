import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import '../bloc/infinite_load_bloc.dart';
import '../photos_item.dart';
import '../photos_model.dart';

class ListArticle extends StatefulWidget {
  const ListArticle({Key? key}) : super(key: key);

  @override
  State<ListArticle> createState() => _ListArticleState();
}

class _ListArticleState extends State<ListArticle> {
  late InfiniteLoadBloc _bloc;
  late int _currentLenght;
  List<PhotosModel> _data = [];

  void _loadMoreData() {
    _bloc.add(GetMoreInfiniteLoad(start: _currentLenght, limit: 10));
  }

  @override
  void initState() {
    _bloc = BlocProvider.of<InfiniteLoadBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Article'),
      ),
      body: BlocBuilder<InfiniteLoadBloc, InfiniteLoadState>(
        builder: (context, state) {
          if (state is InfiniteLoadLoaded || state is InfiniteLoadMoreLoading) {
            if (state is InfiniteLoadLoaded) {
              _data = state.data;
              _currentLenght = state.count;
            }
            return _buildListPhotos(state);
          } else if (state is InfiniteLoadLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Text('Error');
          }
        },
      ),
    );
  }

  Widget _buildListPhotos(InfiniteLoadState state) {
    return LazyLoadScrollView(
      child: ListView(
        children: [
          ListView.builder(
              shrinkWrap: true,
              itemCount: _data.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, i) {
                return PhotoItem(data: _data[i]);
              }),
          // Loading indicator more load data
          (state is InfiniteLoadMoreLoading)
              ? const Center(child: CircularProgressIndicator())
              : const SizedBox(),
        ],
      ),
      onEndOfPage: _loadMoreData,
    );
  }
}
