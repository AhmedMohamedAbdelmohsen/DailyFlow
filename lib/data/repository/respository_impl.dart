import 'package:daily_flow/data/mapper/task/task_mapper.dart';
import 'package:daily_flow/data/responses/task/task_response.dart';
import 'package:daily_flow/domain/model/task/task_model.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:daily_flow/data/data_source/remote_data_source.dart';
import 'package:daily_flow/data/mapper/login/login_mapper.dart';
import 'package:daily_flow/data/network/error_handler.dart';
import 'package:daily_flow/data/network/failure.dart';
import 'package:daily_flow/data/network/network_info.dart';
import 'package:daily_flow/data/network/requests.dart';
import 'package:daily_flow/domain/model/login/login_model.dart';
import 'package:daily_flow/domain/repository/repository.dart';
import 'package:daily_flow/generated/locale_keys.g.dart';

class RepositoryImpl extends Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  RepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, LoginModel>> login(LoginRequest loginRequest) async {
    if (await _networkInfo.isConnect) {
      try {
        // its connected to internet, its safe to call API
        final response = await _remoteDataSource.login(loginRequest);
        if (response.id != 0) {
          // success return data
          return Right(response.toDomain());
        } else {
          // failure --return business error
          return Left(Failure(ResponseCode.UNAUTHORIZED,
              response.message ?? LocaleKeys.UNAUTHORIZED.tr()));
        }
      } catch (error) {
        return Left(
            Failure(ResponseCode.UNAUTHORIZED, LocaleKeys.loginError.tr()));
      }
    } else {
      // return connection error
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, TaskModel>> addTask(
      int id, TaskResponse request) async {
    if (await _networkInfo.isConnect) {
      try {
        // its connected to internet, its safe to call API
        final response = await _remoteDataSource.addTask(id, request);
        if (response.userId != 0) {
          // success return data
          return Right(response.toDomain());
        } else {
          // failure --return business error
          return Left(Failure(ResponseCode.BAD_REQUEST,
              response.message ?? LocaleKeys.BAD_REQUEST.tr()));
        }
      } catch (error) {
        return Left(
            Failure(ResponseCode.UNAUTHORIZED, LocaleKeys.loginError.tr()));
      }
    } else {
      // return connection error
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<TaskModel>>> getAllTasks(int id) async {
    if (await _networkInfo.isConnect) {
      try {
        // its connected to internet, its safe to call API
        final response = await _remoteDataSource.getAllTasks(id);
        if (response.isNotEmpty) {
          // success return data
          return Right((response.map((data) => data.toDomain()))
              .cast<TaskModel>()
              .toList());
        } else {
          // failure --return business error
          return Left(
              Failure(ResponseCode.NOT_FOUND, LocaleKeys.NOT_FOUND.tr()));
        }
      } catch (error) {
        return Left(
            Failure(ResponseCode.UNAUTHORIZED, LocaleKeys.loginError.tr()));
      }
    } else {
      // return connection error
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
