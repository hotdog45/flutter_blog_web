import 'package:dio/dio.dart';
import 'package:dio_log/dio_log.dart';
import 'package:my_blog/config/config.dart';
import 'package:my_blog/common/utils/toast_utils.dart';

import 'address.dart';
import 'code.dart';
import 'interceptors/header_interceptor.dart';
import 'interceptors/log_interceptor.dart';
HttpManager httpManager = HttpManager();
///http请求
class HttpManager {
  Dio _dio = Dio(); // 使用默认配置

  HttpManager() {
    _dio.interceptors.add(HeaderInterceptors());
    _dio.interceptors.add(LogsInterceptors());
    _dio.interceptors.add(DioLogInterceptor());
  }

  ///发起网络请求
  netFetch(
    String api,
    body, {
    noTip = false,
    method = "post",
    onSendProgress,
    onReceiveProgress,
  }) async {
    Response response;
    try {
      var host = api.startsWith("http") ? api : getHostAddress() + api;
      response = await _dio.request(host,
          data: body,
          options: Options(method: method),
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress);
    } on DioError catch (e) {
      if (!noTip) MyToast.show(Config.ERROR_MSG);
      return null;
    }
    if (response.statusCode != null && response.statusCode! < 205) {
      return response.data;
    }
    if (!noTip) MyToast.show(Config.ERROR_MSG);
    return null;
  }
}
