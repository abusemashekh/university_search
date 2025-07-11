import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'router.dart';

class UniversitySearchApp extends ConsumerWidget {
  const UniversitySearchApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'University Search',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true, appBarTheme: const AppBarTheme(backgroundColor: Colors.blue, foregroundColor: Colors.white, elevation: 2)),
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
