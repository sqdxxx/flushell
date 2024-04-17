import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';

class HttpConst{

  static String get apiBaseUrl {
    return "";
  }

  static String get apiPayUrl {
    return "";
  }
}

class Http {

  final DateTime _appStartTime = DateTime.now();

  static final Http _instance = Http._internal();
  factory Http() => _instance;

  late Dio dio;
  CancelToken cancelToken = CancelToken();

  Http._internal() {
    // BaseOptions、Options、RequestOptions 都可以配置参数，优先级别依次递增，且可以根据优先级别覆盖参数
    BaseOptions options = BaseOptions(
      // 请求基地址,可以包含子路径
      baseUrl: HttpConst.apiBaseUrl,

      // Http请求头.
      headers: {
        // 'authorization': User().token,
        'platform': Platform.isIOS ? 'ios' : 'android',
        // 'appId': Config().appId,
        "fromSystem": Platform.isIOS ? 'ios' : 'android', // android=2 ios=1
        // 'version': packageInfo.version,
        // 'channel': Config().channel
      },

      contentType: 'application/json; charset=utf-8',
      responseType: ResponseType.json,
    );

    dio = Dio(options);

    // 添加拦截器
    // dio.interceptors.add(TokenInterceptor());

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {

        print('>>>>>>>>>>>>>>>>>>>>');
        print('${options.method}: ${options.uri}');
        print("header: ${options.headers} || query: ${options.queryParameters}");
        print('body: ${options.data}');
        print('>>>>>>>>>>>>>>>>>>>>');

        return handler.next(options); //continue
        // 如果你想完成请求并返回一些自定义数据，你可以resolve一个Response对象 `handler.resolve(response)`。
        // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义response.
        //
        // 如果你想终止请求并触发一个错误,你可以返回一个`DioError`对象,如`handler.reject(error)`，
        // 这样请求将被中止并触发异常，上层catchError会被调用。
      },
      onResponse: (response, handler) {
        print('<<<<<<<<<<<<<<<<<<<<');
        print(response.data);
        print('<<<<<<<<<<<<<<<<<<<<');


        if (response.data["code"] != null) {
          var code = response.data['code'] as int;

          if (code < 0) {
            var msg = response.data['msg'] as String;
            // Toast.error(msg: msg);
            // Hud.error(msg: msg);
          }
        }

        return handler.next(response); // continue
        // 如果你想终止请求并触发一个错误,你可以 reject 一个`DioError`对象,如`handler.reject(error)`，
        // 这样请求将被中止并触发异常，上层catchError会被调用。
      },
      onError: (e, handler) {
        print('<<<<<<<<<<<<<<<<<<<<');
        print('error: $e');
        print('<<<<<<<<<<<<<<<<<<<<');

        // token失效，清空下次重新登录
        if (e.response?.statusCode == 401) {
          // User.instance.clear();
          // Hud.error(msg: "登录过期");
        } else {
          // issue: 应用第一次启动和刚刚开机启动app。网络是不可用的。
          if (DateTime.now().difference(_appStartTime).inSeconds > 7) {
            // Hud.error(msg: "网络连接失败");
          }
        }

        return handler.next(e); //continue
        // 如果你想完成请求并返回一些自定义数据，可以resolve 一个`Response`,如`handler.resolve(response)`。
        // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义response.
      },
    ));
  }

  /*
   * 取消请求
   *
   * 同一个cancel token 可以用于多个请求，当一个cancel token取消时，所有使用该cancel token的请求都会被取消。
   * 所以参数可选
   */
  void cancelRequests(CancelToken token) {
    token.cancel("cancelled");
  }

  /// 读取本地配置
  Map<String, dynamic>? getAuthorizationHeader() {
    var headers = <String, dynamic>{};
    headers['authorization'] = token;
    return headers;
  }

  String get token {
    return "";
    // return sharedPreferences.getString("authorization") ?? "none";
  }

  set token(String value) {
    // sharedPreferences.setString("authorization", value);
  }


  /// restful get 操作
  /// refresh 是否下拉刷新 默认 false
  /// noCache 是否不缓存 默认 true
  /// list 是否列表 默认 false
  /// cacheKey 缓存key
  /// cacheDisk 是否磁盘缓存
  Future get(
      String path, {
        Map<String, dynamic>? queryParameters,
        Options? options,
        bool refresh = false,
        bool noCache = true,
        bool list = false,
        String cacheKey = '',
        bool cacheDisk = false,
      }) async {
    Options requestOptions = options ?? Options();

    requestOptions.headers = requestOptions.headers ?? {};

    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }

    // await dio.get(path, )
    var response = await dio.get(
      path,
      queryParameters: queryParameters,
      options: requestOptions,
      cancelToken: cancelToken,
    );

    return response.data;
  }

  /// restful post 操作
  Future post(
      String path, {
        dynamic body,
        Map<String, dynamic>? queryParameters,
        Options? options,
      }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = getAuthorizationHeader();

    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }

    var response = await dio.post(
      path,
      data: body,
      queryParameters: queryParameters,
      options: requestOptions,
      cancelToken: cancelToken,
    );

    return response.data;
  }
}

// 异常处理
class ErrorEntity implements Exception {
  int code = -1;
  String message = "";

  ErrorEntity({required this.code, required this.message});

  @override
  String toString() {
    if (message == "") return "Exception";
    return "Exception: code $code, $message";
  }
}