import 'package:college_cupid/routing/app_router.dart';
import 'package:college_cupid/shared/colors.dart';
import 'package:college_cupid/stores/blocked_users_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as riverpod;
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(
    const riverpod.ProviderScope(
      child: CollegeCupidApp(),
    ),
  );
}

final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

class CollegeCupidApp extends StatelessWidget {
  const CollegeCupidApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<BlockedUsersStore>(create: (_) => BlockedUsersStore()),
      ],
      child: MaterialApp.router(
        title: 'CollegeCupid',
        debugShowCheckedModeBanner: false,
        scaffoldMessengerKey: rootScaffoldMessengerKey,
        theme: ThemeData(
          textSelectionTheme: TextSelectionThemeData(
            selectionHandleColor: CupidColors.titleColor,
            cursorColor: CupidColors.secondaryColor,
            selectionColor: CupidColors.secondaryColor.withValues(alpha: 0.75),
          ),
        ),
        routerConfig: goRouter,
      ),
    );
  }
}
