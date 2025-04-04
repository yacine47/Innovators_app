import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkdin_app/features/home/presentation/views/widgets/post_card_list_view.dart';
import 'package:linkdin_app/features/post/presentation/view_model/post_cubit/post_cubit.dart';

class ContributionViewBody extends StatelessWidget {
  const ContributionViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.of(context).size.height;
    return Column(
      children: [
        // SizedBox(height: h * .08),
        BlocBuilder<PostCubit, PostState>(
          builder: (context, state) {
            if (state is PostSuccess) {
              return PostCardListView(
                posts: state.posts,
              );
            }
            return SizedBox();
          },
        ),
      ],
    );
  }
}
