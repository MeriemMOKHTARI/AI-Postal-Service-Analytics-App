part of 'post_cubit.dart';

@immutable
sealed class PostState {}

final class PostInitial extends PostState {}

final class PostLoading extends PostState {}

final class PostSuccess extends PostState {
  PostSuccess({required this.postModel});
  final PostModel postModel;
}

final class PostFailure extends PostState {
  PostFailure({required this.errmessage});
  String errmessage;
}
