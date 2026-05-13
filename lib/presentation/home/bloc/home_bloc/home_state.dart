part of 'home_bloc.dart';

class HomeState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final List<Goal?>? activatedGoals;

  const HomeState({
    this.isLoading = false,
    this.errorMessage,
    this.activatedGoals,
  });


  HomeState copyWith({
    bool? isLoading,
    String? errorMessage,
    List<Goal?>? activatedGoals,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      activatedGoals: activatedGoals
    );
  }

  @override
  List<Object?> get props => [isLoading, errorMessage, activatedGoals];
}

