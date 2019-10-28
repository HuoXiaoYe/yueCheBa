// 获取数据方法的封装
import 'dart:io';
import "package:dio/dio.dart";
Future request(url, {formData}) async {
  Response response;
  Dio dio = new Dio();
  dio.options.contentType =
      ContentType.parse("application/x-www-form-urlencoded");
  if (formData == null) {
    response = await dio.post(url);
  } else {
    response = await dio.post(url, data: formData);
  }
  if (response.statusCode == 200) {
    return response.data;
  } else {
    print("获取数据失败");
  }
}
