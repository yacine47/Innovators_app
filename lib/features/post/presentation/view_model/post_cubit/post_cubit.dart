import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:linkdin_app/constatns.dart';
import 'package:linkdin_app/core/models/post_model.dart';
import 'package:meta/meta.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostInitial());

  void getData() {
    emit(PostLoading());

    emit(PostSuccess(Hive.box<PostModel>(kPostsBox).values.toList()));
  }
}
