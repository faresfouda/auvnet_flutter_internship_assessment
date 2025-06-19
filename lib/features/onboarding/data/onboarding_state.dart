import 'package:equatable/equatable.dart';

class OnboardingState extends Equatable {
  final int currentPage;
  final bool isFinished;

  const OnboardingState({
    required this.currentPage,
    this.isFinished = false,
  });

  OnboardingState copyWith({
    int? currentPage,
    bool? isFinished,
  }) {
    return OnboardingState(
      currentPage: currentPage ?? this.currentPage,
      isFinished: isFinished ?? this.isFinished,
    );
  }

  @override
  List<Object> get props => [currentPage, isFinished];
}
