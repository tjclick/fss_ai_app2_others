import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/history_model.dart';

class HistoryProviders {
  // static const baseUrl = 'https://www.fssai.kr/api/history';
  // static const baseUrl = 'http://10.21.1.61:8000/api/history';
  static const baseUrl = 'http://192.168.200.179:8000/api/history';
  // static const baseUrl = 'http://192.168.200.154:8000/api/history';

  // 추천종목 이력 리스트
  Future<List<HistoryDailyRateList>> getHistoryDailyRateList() async {
    List<HistoryDailyRateList> pTDHistoryList = [];
    final response = await http.get(
      Uri.parse('$baseUrl/HistoryDailyRateList?code=H001'),
    );
    if (response.statusCode == 200) {
      pTDHistoryList =
          jsonDecode(response.body).map<HistoryDailyRateList>((histlistmap) {
        return HistoryDailyRateList.fromMap(histlistmap);
      }).toList();
    }
    return pTDHistoryList;
  }
}
