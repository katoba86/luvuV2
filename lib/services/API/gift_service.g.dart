// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gift_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _GiftService implements GiftService {
  _GiftService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://luvu.ngrok.io/api';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<Gift>> getGiftList() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(_setStreamType<List<Gift>>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, '/gift/list',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => Gift.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<Gift> updateGift(id, gift, {file}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry('gift', gift));
    if (file != null) {
      _data.files.add(MapEntry(
          'file',
          MultipartFile.fromFileSync(file.path,
              filename: file.path.split(Platform.pathSeparator).last)));
    }
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<Gift>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, '/gift/update/$id',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Gift.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Gift> addGift(gift, {file}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry('gift', jsonEncode(gift)));
    if (file != null) {
      _data.files.add(MapEntry(
          'file',
          MultipartFile.fromFileSync(file.path,
              filename: file.path.split(Platform.pathSeparator).last)));
    }
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<Gift>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, '/gift/add',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Gift.fromJson(_result.data!);
    return value;
  }

  @override
  Future<void> delete(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    await _dio.fetch<void>(_setStreamType<void>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, '/gift/remove/$id',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    return null;
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
