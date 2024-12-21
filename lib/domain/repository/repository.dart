import 'package:dartz/dartz.dart';
import 'package:daily_flow/data/network/failure.dart';
import 'package:daily_flow/data/network/requests.dart';
import 'package:daily_flow/domain/model/login/login_model.dart';

abstract class Repository {
  Future<Either<Failure, LoginModel>> login(LoginRequest loginRequest);
}
