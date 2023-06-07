import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:think_ias/app/routes/app.routes.dart';
import 'package:think_ias/core/Provider/authentication.provider.dart';

import 'core/Provider/lists.providers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthenticationProvider>(
            create: (context) => AuthenticationProvider()),
        ChangeNotifierProvider<ListOfDataProvider>(
          create: (context) => ListOfDataProvider(),
        )
      ],
      child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              initialRoute: AppRouter.splashRoute,
              onGenerateRoute: AppRouter.generateRoute,
              theme: ThemeData(
                useMaterial3: true,
              ),
            );
          }),
    );
  }
}
