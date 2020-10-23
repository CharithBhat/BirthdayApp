import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/birthday_list_model.dart';
import 'package:todo_app/providers/item_list.dart';
import 'package:todo_app/widgets/wrapper.dart';
import 'models/user_man.dart';
import 'utilities/app_theme.dart';
import 'providers/app_state_notifier.dart';
import 'authentication/authentication.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AppStateNotifier>(
          create: (context) => AppStateNotifier(), 
        ),
        StreamProvider<User>.value(value: user),
        ChangeNotifierProvider<BirthdayList>(
          create: (context) => BirthdayList(),
        ),
        ChangeNotifierProvider<ItemList>(
          create: (context) => ItemList(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

//this is my app
// again this is a test

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateNotifier>(
      builder: (context, appState, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Todo App',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: appState.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
          home: Wrapper(),
        );
      },
    );
  }
}
