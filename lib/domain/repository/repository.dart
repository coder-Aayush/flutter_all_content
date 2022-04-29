import 'package:dartz/dartz.dart';
import 'package:flut_all_content/domain/model/model.dart';

import '../../data/network/failure.dart';
import '../../data/request/request.dart';

abstract class Repository {
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest);

  Future<Either<Failure, String>> forgotPassword(String email);

  Future<Either<Failure, Authentication>> register(
      RegisterRequest registerRequest);

  Future<Either<Failure, HomeObject>> fetchHomeDetails();

  Future<Either<Failure, SingleStoreDetail>> fetchSingleStoreDetails();
}
