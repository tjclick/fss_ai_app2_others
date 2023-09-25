import 'package:flutter/material.dart';
import 'package:fss_ai_app3/modules/login/models/model_auth.dart';
import 'package:provider/provider.dart';
import 'package:fss_ai_app3/screens/BottomNavigationBar.dart';
import 'package:get/get.dart';
import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';
import 'package:fss_ai_app3/utils.dart';


class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  bool isLoading = true;

  int _currentIndex = 3;
  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    if (index == 0) Get.toNamed("/home");
    if (index == 1) Get.toNamed("/analysis", arguments: {"ticker": '', "t_name": '',});
    if (index == 2) Get.toNamed("/history");
    //if (index == 3) Get.toNamed("/users");
  }

  Future initHistoryDailyRateList() async {

    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  void initState() {
    super.initState();
    // initHistoryDailyRateList().then((_) {
    //   setState(() {
    //     isLoading = false;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 410;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    double _size = 100.0;
    double _brightness = 1.0;

    return Scaffold(
      appBar: AppBar(
        //centerTitle: true,
        leading: Container(
          width:1,
        ),
        title: const Text(
          '관심 | 실적',
          style: TextStyle(
            color: Color(0xFFEDEDED),
            fontWeight: FontWeight.bold,
          ),
        ),

        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.menu_outlined),
            color: const Color(0xFFEDEDED),
            onPressed: () {
              //Get.toNamed("/historySearch",);
              //arguments: {"ticker": pTDHistoryList[index].ticker, "t_name": pTDHistoryList[index].t_name, });
            },
          ),
          IconButton(
            icon: const Icon(Icons.account_circle_outlined),
            color: const Color(0xFFEDEDED),
            onPressed: () {
              //Get.toNamed("/historySearch",);
              //arguments: {"ticker": pTDHistoryList[index].ticker, "t_name": pTDHistoryList[index].t_name, });
            },
          ),
        ],
        backgroundColor: const Color(0xFF292929),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                // Here, you can return a widget for each item based on the index.
                return SizedBox(
                  width: double.infinity,
                  child: Container(
                    // userscreen01hk5 (1:2)
                    padding: EdgeInsets.fromLTRB(0*fem, 10*fem, 0*fem, 108*fem),
                    width: double.infinity,
                    decoration: const BoxDecoration (
                      color: const Color(0xff292929),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Container(
                          // 검색 (메뉴,검색버튼) 영역
                          margin: EdgeInsets.fromLTRB(20*fem, 0*fem, 20*fem, 18*fem),
                          padding: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 10*fem),
                          width: double.infinity,
                          decoration: BoxDecoration (
                            border: Border.all(color: const Color(0xffededed)),
                            color: const Color(0xff1e1e1e),
                            borderRadius: BorderRadius.circular(10*fem),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0x26000000),
                                offset: Offset(0*fem, 4*fem),
                                blurRadius: 2*fem,
                              ),
                            ],
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // tsmenuiconoGd (9:9)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 10*fem),
                                width: 30*fem,
                                height: 30*fem,
                                child: IconButton(
                                  onPressed: () {
                                    Get.toNamed("/users");
                                  },
                                  icon: const Icon(Icons.menu, color: const Color(0XFFededed),),
                                ),
                              ),
                              Container(
                                // tssearchiconWwj (1:100)
                                margin: EdgeInsets.fromLTRB(290*fem, 1.02*fem, 0*fem, 10*fem),
                                width: 30*fem,
                                height: 30*fem,
                                child: IconButton(
                                  onPressed: () {
                                    Get.toNamed("/users");
                                  },
                                  icon: const Icon(Icons.search, color: const Color(0XFFededed),),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // 패턴 이미지 버튼 영역
                          margin: EdgeInsets.fromLTRB(20*fem, 0*fem, 0*fem, 16*fem),
                          width: double.infinity,
                          height: 49*fem,
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(30*fem),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // sliimgbtn01vkZ (1:84)
                                width: 100*fem,
                                height: 49*fem,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30*fem),
                                  child: Image.asset(
                                    'assets/images/screen/p_btn_01.png',
                                  ),
                                ),
                              ),
                              Container(
                                // autogroupjqub465 (KJJAtL6cJpCHgiUBHzjquB)
                                padding: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0*fem),
                                height: double.infinity,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      // sliimgbtn02aKK (3:112)
                                      width: 98*fem,
                                      height: 47*fem,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(30*fem),
                                        child: Image.asset(
                                          'assets/images/screen/p_btn_02.png',
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 7*fem,
                                    ),
                                    Container(
                                      // sliimgbtn03rnd (3:113)
                                      width: 101*fem,
                                      height: 47*fem,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(30*fem),
                                        child: Image.asset(
                                          'assets/images/screen/p_btn_03.png',
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 7*fem,
                                    ),

                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // gr4tickerlistWcH (11:11)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 19*fem),
                          width: 353*fem,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // autogrouptadoSVw (KJJBdtgMioxJzdrK7Ztado)
                                padding: EdgeInsets.fromLTRB(0*fem, 3*fem, 0*fem, 2*fem),
                                width: double.infinity,
                                height: 32*fem,
                                decoration: BoxDecoration (
                                  border: Border.all(color: const Color(0xff797979)),
                                  color: const Color(0xff191919),
                                  borderRadius: BorderRadius.circular(15*fem),
                                ),
                                child: Container(
                                  // liditems01wxV (11:3)
                                  width: double.infinity,
                                  height: double.infinity,
                                  decoration: BoxDecoration (
                                    borderRadius: BorderRadius.circular(3*fem),
                                  ),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // gQH (6:139)
                                        margin: EdgeInsets.fromLTRB(20*fem, 0*fem, 0*fem, 0*fem),
                                        child: Text(
                                          '모비어스',
                                          style: SafeGoogleFont (
                                            'Inter',
                                            fontSize: 18*ffem,
                                            fontWeight: FontWeight.w500,
                                            height: 1.5*ffem/fem,
                                            //letterSpacing: -0.36*fem,
                                            color: const Color(0xffededed),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        // B69 (6:140)
                                        margin: EdgeInsets.fromLTRB(20*fem, 0*fem, 10*fem, 0*fem),
                                        child: Text(
                                          '012345',
                                          style: SafeGoogleFont (
                                            'Inter',
                                            fontSize: 14*ffem,
                                            fontWeight: FontWeight.w400,
                                            height: 1.5*ffem/fem,
                                            //letterSpacing: -0.28*fem,
                                            color: const Color(0xffededed),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        // Uqw (6:148)
                                        '13,125',
                                        style: SafeGoogleFont (
                                          'Inter',
                                          fontSize: 14*ffem,
                                          fontWeight: FontWeight.w500,
                                          height: 1.5*ffem/fem,
                                          //letterSpacing: -0.28*fem,
                                          color: const Color(0xffededed),
                                        ),
                                      ),
                                      Container(
                                        // autogroupbfqm2Mf (KJJBpyCETqn6uYaCtwBfQM)
                                        padding: EdgeInsets.fromLTRB(0*fem, 4*fem, 0*fem, 2.46*fem),
                                        height: double.infinity,
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              // lisgrlow9x5 (6:145)
                                              margin: EdgeInsets.fromLTRB(10*fem, 0*fem, 5*fem, 0*fem),
                                              width: 50*fem,
                                              height: double.infinity,
                                              decoration: BoxDecoration (
                                                borderRadius: BorderRadius.circular(3*fem),
                                              ),
                                              child: Stack(
                                                children: [
                                                  Positioned(
                                                    // bxlowpriceHHb (6:146)
                                                    left: 0*fem,
                                                    top: 0*fem,
                                                    child: Align(
                                                      child: SizedBox(
                                                        width: 50*fem,
                                                        height: 18.64*fem,
                                                        child: Container(
                                                          decoration: BoxDecoration (
                                                            borderRadius: BorderRadius.circular(3*fem),
                                                            color: const Color(0xff3a65ff),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    // l35CQZ (6:147)
                                                    // left: 6.3076934814*fem,
                                                    top: 0*fem,
                                                    child: Align(
                                                      child: SizedBox(
                                                        width: 40*fem,
                                                        height: 17*fem,
                                                        child: Text(
                                                          'L -3.5%',
                                                          style: SafeGoogleFont (
                                                            'Inter',
                                                            fontSize: 11*ffem,
                                                            fontWeight: FontWeight.w500,
                                                            height: 1.5*ffem/fem,
                                                            letterSpacing: -0.22*fem,
                                                            color: const Color(0xffffffff),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              // lssgrhightHP (6:142)
                                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 1.9*fem),
                                              padding: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0*fem),
                                              height: 18.64*fem,
                                              decoration: BoxDecoration (
                                                color: const Color(0xfffd522c),
                                                borderRadius: BorderRadius.circular(3*fem),
                                              ),
                                              child: Text(
                                                'H  11.2%',
                                                style: SafeGoogleFont (
                                                  'Inter',
                                                  fontSize: 11*ffem,
                                                  fontWeight: FontWeight.w500,
                                                  height: 1.5*ffem/fem,
                                                  //letterSpacing: -0.22*fem,
                                                  color: const Color(0xffffffff),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                // autogroupfty1XLM (KJJC7J4N5nMuCTr9qaftY1)
                                padding: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0*fem),
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // liditem023Jh (11:42)
                                      width: double.infinity,
                                      height: 27*fem,
                                      decoration: BoxDecoration (
                                        borderRadius: BorderRadius.circular(3*fem),
                                      ),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            // hdcA8R (11:20)
                                            margin: EdgeInsets.fromLTRB(20*fem, 0*fem, 0*fem, 0*fem),
                                            child: Text(
                                              'HDC',
                                              style: SafeGoogleFont (
                                                'Inter',
                                                fontSize: 18*ffem,
                                                fontWeight: FontWeight.w500,
                                                height: 1.5*ffem/fem,
                                                //letterSpacing: -0.36*fem,
                                                color: const Color(0xff797979),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            // Ueu (11:21)
                                            margin: EdgeInsets.fromLTRB(45*fem, 0*fem, 10*fem, 0*fem),
                                            child: Text(
                                              '033345',
                                              style: SafeGoogleFont (
                                                'Inter',
                                                fontSize: 14*ffem,
                                                fontWeight: FontWeight.w400,
                                                height: 1.5*ffem/fem,
                                                //letterSpacing: -0.28*fem,
                                                color: const Color(0xff797979),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            // CL1 (11:19)
                                            '  5,125',
                                            style: SafeGoogleFont (
                                              'Inter',
                                              fontSize: 14*ffem,
                                              fontWeight: FontWeight.w500,
                                              height: 1.5*ffem/fem,
                                              //letterSpacing: -0.28*fem,
                                              color: const Color(0xff797979),
                                            ),
                                          ),
                                          Container(
                                            // autogroupgv21jaq (KJJCScqVvF6GrF9r1pGV21)
                                            padding: EdgeInsets.fromLTRB(10*fem, 4*fem, 10*fem, 2.46*fem),
                                            height: double.infinity,
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  // lisgrlow9tm (11:36)
                                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0*fem),
                                                  width: 54.67*fem,
                                                  height: double.infinity,
                                                  decoration: BoxDecoration (
                                                    borderRadius: BorderRadius.circular(3*fem),
                                                  ),
                                                  child: Stack(
                                                    children: [
                                                      Positioned(
                                                        // bxlowprice63K (11:37)
                                                        left: 0*fem,
                                                        top: 0*fem,
                                                        child: Align(
                                                          child: SizedBox(
                                                            width: 50*fem,
                                                            height: 18.64*fem,
                                                            child: Container(
                                                              decoration: BoxDecoration (
                                                                borderRadius: BorderRadius.circular(3*fem),
                                                                color: const Color(0xff3a65ff),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        // l35Qph (11:38)
                                                        // left: 6.3076934814*fem,
                                                        top: 0*fem,
                                                        child: Align(
                                                          child: SizedBox(
                                                            // width: 40*fem,
                                                            height: 17*fem,
                                                            child: Text(
                                                              'L  -3.5%',
                                                              style: SafeGoogleFont (
                                                                'Inter',
                                                                fontSize: 11*ffem,
                                                                fontWeight: FontWeight.w500,
                                                                height: 1.5*ffem/fem,
                                                                //letterSpacing: -0.22*fem,
                                                                color: const Color(0xffffffff),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  // lssgrhigh6Sd (11:33)
                                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 1.9*fem),
                                                  padding: EdgeInsets.fromLTRB(0*fem, 0*fem,0*fem, 0*fem),
                                                  height: 18.64*fem,
                                                  decoration: BoxDecoration (
                                                    color: const Color(0xfffd522c),
                                                    borderRadius: BorderRadius.circular(3*fem),
                                                  ),
                                                  child: Text(
                                                    'H  11.2%',
                                                    style: SafeGoogleFont (
                                                      'Inter',
                                                      fontSize: 11*ffem,
                                                      fontWeight: FontWeight.w500,
                                                      height: 1.5*ffem/fem,
                                                      //letterSpacing: -0.22*fem,
                                                      color: const Color(0xffffffff),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      // liditem033tM (11:43)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 2*fem),
                                      width: double.infinity,
                                      height: 27*fem,
                                      decoration: BoxDecoration (
                                        borderRadius: BorderRadius.circular(3*fem),
                                      ),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            // yX7 (11:30)
                                            margin: EdgeInsets.fromLTRB(20*fem, 0*fem, 0*fem, 0*fem),
                                            child: Text(
                                              '신성델타',
                                              style: SafeGoogleFont (
                                                'Inter',
                                                fontSize: 18*ffem,
                                                fontWeight: FontWeight.w500,
                                                height: 1.5*ffem/fem,
                                                //letterSpacing: -0.36*fem,
                                                color: const Color(0xff797979),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            // 6bj (11:31)
                                            margin: EdgeInsets.fromLTRB(20*fem, 0*fem, 10*fem, 0*fem),
                                            child: Text(
                                              '154644',
                                              style: SafeGoogleFont (
                                                'Inter',
                                                fontSize: 14*ffem,
                                                fontWeight: FontWeight.w400,
                                                height: 1.5*ffem/fem,
                                                //letterSpacing: -0.28*fem,
                                                color: const Color(0xff797979),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            // RP7 (11:29)
                                            '45,125',
                                            style: SafeGoogleFont (
                                              'Inter',
                                              fontSize: 14*ffem,
                                              fontWeight: FontWeight.w500,
                                              height: 1.5*ffem/fem,
                                              //letterSpacing: -0.28*fem,
                                              color: const Color(0xff797979),
                                            ),
                                          ),
                                          Container(
                                            // autogroupbt49ZkD (KJJCmh83uKybind4RRBt49)
                                            padding: EdgeInsets.fromLTRB(10*fem, 4*fem, 10*fem, 2.46*fem),
                                            height: double.infinity,
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  // lisgrlow9tm (11:36)
                                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0*fem),
                                                  width: 54.67*fem,
                                                  height: double.infinity,
                                                  decoration: BoxDecoration (
                                                    borderRadius: BorderRadius.circular(3*fem),
                                                  ),
                                                  child: Stack(
                                                    children: [
                                                      Positioned(
                                                        // bxlowprice63K (11:37)
                                                        left: 0*fem,
                                                        top: 0*fem,
                                                        child: Align(
                                                          child: SizedBox(
                                                            width: 50*fem,
                                                            height: 18.64*fem,
                                                            child: Container(
                                                              decoration: BoxDecoration (
                                                                borderRadius: BorderRadius.circular(3*fem),
                                                                color: const Color(0xff3a65ff),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        // l35Qph (11:38)
                                                        // left: 6.3076934814*fem,
                                                        top: 0*fem,
                                                        child: Align(
                                                          child: SizedBox(
                                                            // width: 40*fem,
                                                            height: 17*fem,
                                                            child: Text(
                                                              'L  -3.5%',
                                                              style: SafeGoogleFont (
                                                                'Inter',
                                                                fontSize: 11*ffem,
                                                                fontWeight: FontWeight.w500,
                                                                height: 1.5*ffem/fem,
                                                                //letterSpacing: -0.22*fem,
                                                                color: const Color(0xffffffff),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  // lssgrhigh6Sd (11:33)
                                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 1.9*fem),
                                                  padding: EdgeInsets.fromLTRB(0*fem, 0*fem,0*fem, 0*fem),
                                                  height: 18.64*fem,
                                                  decoration: BoxDecoration (
                                                    color: const Color(0xfffd522c),
                                                    borderRadius: BorderRadius.circular(3*fem),
                                                  ),
                                                  child: Text(
                                                    'H  11.2%',
                                                    style: SafeGoogleFont (
                                                      'Inter',
                                                      fontSize: 11*ffem,
                                                      fontWeight: FontWeight.w500,
                                                      height: 1.5*ffem/fem,
                                                      //letterSpacing: -0.22*fem,
                                                      color: const Color(0xffffffff),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      // liditem04fqB (11:32)
                                      width: double.infinity,
                                      height: 27*fem,
                                      decoration: BoxDecoration (
                                        borderRadius: BorderRadius.circular(3*fem),
                                      ),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            // cEd (11:40)
                                            margin: EdgeInsets.fromLTRB(20*fem, 0*fem, 0*fem, 0*fem),
                                            child: Text(
                                              '유니온',
                                              style: SafeGoogleFont (
                                                'Inter',
                                                fontSize: 18*ffem,
                                                fontWeight: FontWeight.w500,
                                                height: 1.5*ffem/fem,
                                                //letterSpacing: -0.36*fem,
                                                color: const Color(0xff797979),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            // 8im (11:41)
                                            margin: EdgeInsets.fromLTRB(40*fem, 0*fem, 15*fem, 0*fem),
                                            child: Text(
                                              '081051',
                                              style: SafeGoogleFont (
                                                'Inter',
                                                fontSize: 14*ffem,
                                                fontWeight: FontWeight.w400,
                                                height: 1.5*ffem/fem,
                                                letterSpacing: -0.28*fem,
                                                color: const Color(0xff797979),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            // sAZ (11:39)
                                            '13,125',
                                            style: SafeGoogleFont (
                                              'Inter',
                                              fontSize: 14*ffem,
                                              fontWeight: FontWeight.w500,
                                              height: 1.5*ffem/fem,
                                              //letterSpacing: -0.28*fem,
                                              color: const Color(0xff797979),
                                            ),
                                          ),
                                          Container(
                                            // autogroupmjdfRC5 (KJJD4GUmNeQSnwjV8hMJdf)
                                            padding: EdgeInsets.fromLTRB(10*fem, 4*fem, 10*fem, 2.46*fem),
                                            height: double.infinity,
                                            child: Row(
                                              // crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  // lisgrlow9tm (11:36)
                                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0*fem),
                                                  width: 54.67*fem,
                                                  height: double.infinity,
                                                  decoration: BoxDecoration (
                                                    borderRadius: BorderRadius.circular(3*fem),
                                                  ),
                                                  child: Stack(
                                                    children: [
                                                      Positioned(
                                                        // bxlowprice63K (11:37)
                                                        left: 0*fem,
                                                        top: 0*fem,
                                                        child: Align(
                                                          child: SizedBox(
                                                            width: 50*fem,
                                                            height: 18.64*fem,
                                                            child: Container(
                                                              decoration: BoxDecoration (
                                                                borderRadius: BorderRadius.circular(3*fem),
                                                                color: const Color(0xff3a65ff),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        // l35Qph (11:38)
                                                        // left: 6.3076934814*fem,
                                                        top: 0*fem,
                                                        child: Align(
                                                          child: SizedBox(
                                                            // width: 40*fem,
                                                            height: 17*fem,
                                                            child: Text(
                                                              'L  -3.5%',
                                                              style: SafeGoogleFont (
                                                                'Inter',
                                                                fontSize: 11*ffem,
                                                                fontWeight: FontWeight.w500,
                                                                height: 1.5*ffem/fem,
                                                                //letterSpacing: -0.22*fem,
                                                                color: const Color(0xffffffff),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  // lssgrhigh6Sd (11:33)
                                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 1.9*fem),
                                                  padding: EdgeInsets.fromLTRB(0*fem, 0*fem,0*fem, 0*fem),
                                                  height: 18.64*fem,
                                                  decoration: BoxDecoration (
                                                    color: const Color(0xfffd522c),
                                                    borderRadius: BorderRadius.circular(3*fem),
                                                  ),
                                                  child: Text(
                                                    'H  11.2%',
                                                    style: SafeGoogleFont (
                                                      'Inter',
                                                      fontSize: 11*ffem,
                                                      fontWeight: FontWeight.w500,
                                                      height: 1.5*ffem/fem,
                                                      //letterSpacing: -0.22*fem,
                                                      color: const Color(0xffffffff),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // 선택 종목 예측 차트 영역
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 25*fem),
                          padding: EdgeInsets.fromLTRB(0*fem, 11*fem, 0*fem, 18*fem),
                          width: 376*fem,
                          height: 420*fem,
                          decoration: BoxDecoration (
                            color: const Color(0xff1e1e1e),
                            borderRadius: BorderRadius.circular(10*fem),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0x26000000),
                                offset: Offset(0*fem, 4*fem),
                                blurRadius: 2*fem,
                              ),
                            ],
                          ),
                          child: Container(
                            // gr5submainBMb (13:51)
                            width: double.infinity,
                            height: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // gr5schartmainKih (13:50)
                                  width: 355*fem,
                                  height: 170*fem,
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 12*fem),
                                  padding: EdgeInsets.fromLTRB(0*fem, 24*fem, 0*fem, 0*fem),
                                  //width: double.infinity,
                                  decoration: BoxDecoration (
                                    border: Border.all(color: const Color(0xff000000)),
                                    borderRadius: BorderRadius.circular(10*fem),
                                    image: const DecorationImage (
                                      image: AssetImage (
                                        'assets/images/screen/p_pred_chart.png',
                                      ),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color(0x00000000),
                                        offset: Offset(0*fem, 4*fem),
                                        blurRadius: 2*fem,
                                      ),
                                    ],
                                  ),

                                ),
                                Container(
                                  // gr5slistitemao3 (13:49)
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0*fem),
                                  width: double.infinity,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // gr5ssliitem1Wwb (13:47)
                                        width: double.infinity,
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              // fpV (3:115)
                                              margin: EdgeInsets.fromLTRB(20*fem, 0*fem, 0*fem, 0*fem),
                                              child: Text(
                                                '거래량',
                                                style: SafeGoogleFont (
                                                  'Inter',
                                                  fontSize: 15*ffem,
                                                  fontWeight: FontWeight.w300,
                                                  height: 1.5*ffem/fem,
                                                  color: const Color(0xffffffff),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              // autogroupambwbTF (KJJFFnecqCJaB1xVWjaMBw)
                                              margin: EdgeInsets.fromLTRB(20*fem, 10*fem, 0*fem, 0*fem),
                                              width: 244*fem,
                                              height: 30*fem,
                                              //  test
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        // autogroup2mldpzD (KJJEae7BTX9jJyg9d12mLD)
                                        padding: EdgeInsets.fromLTRB(0*fem, 8*fem, 0*fem, 0*fem),
                                        width: double.infinity,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              // gr5ssliitem2xqX (13:48)
                                              margin: EdgeInsets.fromLTRB(00*fem, 0*fem, 0*fem, 19*fem),
                                              width: double.infinity,
                                              height: 23*fem,
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    // 6wj (3:118)
                                                    margin: EdgeInsets.fromLTRB(20*fem, 0*fem, 0*fem, 0*fem),
                                                    child: Text(
                                                      '경제시황',
                                                      style: SafeGoogleFont (
                                                        'Inter',
                                                        fontSize: 15*ffem,
                                                        fontWeight: FontWeight.w300,
                                                        height: 1.5*ffem/fem,
                                                        color: const Color(0xffffffff),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    // autogroupgfwpRj7 (KJJEjPMcFhkQcKvuZ8gfwP)
                                                    margin: EdgeInsets.fromLTRB(20*fem, 3*fem, 0*fem, 6*fem),
                                                    width: 235*fem,
                                                    height: double.infinity,
                                                    child: Stack(
                                                      children: [
                                                        Positioned(
                                                          // ellipse2ARo (3:134)
                                                          left: 120*fem,
                                                          top: 0*fem,
                                                          child: Align(
                                                            child: SizedBox(
                                                              width: 14*fem,
                                                              height: 14*fem,
                                                              child: Container(
                                                                decoration: BoxDecoration (
                                                                  borderRadius: BorderRadius.circular(7*fem),
                                                                  border: Border.all(color: const Color(0xff797979)),
                                                                  color: const Color(0xffededed),
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      color: const Color(0x3f000000),
                                                                      offset: Offset(0*fem, 4*fem),
                                                                      blurRadius: 2*fem,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              // gr5ssliitem3EgZ (13:46)
                                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 19*fem),
                                              width: double.infinity,
                                              height: 23*fem,
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    // Zyj (3:119)
                                                    margin: EdgeInsets.fromLTRB(20*fem, 0*fem, 0*fem, 0*fem),
                                                    child: Text(
                                                      '종목뉴스',
                                                      style: SafeGoogleFont (
                                                        'Inter',
                                                        fontSize: 15*ffem,
                                                        fontWeight: FontWeight.w300,
                                                        height: 1.5*ffem/fem,
                                                        color: const Color(0xffffffff),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    // autogroupxbkfJRX (KJJErt97o17r1V1Ge6xbKF)
                                                    margin: EdgeInsets.fromLTRB(20*fem, 4*fem, 0*fem, 5*fem),
                                                    width: 235*fem,
                                                    height: double.infinity,
                                                    child: Stack(
                                                      children: [
                                                        Positioned(
                                                          // ellipse32sK (3:135)
                                                          left: 120*fem,
                                                          top: 0*fem,
                                                          child: Align(
                                                            child: SizedBox(
                                                              width: 14*fem,
                                                              height: 14*fem,
                                                              child: Container(
                                                                decoration: BoxDecoration (
                                                                  borderRadius: BorderRadius.circular(7*fem),
                                                                  border: Border.all(color: const Color(0xff797979)),
                                                                  color: const Color(0xffededed),
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      color: const Color(0x3f000000),
                                                                      offset: Offset(0*fem, 4*fem),
                                                                      blurRadius: 2*fem,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              // gr5ssliitem4ik9 (13:45)
                                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 19*fem),
                                              width: double.infinity,
                                              height: 23*fem,
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    // f9b (3:120)
                                                    margin: EdgeInsets.fromLTRB(20*fem, 0*fem, 0*fem, 4*fem),
                                                    child: Text(
                                                      '기업전망',
                                                      style: SafeGoogleFont (
                                                        'Inter',
                                                        fontSize: 15*ffem,
                                                        fontWeight: FontWeight.w300,
                                                        height: 1.5*ffem/fem,
                                                        color: const Color(0xffffffff),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    // autogroupu7hbBdj (KJJEziFQU8x1nHrwRFU7Hb)
                                                    margin: EdgeInsets.fromLTRB(20*fem, 0*fem, 0*fem, 5*fem),
                                                    width: 235*fem,
                                                    height: double.infinity,
                                                    child: Stack(
                                                      children: [
                                                        Positioned(
                                                          // ellipse4KE9 (3:136)
                                                          left: 120*fem,
                                                          top: 0*fem,
                                                          child: Align(
                                                            child: SizedBox(
                                                              width: 14*fem,
                                                              height: 14*fem,
                                                              child: Container(
                                                                decoration: BoxDecoration (
                                                                  borderRadius: BorderRadius.circular(7*fem),
                                                                  border: Border.all(color: const Color(0xff797979)),
                                                                  color: const Color(0xffededed),
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      color: const Color(0x3f000000),
                                                                      offset: Offset(0*fem, 4*fem),
                                                                      blurRadius: 2*fem,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              // gr5ssliitem516y (13:44)
                                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0*fem),
                                              width: double.infinity,
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                children: [
                                                  Container(
                                                    // 9U5 (3:121)
                                                    margin: EdgeInsets.fromLTRB(20*fem, 0*fem, 0*fem, 0*fem),
                                                    child: Text(
                                                      '종합지수',
                                                      style: SafeGoogleFont (
                                                        'Inter',
                                                        fontSize: 15*ffem,
                                                        fontWeight: FontWeight.w300,
                                                        height: 1.5*ffem/fem,
                                                        color: const Color(0xffffffff),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    // autogroupvsamTzZ (KJJF73QC31htsfhjabvSam)
                                                    margin: EdgeInsets.fromLTRB(20*fem, 0*fem, 0*fem, 2*fem),
                                                    width: 235*fem,
                                                    height: 14*fem,
                                                    child: Stack(
                                                      children: [
                                                        Positioned(
                                                          // ellipse5CSM (3:137)
                                                          left: 120*fem,
                                                          top: 0*fem,
                                                          child: Align(
                                                            child: SizedBox(
                                                              width: 14*fem,
                                                              height: 14*fem,
                                                              child: Container(
                                                                decoration: BoxDecoration (
                                                                  borderRadius: BorderRadius.circular(7*fem),
                                                                  border: Border.all(color: const Color(0xff797979)),
                                                                  color: const Color(0xeeededed),
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      color: const Color(0x3f000000),
                                                                      offset: Offset(0*fem, 4*fem),
                                                                      blurRadius: 2*fem,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          // rectangle15m3 (19:2)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 21*fem, 26*fem),
                          width: 347*fem,
                          height: 138*fem,
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(10*fem),
                            color: const Color(0xffd9d9d9),
                          ),
                        ),
                        Container(
                          // gr7todayscorebUV (11:8)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 38*fem, 0*fem),
                          width: 332*fem,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                // gr5mtitlejKo (11:7)
                                margin: EdgeInsets.fromLTRB(1*fem, 0*fem, 4*fem, 9*fem),
                                width: double.infinity,
                                height: 30*fem,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // 4N5 (1:4)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 122*fem, 0*fem),
                                      child: Text(
                                        '오늘의 추천',
                                        style: SafeGoogleFont (
                                          'Inter',
                                          fontSize: 20*ffem,
                                          fontWeight: FontWeight.w600,
                                          height: 1.5*ffem/fem,
                                          letterSpacing: -0.4*fem,
                                          color: const Color(0xff797979),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      // gr5stitlemenuyV3 (11:6)
                                      margin: EdgeInsets.fromLTRB(0*fem, 3*fem, 0*fem, 2*fem),
                                      height: double.infinity,
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            // aiiBj (7:174)
                                            margin: EdgeInsets.fromLTRB(0*fem, 1*fem, 0*fem, 0*fem),
                                            child: Text(
                                              'AI 추천',
                                              style: SafeGoogleFont (
                                                'Inter',
                                                fontSize: 16*ffem,
                                                fontWeight: FontWeight.w600,
                                                height: 1.5*ffem/fem,
                                                letterSpacing: -0.32*fem,
                                                color: const Color(0xffededed),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            // EA5 (7:175)
                                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 1*fem),
                                            child: Text(
                                              '개인 종목',
                                              style: SafeGoogleFont (
                                                'Inter',
                                                fontSize: 16*ffem,
                                                fontWeight: FontWeight.w600,
                                                height: 1.5*ffem/fem,
                                                letterSpacing: -0.32*fem,
                                                color: const Color(0xff797979),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                // gr5recmlidkeD (11:5)
                                width: double.infinity,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      // autogroupj5zsJvd (KJJE5587ickPgR6ptqj5Zs)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 121*fem, 0*fem),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            // 3tD (7:176)
                                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 1*fem),
                                            child: Text(
                                              '바이오인프라',
                                              style: SafeGoogleFont (
                                                'Inter',
                                                fontSize: 14*ffem,
                                                fontWeight: FontWeight.w500,
                                                height: 1.5*ffem/fem,
                                                letterSpacing: -0.28*fem,
                                                color: const Color(0xffffffff),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            // yWy (7:177)
                                            margin: EdgeInsets.fromLTRB(24*fem, 0*fem, 0*fem, 0*fem),
                                            child: Text(
                                              '외 5 종목',
                                              style: SafeGoogleFont (
                                                'Inter',
                                                fontSize: 14*ffem,
                                                fontWeight: FontWeight.w500,
                                                height: 1.5*ffem/fem,
                                                letterSpacing: -0.28*fem,
                                                color: const Color(0xff797979),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      // autogroupgdlvJ3T (KJJE9z9bTh3fgmsaMwgdLV)
                                      margin: EdgeInsets.fromLTRB(0*fem, 2*fem, 30*fem, 0*fem),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Container(
                                            // dbX (7:178)
                                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 1*fem, 0*fem),
                                            child: Text(
                                              '325,000',
                                              style: SafeGoogleFont (
                                                'Inter',
                                                fontSize: 16*ffem,
                                                fontWeight: FontWeight.w400,
                                                height: 1.5*ffem/fem,
                                                letterSpacing: -0.32*fem,
                                                color: const Color(0xeeee4444),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            // xNu (7:180)
                                            '125,000',
                                            style: SafeGoogleFont (
                                              'Inter',
                                              fontSize: 16*ffem,
                                              fontWeight: FontWeight.w400,
                                              height: 1.5*ffem/fem,
                                              letterSpacing: -0.32*fem,
                                              color: const Color(0xff0099ff),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      // autogrouphndpJhf (KJJEEQBuW1er8eyNHnHnDP)
                                      margin: EdgeInsets.fromLTRB(0*fem, 2*fem, 0*fem, 0*fem),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            // emX (7:179)
                                            '+12%',
                                            style: SafeGoogleFont (
                                              'Inter',
                                              fontSize: 16*ffem,
                                              fontWeight: FontWeight.w400,
                                              height: 1.5*ffem/fem,
                                              letterSpacing: -0.32*fem,
                                              color: const Color(0xeeee4444),
                                            ),
                                          ),
                                          Text(
                                            // bgm (7:181)
                                            '-6.3%',
                                            style: SafeGoogleFont (
                                              'Inter',
                                              fontSize: 16*ffem,
                                              fontWeight: FontWeight.w400,
                                              height: 1.5*ffem/fem,
                                              letterSpacing: -0.32*fem,
                                              color: const Color(0xff0099ff),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              childCount: 1,
            ),
          ),
        ],
      ),

      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }

}


class LoginOutButton extends StatelessWidget {
  const LoginOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    final authClient =
        Provider.of<FirebaseAuthProvider>(context, listen: false);
    return TextButton(
        onPressed: () async {
          await authClient.logout();
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(const SnackBar(content: Text('logout!')));
          Navigator.of(context).pushReplacementNamed('/login');
        },
        child: const Text('logout'));
  }
}
