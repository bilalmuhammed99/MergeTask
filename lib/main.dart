import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/CacheHelper/cache_helper.dart';
import 'package:flutter_application_1/Core/utils/dependency_injection.dart';
import 'package:flutter_application_1/Features/Auth/data/repos/login_repository_implementation.dart';
import 'package:flutter_application_1/Features/Auth/presentation/views/login_view.dart';
import 'package:flutter_application_1/Features/Auth/presentation/views/manager/cubit/login_cubit.dart';
import 'package:flutter_application_1/Features/Home/data/respos/Home_repositroy_implementation.dart';
import 'package:flutter_application_1/Features/Home/presentation/views/home_view.dart';
import 'package:flutter_application_1/Features/Home/presentation/views/manager/HomeCubit/cubit/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencyInjection();
  await CacheHelper().initPrefs();
  runApp(DevicePreview(
    enabled: false,
    builder: (context) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              HomeCubit(getIt.get<HomeRepositoryImplementation>()),
        ),
        BlocProvider(
          create: (context) =>
              LoginCubit(getIt.get<LoginRepositoryImplementations>()),
        ),
      ],
      child: ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        designSize: const Size(360, 690),
        builder: (context, child) => MaterialApp(
          title: 'VStore',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            textTheme: GoogleFonts.poppinsTextTheme(),
            useMaterial3: true,
          ),
          home: const LoginView(),
        ),
      ),
    );
  }
}
