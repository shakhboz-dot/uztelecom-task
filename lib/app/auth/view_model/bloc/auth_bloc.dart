import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uztelecom/app/auth/repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  AuthBloc(this._authRepository) : super(const _Initial()) {
    on<AuthEvent>(_onAuthEvent);
  }

  void _onAuthEvent(AuthEvent event, Emitter<AuthState> emit) async {
    await event.when(started: () async {
      emit(const AuthState.loading());
      try {
        await _authRepository.authorization();

        emit(const AuthState.success());
      } catch (e) {
        emit(const AuthState.error());
      }
    });
  }
}
