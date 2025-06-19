import 'package:equatable/equatable.dart';

abstract class OnboardingEvent extends Equatable {
  const OnboardingEvent();

  @override
  List<Object> get props => [];
}

class NextPageEvent extends OnboardingEvent {
  final int totalPages;

  const NextPageEvent(this.totalPages);

  @override
  List<Object> get props => [totalPages];
}

class UpdatePageEvent extends OnboardingEvent {
  final int page;

  const UpdatePageEvent(this.page);

  @override
  List<Object> get props => [page];
}
