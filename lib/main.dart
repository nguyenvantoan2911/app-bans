import 'package:app/cart/bloc/cart_cubit.dart';
import 'package:app/login_screen/bloc/login_cubit.dart';
import 'package:app/register_screen/bloc/register_cubit.dart';
import 'package:app/register_screen/register_page.dart';
import 'package:app/services/theme_data.dart';
import 'package:app/login_screen/loginstate.dart';
import 'package:app/provider/dark_theme_provider.dart';
import 'package:app/screens/btm_bar.dart';
import 'package:app/browse_screen/browse_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
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
        BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(),
        ),
        BlocProvider<RegisterCubit>(create: (context) => RegisterCubit()),
        BlocProvider<CartCubit>(
          create: (context) => CartCubit(),
        ),
      ],
      child: Consumer<DarkThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: Styles.themeData(themeProvider.getDarkTheme, context),
            home: Consumer<LoginCubit>(
              builder: (context, loginCubit, child) {
                if (loginCubit.isUserLoggedIn) {
                  return const BottomBarScreen();
                } else {
                  return const LoginState(
                    email: '',
                  );
                }
              },
              child: const RegisterPage(),
            ),
            routes: {FeedScreens.routeName: (context) => const FeedScreens()},
          );
        },
      ),
    );
  }
}
