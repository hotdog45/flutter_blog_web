/*
 * @Author: your name
 * @Date: 2020-12-08 20:57:12
 * @LastEditTime: 2020-12-11 01:38:08
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /todo/lib/utils/dependency_injection.dart
 */

import 'package:get/get.dart';
import 'package:my_blog/common/net/http_manager.dart';

/// 依赖注入
class DenpendencyInjection {
  static Future<void> init() async {

    //  网络请求
    Get.put(HttpManager());


  }
}
