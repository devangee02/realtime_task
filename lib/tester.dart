import 'package:flutter/material.dart';

class PaginatedScrollList extends StatefulWidget {
  @override
  _PaginatedScrollListState createState() => _PaginatedScrollListState();
}

class _PaginatedScrollListState extends State<PaginatedScrollList> {
  ScrollController _scrollController = ScrollController();
  List<int> _dataList = [];
  int _currentPage = 1;
  int _pageSize = 10;
  int _totalItems = 100;

  @override
  void initState() {
    super.initState();
    _fetchData();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _fetchData() {
    // Simulating API call to fetch data
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        int startIndex = (_currentPage - 1) * _pageSize;
        int endIndex = startIndex + _pageSize;
        if (endIndex > _totalItems) {
          endIndex = _totalItems;
        }
        _dataList.addAll(List.generate(
            endIndex - startIndex, (index) => index + startIndex + 1));
        _currentPage++;
      });
    });
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _fetchData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paginated Scroll List'),
      ),
      body: Container(
        height: 300,
        child: ListView.builder(
          controller: _scrollController,
          itemCount:
              _dataList.length + 1, // Add 1 for loading indicator at the end
          itemBuilder: (context, index) {
            if (index < _dataList.length) {
              return ListTile(
                title: Text('Item ${_dataList[index]}'),
              );
            } else {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PaginatedScrollList(),
  ));
}
