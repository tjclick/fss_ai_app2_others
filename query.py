def INDEX_SELECT_TODAY_POINT_PRED(**kwargs):
    sql = f" select distinct A.ticker, A.name, round(A.company,2), round(A.volume,2), round(A.economic,2), round(A.news,2), round(A.market,2) " \
          f" from tb_daily_ticker_point A, tb_fit_keyvalue B " \
          f" where A.play_date = DATE_FORMAT(NOW(), '%Y%m%d') " \
          f" and (A.company > B.key1_min and A.company < B.key1_max) " \
          f" and (A.volume >= B.key2_min and A.volume <=B.key2_max) " \
          f" and (A.economic > B.key3_min and A.economic < B.key3_max) " \
          f" and (A.news >= B.key4_min and A.news <= B.key4_max) "
    return sql

def CHART_VIEW_SELECT_PRED(**kwargs):
    ticker = kwargs.get('ticker')
    today = kwargs.get('today')
    sql = f" select orgin_pred, fited_pred from tb_daily_ticker_pred A " \
          f" where A.play_date='{today}' and A.ticker='{ticker}' " \
          f" and A.play_time=(select max(play_time) from tb_daily_ticker_pred B where A.play_date = B.play_date and A.ticker = B.ticker) "
    return sql

def TICKER_MAIN_SELECT_POINT(**kwargs):
    ticker = kwargs.get('ticker')
    sql = f" select play_date, round(company,2), round(volume,2), round(economic,2), round(news,2), round(market,2), round(r_close,0), round(r_volume,0), round(r_rate,2) " \
            f" from tb_daily_ticker_point where ticker='{ticker}' order by play_date desc "
    return sql

def TICKER_MAIN_SELECT_VOLUME(**kwargs):
    ticker = kwargs.get('ticker')
    sql = f" select play_date, round(gov_vs_mon,2), round(gov_week,2), round(fore_vs_mon,2), round(fore_week,2), round(point,2) " \
          f" from tb_daily_volume where ticker='{ticker}' order by play_date "
    return sql

def TICKER_MAIN_SELECT_NEWS(**kwargs):
    ticker = kwargs.get('ticker')
    sql = f" select news_date, round(point,2), `desc` from tb_daily_news where ticker='{ticker}' order by news_date desc "
    return sql

def AI144_SELECT_POINT_LIST(**kwargs):
    s_date = kwargs.get('s_date')
    e_date = kwargs.get('e_date')
    min_cnt = kwargs.get('min_cnt')
    max_cnt = kwargs.get('max_cnt')
    sql = f" select distinct bb.ticker, bb.name, bb.cnt, bb.max_date,  " \
          f"     round(aa.company,2), round(aa.volume,2), round(aa.economic,2), round(aa.news,2), " \
          f"     round(aa.r_close,0), round(aa.r_volume,0), round(aa.r_rate,2) " \
          f" from tb_daily_ticker_point aa, " \
          f" (select max(play_date) as max_date, ticker, name, count(1) as cnt " \
          f"     from tb_daily_ticker_point " \
          f"     where play_date between '{s_date}' and '{e_date}' " \
          f"     group by ticker, name " \
          f" ) bb  " \
          f" where aa.ticker = bb.ticker  " \
          f" and aa.play_date = bb.max_date " \
          f" and bb.cnt between {min_cnt} and {max_cnt}  " \
          f" order by bb.max_date desc, bb.cnt desc, bb.name "
    return sql

def AI144_SELECT_TICKER_POINT(**kwargs):
    ticker = kwargs.get('ticker')
    sql = f" select distinct play_date, round(company,2), round(volume,2), round(economic,2), round(news,2), " \
          f" round(r_open,0), round(r_close,0), round(r_volume,0), round(r_rate,2) " \
          f" from tb_daily_ticker_point where ticker ='{ticker}' order by play_date desc "
    return sql

def AI144_SELECT_TICKER_NEWS(**kwargs):
    ticker = kwargs.get('ticker')
    sql = f" select distinct news_date, `desc` from tb_daily_news where ticker='{ticker}' order by news_date desc "
    return sql

def VOLUME_MAIN_SELECT_LIST(**kwargs):
    s_date = kwargs.get('s_date')
    e_date = kwargs.get('e_date')
    sql = f" select play_date, ticker, name, round(gov_vs_mon,0), round(gov_week,0), round(fore_vs_mon,0), round(fore_week,0), round(`point`,2) " \
          f" from tb_daily_volume " \
          f" where play_date between '{s_date}' and '{e_date}' " \
          f" order by play_date desc, `point` desc "
    return sql

def API_TICKER_POINT_LIST(**kwargs):
    s_date = kwargs.get('s_date')
    e_date = kwargs.get('e_date')
    ticker = kwargs.get('ticker')
    name = kwargs.get('name')
    sql = f" select distinct play_date `DATE`, ticker TICKER, name NAME, round(company,2) COMPANY, round(volume,2) VOLUME,  " \
            f"  round(economic,2) ECONOMIC, round(news,2) NEWS, round(r_open,0) `OPEN`, round(r_close,0) `CLOSE`, round(r_volume,0) AMOUNT, round(r_rate,1) RATE " \
            f" from tb_daily_ticker_point A, tb_fit_keyvalue B " \
            f" where play_date between '{s_date}' and '{e_date}' " \
            f" and (A.company > B.key1_min and A.company < B.key1_max) " \
            f" and (A.volume >= B.key2_min and A.volume <=B.key2_max) " \
            f" and (A.news >= B.key4_min and A.news <= B.key4_max) "
            # f" and (A.economic > B.key3_min and A.economic < B.key3_max) "
    if ticker != None and ticker != '':
        sql += f" and ticker like '{ticker}%' "
    if name != None and name != '':
        sql += f" and name like '%{name}%' "
    return sql

def API_ADMIN_CONFIRM_FLAG_UPDATE(**kwargs):
    flag = kwargs.get('flag')
    ticker = kwargs.get('ticker')
    p_date = kwargs.get('p_date')
    sql = f" update tb_daily_ticker_point set admin_check_flag='{flag}' where ticker='{ticker}' and play_date='{p_date}' "
    return sql

def API_HOME_A001(**kwargs):
    p_date = kwargs.get('e_date')
    sql = f" select max(b.play_time) play_time, b.ticker, a.name " \
          f" from tb_daily_ticker_point a, tb_daily_ticker_pred b " \
          f" where a.TICKER = b.ticker and a.play_date = '{p_date}' " \
          f" and a.play_date = b.play_date " \
          f" and a.admin_check_flag = 'Y' " \
          f" group by b.ticker, a.name "
    return sql

def API_HOME_A002(**kwargs):
    p_date = kwargs.get('e_date')
    ticker = kwargs.get('ticker')
    # 어제 get_size + 오늘/D+1(origin_pred) + D+2(fited_pred)
    sql = f" select CAST(orgin_pred AS SIGNED) orgin, CAST(fited_pred AS SIGNED) fited " \
          f" from tb_daily_ticker_pred " \
          f" where play_date ='{p_date}' and ticker ='{ticker}' " \
          f" order by seq_min "
    return sql

def API_HOME_A003(**kwargs):
    p_date = kwargs.get('e_date')
    ticker = kwargs.get('ticker')
    sql = f" select yest_high, yest_low, yest_close, " \
            f"  ROUND(((day1_high - yest_close) / yest_close)*100, 1) AS day1_high, " \
            f"  ROUND(((day1_low - yest_close) / yest_close)*100, 1) AS day1_low, " \
            f"  CAST((yest_close * 0.98) AS SIGNED) day1_buy_price, " \
            f"  ROUND(((day2_high - yest_close) / yest_close)*100, 1) AS day2_high, " \
            f"  ROUND(((day2_low - yest_close) / yest_close)*100, 1) AS day2_low, " \
            f"  CAST((yest_close * 1.04) AS SIGNED) day2_sale_price " \
            f" from tb_daily_target_recomm  " \
            f" where play_date ='{p_date}' and ticker ='{ticker}' "
    return sql


def API_ANALYSIS_B001(**kwargs):
    s_date = kwargs.get('s_date')
    e_date = kwargs.get('e_date')
    ticker = kwargs.get('ticker')

    sql = f" select AA.play_date, company, volume, economic, news, day_rate, " \
          f"  round(((day1_low - day_open) / day_open * 100), 1) as day1_low, " \
          f"  round(((day2_high - day_open) / day_open * 100), 1) as day2_high " \
          f" from  " \
          f" ( select distinct A.play_date play_date, round(A.company, 2) company, round(A.volume, 2) volume, " \
          f"     round(A.economic, 2) economic, round(A.news, 2) news, round(A.r_rate, 1) day_rate, C.day_open, C.day2_high, " \
          f"     CASE WHEN C.day_low < C.day1_low THEN C.day_low ELSE day1_low END as day1_low " \
          f" from tb_daily_ticker_point A " \
          f"      LEFT OUTER JOIN tb_daily_result_process C " \
          f"      ON A.ticker = C.ticker and A.play_date = C.play_date, " \
          f"      tb_fit_keyvalue B " \
          f" where A.play_date between '{s_date}' and '{e_date}' " \
          f"   and (A.company > B.key1_min and A.company < B.key1_max) " \
          f"   and (A.volume >= B.key2_min and A.volume <=B.key2_max) " \
          f"   and (A.news >= B.key4_min and A.news <= B.key4_max) " \
          f"   and A.ticker = '{ticker}' " \
          f" ) AA order by play_date "
    return sql

def API_HISTORY_H001(**kwargs):
    s_date = kwargs.get('s_date')
    e_date = kwargs.get('e_date')

    sql = f" SELECT AA.play_date, AA.ticker, AA.name, AA.yest_close, " \
        f"      AA.day1_buy_price, AA.r_low_price, " \
        f"      round((((AA.r_low_price / AA.day1_buy_price)*100)-1),1) as g_buy_rate, " \
        f"      AA.day2_sale_price, AA.r_high_price, " \
        f"      round((((AA.r_high_price / AA.day2_sale_price)*100)-1),1) as g_sale_rate " \
        f" from ( " \
        f"      select A.play_date, A.ticker, C.name, A.yest_close, " \
        f"          CAST((A.yest_close * B.key5_min) AS SIGNED) day1_buy_price, C.r_low_price, " \
        f"          CAST((A.yest_close * B.key5_max) AS SIGNED) day2_sale_price, C.r_high_price " \
        f"      from tb_daily_target_recomm A " \
        f"      LEFT OUTER JOIN " \
        f"      (select play_date, ticker, name, day2_high as r_high_price, " \
        f"          case when day_low < day1_low then day_low " \
        f"          else day1_low end r_low_price " \
        f"      from tb_daily_result_process " \
        f"      ) C " \
        f"      ON A.play_date=C.play_date and A.ticker=C.ticker " \
        f"      , tb_fit_keyvalue B " \
        f"      where A.play_date between '{s_date}' and '{e_date}' " \
        f"      and B.use_yn ='Y' " \
        f" ) AA " \
        f" order by AA.play_date desc "
    return sql