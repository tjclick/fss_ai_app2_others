import 'dart:convert';
import 'package:intl/intl.dart'; // Import the intl library

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});
  // final String ticker;
  // final String t_name;

  // NewsScreen({required this.ticker, required this.t_name,});

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  late String ticker; // 상위 위젯으로부터 호출시 변수값 전달 받기 위함
  late String t_name;
  List<dynamic> items = [];

  static const baseUrl =
      'https://openapi.naver.com/v1/search/news.json?display=10&start=1&sort=date';

  // 오늘 날짜와 2주 전 날짜를 구하기 위한 변수
  // DateTime now = DateTime.now();
  // DateTime twoWeeksAgo = DateTime.now().subtract(Duration(days: 16));
  // String today = DateTime.now().toString().substring(0, 10).replaceAll('-', '');
  // String twoWeeksAgoDay = DateTime.now().subtract(Duration(days: 16)).toString().substring(0, 10).replaceAll('-', '');

  // URL 크로링 데이터 가져오기
  Future<void> _fetchData() async {
    final response = await http.get(
      Uri.parse('$baseUrl&query=$t_name $ticker '),
      headers: {
        'X-Naver-Client-Id': 'qP_NjLKn94lp1SmkG6LS',
        'X-Naver-Client-Secret': 'iWuN6JZwRI',
        'Content-Type': 'application/json; charset=utf-8',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> jsonData = [];
      //List<dynamic> items = [];

      // 크로링 데이터 전처리 후 JSON 변환
      try {
        final jsonData = json.decode(response.body);
        items = jsonData['items'];
        //print(items);
      } catch (e) {
        print('Response Body: ${response.body}');
        print('JSON Parsing Error: $e');
      }
    } else {
      throw Exception('Failed to load data');
    }
  }

// //
  String _replaceStr(String pStr) {
    String rStr = pStr;
    rStr = rStr.replaceAll('<b>', '');
    rStr = rStr.replaceAll('</b>', '');
    rStr = rStr.replaceAll('&apos;', '');
    rStr = rStr.replaceAll('&lt;', '');
    return rStr;
  }

  @override
  void initState() {
    super.initState();

    setState(() {
      ticker = Get.arguments["ticker"];
      t_name = Get.arguments["t_name"];
      _fetchData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          t_name + ' News',
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
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: <Widget>[
              ListTile(
                title: Text(
                  _replaceStr(items[index]['title']),
                  style: TextStyle(
                    fontSize: 16, // 원하는 폰트 크기 설정
                    color: Color.fromARGB(255, 255, 255, 255), // 원하는 색상 설정
                  ),
                ),
                subtitle: Text(
                  _replaceStr(items[index]['description']),
                  style: TextStyle(
                    fontSize: 14, // 원하는 폰트 크기 설정
                    color: Color.fromARGB(255, 202, 202, 202), // 원하는 색상 설정
                  ),
                ),
                contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                onTap: () {
                  // 아이템을 탭할 때의 동작을 추가할 수 있습니다.
                  print('Linked : ${items[index]['link']}');
                },
              ),
              Divider(
                height: 1,
                color: Color.fromARGB(255, 80, 80, 80),
                indent: 20,
                endIndent: 20,
              ),
            ],
          );
        },
      ),
    );
  }
}
