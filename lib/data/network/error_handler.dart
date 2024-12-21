import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:daily_flow/data/network/failure.dart';
import 'package:daily_flow/generated/locale_keys.g.dart';

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioError) {
      // dio error so its an error  from response of the API or from dio itself
      failure = _handleError(error);
    } else {
      // default error
      failure = DataSource.DEFAULT.getFailure();
    }
  }
}

Failure _handleError(DioError error) {
  switch (error.type) {
    case DioErrorType.connectTimeout:
      return DataSource.CONNECT_TIMEOUT.getFailure();
    case DioErrorType.sendTimeout:
      return DataSource.SEND_TIMEOUT.getFailure();

    case DioErrorType.receiveTimeout:
      return DataSource.RECIEVE_TIMEOUT.getFailure();

    case DioErrorType.response:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return Failure(error.response?.statusCode ?? 0,
            error.response?.statusMessage ?? "");
      } else {
        return DataSource.DEFAULT.getFailure();
      }
    case DioErrorType.cancel:
      return DataSource.CANCEL.getFailure();

    case DioErrorType.other:
      return DataSource.DEFAULT.getFailure();
  }
}

enum DataSource {
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTHORIZED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECIEVE_TIMEOUT,
  SEND_TIMEOUT,
  CASHE_ERROR,
  NO_INTERNET_CONNECTION,
  EMPTY_LIST,
  DEFAULT
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.SUCCESS:
        return Failure(ResponseCode.SUCCESS, LocaleKeys.SUCCESS.tr());
      case DataSource.NO_CONTENT:
        return Failure(ResponseCode.NO_CONTENT, LocaleKeys.NO_CONTENT.tr());
      case DataSource.BAD_REQUEST:
        return Failure(ResponseCode.BAD_REQUEST, LocaleKeys.BAD_REQUEST.tr());
      case DataSource.FORBIDDEN:
        return Failure(ResponseCode.FORBIDDEN, LocaleKeys.FORBIDDEN.tr());
      case DataSource.UNAUTHORIZED:
        return Failure(ResponseCode.UNAUTHORIZED, LocaleKeys.UNAUTHORIZED.tr());
      case DataSource.NOT_FOUND:
        return Failure(ResponseCode.NOT_FOUND, LocaleKeys.NOT_FOUND.tr());
      case DataSource.INTERNAL_SERVER_ERROR:
        return Failure(ResponseCode.INTERNAL_SERVER_ERROR,
            LocaleKeys.INTERNAL_SERVER_ERROR.tr());
      case DataSource.CONNECT_TIMEOUT:
        return Failure(
            ResponseCode.CONNECT_TIMEOUT, LocaleKeys.CONNECT_TIMEOUT.tr());
      case DataSource.CANCEL:
        return Failure(ResponseCode.CANCEL, LocaleKeys.CANCEL.tr());
      case DataSource.RECIEVE_TIMEOUT:
        return Failure(
            ResponseCode.RECIEVE_TIMEOUT, LocaleKeys.RECEIVE_TIMEOUT.tr());
      case DataSource.SEND_TIMEOUT:
        return Failure(ResponseCode.SEND_TIMEOUT, LocaleKeys.SEND_TIMEOUT.tr());
      case DataSource.CASHE_ERROR:
        return Failure(ResponseCode.CASHE_ERROR, LocaleKeys.CASHE_ERROR.tr());
      case DataSource.NO_INTERNET_CONNECTION:
        return Failure(ResponseCode.NO_INTERNET_CONNECTION,
            LocaleKeys.NO_INTERNET_CONNECTION.tr());
      case DataSource.DEFAULT:
        return Failure(ResponseCode.DEFAULT, LocaleKeys.DEFAULT.tr());
      case DataSource.EMPTY_LIST:
        return Failure(ResponseCode.EMPTY_LIST, LocaleKeys.EMPTY_LIST.tr());
    }
  }
}

class ResponseCode {
  static const int SUCCESS = 200; // success with data
  static const int NO_CONTENT = 201; // success with no data (no content)
  static const int BAD_REQUEST = 200; // failure, API rejected request
  static const int FORBIDDEN = 403; // failure, API rejected request
  static const int UNAUTHORIZED = 401; // failure, user is not authorized
  static const int NOT_FOUND = 404; // failure, API rejected request
  static const int INTERNAL_SERVER_ERROR = 500; // failure, crash in server side

  // local status code
  static const int CONNECT_TIMEOUT = -1;
  static const int CANCEL = -2;
  static const int RECIEVE_TIMEOUT = -3;
  static const int SEND_TIMEOUT = -4;
  static const int CASHE_ERROR = -5;
  static const int NO_INTERNET_CONNECTION = -6;
  static const int DEFAULT = -7;
  static const int EMPTY_LIST = 0;
}