import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:linkdin_app/core/utils/service_locator.dart';
import 'package:linkdin_app/features/auth/data/repo/auth_repo_impl.dart';
import 'package:linkdin_app/features/auth/presentation/view_models/login_cubit/login_cubit.dart';
import 'package:linkdin_app/features/splash/presentation/views/splash_view.dart';
import 'package:linkdin_app/features/views/introduction_view.dart';
import 'package:linkdin_app/features/donate/presentation/views/donate_view.dart';
import 'package:linkdin_app/features/home/presentation/views/home_view.dart';
import 'package:linkdin_app/features/payment/presentation/views/payment_view.dart';
import 'package:linkdin_app/features/post/presentation/views/add_post_view.dart';
import 'package:linkdin_app/features/auth/presentation/views/login_view.dart';
import 'package:linkdin_app/features/auth/presentation/views/sign_up_view.dart';

abstract class AppRouter {
  static final router = GoRouter(
    initialLocation: SplashView.path,
    routes: [
      GoRoute(
        path: SplashView.path,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: HomeView.path,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: AddPostView.path,
        builder: (context, state) => const AddPostView(),
      ),
      GoRoute(
        path: IntroductionView.path,
        builder: (context, state) => const IntroductionView(),
      ),
      GoRoute(
        path: LoginView.path,
        builder: (context, state) => BlocProvider(
          create: (context) => LoginCubit(),
          child: const LoginView(),
        ),
      ),
      GoRoute(
        path: SignUpView.path,
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: DonateView.path,
        builder: (context, state) => const DonateView(),
      ),
      GoRoute(
        path: PaymentView.path,
        builder: (context, state) => const PaymentView(),
      ),
    ],
  );
}
