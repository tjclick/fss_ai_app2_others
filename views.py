import json
import pandas as pd
from django.http import HttpResponse
from src.database import mysqldb, query
from src.model import AI144
from datetime import datetime, timedelta
from decimal import Decimal, ROUND_HALF_UP
from src.pykrx import stock

from django.views.decorators.csrf import csrf_exempt    # csrf 예외처리
from django.utils.decorators import method_decorator    # csrf 예외처리

# decimal 자릿수를 2자리까지 변경하는 함수를 정의합니다.
def r_dec(val):
    return Decimal(val).quantize(Decimal('0.00'), rounding=ROUND_HALF_UP)

def r_date(period):
    ago = datetime.now() - timedelta(days=period)
    e_date = datetime.now().strftime("%Y%m%d")
    s_date = ago.strftime("%Y%m%d")
    return s_date, e_date

@method_decorator(csrf_exempt, name='dispatch')     # csrf 예외처리
def HistoryDailyRateList(request):
    s_date, e_date = r_date(30)
    json_data = mysqldb.SelectDataReturnToJson(query.API_HISTORY_H001(s_date=s_date, e_date=e_date))
    return HttpResponse(json_data, content_type='application/json')