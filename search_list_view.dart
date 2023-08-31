import 'package:flutter/material.dart';
import 'package:fss_ai_app2/models/history_model.dart';
import 'package:fss_ai_app2/providers/history_provider.dart';

class SearchListView extends StatefulWidget {
  const SearchListView({super.key});
  // final String ticker;
  // final String t_name;
  // SearchListView({required this.ticker, required this.t_name,});

  @override
  _SearchListViewState createState() => _SearchListViewState();
}

class _SearchListViewState extends State<SearchListView> {
  bool isLoading = true;
  // late String ticker; // 상위 위젯으로부터 호출시 변수값 전달 받기 위함
  // late String t_name;
  List<String> _searchResults = [];
  List<String> _listTicker = [];
  List<String> _listName = [];
  List<SearchTickerNameList> pTDSearchList = [];

  final TextEditingController _searchController = TextEditingController();

  HistoryProviders historyProvider = HistoryProviders();
  Future initSearchTickerNameList() async {
    pTDSearchList = await historyProvider.getSearchTickerNameList();
    
    // SQL json return값을 컬럼별로 분리하여 리스트에 저장 List<map> -> String
    for (var item in pTDSearchList) {
      _listName.add(item.t_name);
      _listTicker.add(item.ticker);
    }

    await Future.delayed(Duration(seconds: 1));
  }
  
  
  void _performSearch() {
    String searchTerm = _searchController.text.toLowerCase();
    setState(() {
      _searchResults = _listName
          .where((item) => item.toLowerCase().contains(searchTerm))
          .toList();
    });
  }


  @override
  void initState() {
    super.initState();

    initSearchTickerNameList().then((_) {
      setState(() {
        isLoading = false;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search',
        style: TextStyle(
            color: Color(0xFFEDEDED),
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            color: Color(0xFFEDEDED),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
        backgroundColor: Color(0xFF292929),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    style: TextStyle(color: Color(0xFFEDEDED)),
                    decoration: InputDecoration(
                      hintText: 'Enter Ticker',
                      hintStyle: TextStyle(color: Color(0xFF797979)),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: _performSearch,
                  child: Text('Search', style: TextStyle(color: Color(0xFFEDEDED)),),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF29292929),
                  ),
                  
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_searchResults[index], style: TextStyle(color: Color(0xFFEDEDED), fontSize: 16),),
                  subtitle: Text(_searchResults[index], style: TextStyle(color: Color(0xFF797979), fontSize: 12),),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}