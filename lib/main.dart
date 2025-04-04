import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:linkdin_app/constatns.dart';
import 'package:linkdin_app/core/models/comment_model.dart';
import 'package:linkdin_app/core/models/post_model.dart';
import 'package:linkdin_app/core/models/user_model.dart';
import 'package:linkdin_app/core/utils/app_colors.dart';
import 'package:linkdin_app/core/utils/app_router.dart';
import 'package:linkdin_app/features/post/presentation/view_model/post_cubit/post_cubit.dart';

void main() async {
  // Ensure Flutter is initialized

  // WidgetsFlutterBinding.ensureInitialized();

  // await Supabase.initialize(
  //   url:
  //       'https://tblqqhtfnprygahaueve.supabase.co', // or dotenv.env['SUPABASE_URL']!,
  //   anonKey:
  //       'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRibHFxaHRmbnByeWdhaGF1ZXZlIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDM3MTgzOTEsImV4cCI6MjA1OTI5NDM5MX0.gvubvU1LQbEoCq7LvN0FTZcLXkZM8KIOONoV1uwZS-o', // or dotenv.env['SUPABASE_ANON_KEY']!,
  //   debug: true, // Set to false in production
  // );

  // setup();
  await Hive.initFlutter();

  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(CommentModelAdapter());
  Hive.registerAdapter(PostModelAdapter());

  await Hive.openBox(kSettingsBox);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PostCubit()..getData(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        title: 'Linkedin Cloe',
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.grey12,
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
      ),
    );
  }
}
