import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'core/widgets/bottom_nav_bar/nav_provider.dart';
import 'features/home/presentation/providers/balance_provider.dart';
import 'features/home/presentation/providers/transaction_provider.dart';
import 'features/splash/presentation/provider/splash_provider.dart';
import 'features/statistics/data/datasources/statistics_local_data_source.dart';
import 'features/statistics/data/repositories/statistics_repository_impl.dart';
import 'features/statistics/domain/usecases/get_statistics_use_case.dart';
import 'features/statistics/presentation/providers/statistics_provider.dart';
import 'routes/app_routes.dart';

void main() {
  final localDataSource = StatisticsLocalDataSource();
  final repository = StatisticsRepositoryImpl(localDataSource);
  final usecase = GetStatisticsUseCase(repository);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashProvider()),
        ChangeNotifierProvider(create: (_) => BalanceProvider()),
        ChangeNotifierProvider(create: (_) => TransactionProvider()),
        ChangeNotifierProvider(create: (_) => NavProvider()),
        ChangeNotifierProvider(
          create: (_) => StatisticsProvider(usecase)..loadTransactions(),
        ),
      ],
      child: const Myapp(),
    ),
  );
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(420, 890), // iPhone X reference size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.splash,
          routes: AppRoutes.routes,
          // theme: ThemeData(primaryColor: Color(0xFFD32F2F)),
        );
      },
    );
  }
}
