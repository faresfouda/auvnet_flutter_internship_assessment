import 'package:flutter_bloc/flutter_bloc.dart';
import 'onboarding_event.dart';
import 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(const OnboardingState(currentPage: 0)) {
    on<NextPageEvent>((event, emit) {
      if (state.currentPage < event.totalPages - 1) {
        emit(state.copyWith(currentPage: state.currentPage + 1));
      } else {
        emit(state.copyWith(isFinished: true));
      }
    });

    on<UpdatePageEvent>((event, emit) {
      emit(state.copyWith(currentPage: event.page));
    });
  }
}
