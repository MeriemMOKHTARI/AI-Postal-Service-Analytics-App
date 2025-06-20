import 'package:bloc/bloc.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/api/api_consumer.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/api/end_ponits.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/errors/exceptions.dart';
import 'package:happy_tech_mastering_api_with_flutter/data/models/empModel.dart';
import 'package:meta/meta.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit(this.api) : super(PostInitial());
  final ApiConsumer api;
  Future<void> getPosts(String qrid) async {
    emit(PostLoading());
    try {
      final response = await api.get(
        "${EndPoint.posts}$qrid/",
      );
      print(response);
      print(
          '/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////');
      final post = PostModel.fromJson(response);
      print('hhh');
      print(post);
      emit(PostSuccess(postModel: post));
    } on ServerException catch (e) {
      emit(PostFailure(errmessage: e.errModel.errorMessage));
    }
  }

  Future<void> submit(String qrCode, int rating, String conternt) async {
    emit(PostLoading());
    try {
      final response = await api.post("${EndPoint.posts}qr-feedback/",
          data: {"Qr_code": qrCode, "Rating": rating, "Content": conternt});
      print(response);
      print(
          '/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////');
      final post = PostModel.fromJson(response);

      print(post);
      emit(PostSuccess(postModel: post));
    } on ServerException catch (e) {
      emit(PostFailure(errmessage: e.errModel.errorMessage));
    }
  }
}
