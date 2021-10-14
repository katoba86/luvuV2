// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ListService implements ListService {
  _ListService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://luvu.ngrok.io/api';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<Lists>> getLists() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(_setStreamType<List<Lists>>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, '/group/list',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => Lists.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<Lists> addGroup(list) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(list.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Lists>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/group/add',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Lists.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
