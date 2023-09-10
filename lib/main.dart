import 'package:app/bloc/cart_cubit.dart';
import 'package:app/bloc/user_cubit.dart';
import 'package:app/consts/theme_data.dart';
import 'package:app/inner_screens/loginstate.dart';
import 'package:app/provider/dark_theme_provider.dart';
import 'package:app/screens/btm_bar.dart';
import 'package:app/screens/home_screens/browse_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'inner_screens/sale_view_all.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.setDarkTheme =
        await themeChangeProvider.darkThemePrefs.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return themeChangeProvider;
        }),
        BlocProvider<UserCubit>(
          create: (context) => UserCubit(),
        ),
        BlocProvider<CartCubit>(
          create: (context) => CartCubit(),
        ),
      ],
      child: Consumer<DarkThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: Styles.themeData(themeProvider.getDarkTheme, context),
            home: Consumer<UserCubit>(
              builder: (context, userCubit, child) {
                if (userCubit.isUserLoggedIn) {
                  return BottomBarScreen();
                } else {
                  return LoginState();
                }
              },
            ),
            routes: {
              SaleViewAll.RouteName: (context) => const SaleViewAll(),
              FeedScreens.routeName: (context) => const FeedScreens()
            },
          );
        },
      ),
    );
  }
}
