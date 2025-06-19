import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// Events
abstract class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object?> get props => [];
}

class SignupSubmitted extends SignupEvent {
  final String email;
  final String password;

  const SignupSubmitted({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

/// States
abstract class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object?> get props => [];
}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupSuccess extends SignupState {}

class SignupFailure extends SignupState {
  final String message;

  const SignupFailure(this.message);

  @override
  List<Object?> get props => [message];
}

/// Bloc
class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final FirebaseAuth _auth;

  SignupBloc(this._auth) : super(SignupInitial()) {
    on<SignupSubmitted>(_onSignupSubmitted);
  }

  Future<void> _onSignupSubmitted(
      SignupSubmitted event,
      Emitter<SignupState> emit,
      ) async {
    emit(SignupLoading());
    try {
      await _auth.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      emit(SignupSuccess());
    } on FirebaseAuthException catch (e) {
      emit(SignupFailure(_getErrorMessage(e)));
    }
  }

  String _getErrorMessage(FirebaseAuthException e) {
    switch (e.code) {
      case 'email-already-in-use':
        return 'Email is already in use.';
      case 'invalid-email':
        return 'Invalid email address.';
      case 'weak-password':
        return 'Password should be at least 6 characters.';
      default:
        return 'An error occurred. Please try again.';
    }
  }
}
