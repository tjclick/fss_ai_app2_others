import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/history_model.dart';
import '../providers/history_provider.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  int _selectedIndex = 0;
  List<HistoryDailyRateList> pTDHistoryList = [];
  List<HistoryDailyRateList> jsonData = [];
  bool isLoading = true;
  HistoryProviders historyProvider = HistoryProviders();

  void _onItemTapped(int index) {
    if (index == 0) Get.toNamed("/home");
    if (index == 1) Get.toNamed("/analysis");
    if (index == 2) Get.toNamed("/history");
    if (index == 3) Get.toNamed("/users");
  }

  Future initHistoryDailyRateList() async {
    pTDHistoryList = await historyProvider.getHistoryDailyRateList();
    jsonData = pTDHistoryList;
  }

  @override
  void initState() {
    super.initState();
    initHistoryDailyRateList().then((_) {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'GOOD.AI',
          style: TextStyle(
            color: Color(0xFFEDEDED),
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            color: Color(0xFFEDEDED),
            onPressed: () {
              // Handle search action
            },
          ),
        ],
        backgroundColor: Color(0xFF292929),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                // Here, you can return a widget for each item based on the index.
                return Container(
                  padding: EdgeInsets.fromLTRB(15, 20, 0, 0),
                  child: Column(
                    children: [
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            pTDHistoryList[index].t_name,
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFFEDEDED),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            pTDHistoryList[index].ticker,
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF797979),
                              //fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                          //row children right
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              height: 100,
                              width: MediaQuery.of(context).size.width * 0.92,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 0, 0, 0),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                //column children left 위치 정렬
                                //padding left 15
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // 3*3 grid안에  각각의 grid에 text를 넣기 위해 column 사용하고 radius 10을 주고 색상을 넣어줌
                                  Container(
                                    padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                                    height: 100,
                                    width: MediaQuery.of(context).size.width *
                                        0.99,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: _makeSubResultData(jsonData, index),
                                  ),
                                ],
                              ),
                            ), // Replace with the actual number of items
                          ]),
                    ],
                  ),
                );
              },
              childCount: pTDHistoryList.length,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
            backgroundColor: Color(0xFF292929),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics),
            label: '분석',
            backgroundColor: Color(0xFF292929),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            label: '실적',
            backgroundColor: Color(0xFF292929),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: '회원',
            backgroundColor: Color(0xFF292929),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFFededed),
        unselectedItemColor: Color.fromARGB(255, 94, 94, 94),
        onTap: _onItemTapped,
      ),
    );
  }

  // ticker 데이터 위젯 구성
  Widget _makeSubResultData(List<HistoryDailyRateList> jsonData, int index) {
    var day1_buy_price = jsonData[index].day1_buy_price;
    var r_low_price = jsonData[index].r_low_price;
    var g_buy_rate = jsonData[index].g_buy_rate;
    var day2_sale_price = jsonData[index].day2_sale_price;
    var r_high_price = jsonData[index].r_high_price;
    var g_sale_rate = jsonData[index].g_sale_rate;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '구매 ' + day1_buy_price.toString(),
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 240, 60, 60),
                    ),
                  ),
                  Text(
                    '저가 ' + r_low_price.toString(),
                    // Text(pTickerList[index].close.toString(),
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 60, 150, 230),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(3, 1, 3, 1),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 240, 60, 60),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(g_buy_rate.toString() + ' %',
                        // Text(pTickerList[index].close.toString(),
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFFEDEDED),
                        )),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '판매 ' + day2_sale_price.toString(),
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 240, 60, 60),
                    ),
                  ),
                  Text(
                    '고가 ' + r_high_price.toString(),
                    // Text(pTickerList[index].close.toString(),
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 60, 150, 230),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(3, 1, 3, 1),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 250, 60, 60),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(g_sale_rate.toString() + ' %',
                        // Text(pTickerList[index].close.toString(),
                        style: TextStyle(
                          fontSize: 22,
                          color: Color(0xFFEDEDED),
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
