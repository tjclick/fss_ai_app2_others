from django.urls import path

from . import views
from .home import views as home
from .analysis import views as analysis
from .history import views as history

urlpatterns = [
    path('', views.index, name='index'),
    path('index.html', views.index, name='index'),
    path('401.html', views.e401_view, name='400'),
    path('404.html', views.e404_view, name='404'),
    path('500.html', views.e500_view, name='500'),
    path('charts.html', views.charts_view, name='charts'),
    path('layout-sidenav-light.html', views.lsl_view, name='layout-sidenav-light'),
    path('layout-static.html', views.ls_view, name='layout-static'),
    path('login.html', views.login_view, name='login'),
    path('password.html', views.password_view, name='password'),
    path('register.html', views.register_view, name='register'),
    path('tables.html', views.tables_view, name='tables'),
    path('kpi.html', views.kpi, name='kpi'),

    # WEB page service ==================================================================
    path('chart/chart_view.html', views.chart_view, name='chart_view'),
    path('dataframe/ticker_main.html', views.ticker_main, name='ticker_main'),
    path('dataframe/company_main.html', views.company_main, name='company_main'),
    path('dataframe/company_detail.html', views.company_detail, name='company_detail'),
    path('dataframe/volume_main.html', views.volume_main, name='volume_main'),
    path('search/ticker_search.html', views.ticker_search, name='ticker_search'),

    # MOBILE API service ==================================================================
    path('api/TodayPredictTickerList', views.TodayPredictTickerList, name='TodayPredictTickerList'),
    path('api/AdminConfirmFlagUpdate', views.AdminConfirmFlagUpdate, name='AdminConfirmFlagUpdate'),
    path('api/home/HomePredictedTickerList', home.HomePredictedTickerList, name='HomePredictedTickerList'),
    path('api/home/TickerSubLabelData', home.TickerSubLabelData, name='TickerSubLabelData'),

    path('api/analysis/TickerDailySiseData', analysis.TickerDailySiseData, name='TickerDailySiseData'),
    path('api/analysis/TickerPointListData', analysis.TickerPointListData, name='TickerPointListData'),
    path('api/analysis/TickerDailyAmountList', analysis.TickerDailyAmountList, name='TickerDailyAmountList'),

    path('api/history/HistoryDailyRateList', history.HistoryDailyRateList, name='HistoryDailyRateList'),

]