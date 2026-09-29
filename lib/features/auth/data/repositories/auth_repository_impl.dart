import 'package:ecommerce_app/features/auth/domain/usecases/signup.dart';

import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';
import '../models/login_request_model.dart';
import '../models/login_response_model.dart';
import '../models/signup_request_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<LoginResponseModel> login(LoginRequestModel request) async {
    return await remoteDataSource.login(request);
  }

  @override
  Future<void> signup(SignupRequestModel request) async {
    await remoteDataSource.signup(request);
  }
}
