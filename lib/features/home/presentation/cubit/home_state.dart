part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final List<PostEntity> posts;

  const HomeSuccess({required this.posts});
}

class HomeFailure extends HomeState {
  final String errorMessage;

  const HomeFailure({required this.errorMessage});
}

class GetNewPostsLoading extends HomeState {}

class GetNewPostsSuccess extends HomeState {}

class GetNewPostsFailure extends HomeState {
  final String errorMessage;

  const GetNewPostsFailure({required this.errorMessage});
}

class CreatePostSuccess extends HomeState {}

class LikeOrUnlikePostSuccess extends HomeState {}

class LikeOrUnlikePostLoading extends HomeState {}

class LikeOrUnlikePostFailure extends HomeState {
  final String errorMessage;

  const LikeOrUnlikePostFailure({required this.errorMessage});
}
