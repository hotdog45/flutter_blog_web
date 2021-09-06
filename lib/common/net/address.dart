import 'package:my_blog/config/config.dart';

/// host1
const String BASE_URL_RELEASE = "http://go.oldck.com/"; //线上
const String BASE_URL_DEV = "http://127.0.0.1:3000/"; //开发

/// 网页h5
// const String BASE_URL_H5_RELEASE = "https://h5.xxxxxxx.com"; //线上
// const String BASE_URL_H5_DEV = "https://dev-h5.xxxxxxxxx.com"; //开发

var apiNum = "2";

/// Url
getHostAddress() {
  switch (apiNum) {
    case Config.KEY_API_HOST_RELEASE:
      return BASE_URL_RELEASE;
    case Config.KEY_API_HOST_DEV:
      return BASE_URL_DEV;
    default:
      return BASE_URL_RELEASE;
  }
}
