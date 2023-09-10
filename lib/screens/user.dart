import 'package:app/bloc/user_cubit.dart';
import 'package:app/bloc/user_data.dart';
import 'package:app/inner_screens/loginstate.dart';
import 'package:app/provider/dark_theme_provider.dart';
import 'package:app/services/utils.dart';
import 'package:app/widgets/text_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  User? _user;
  TextEditingController _textEditingController = TextEditingController();
  void signUserOut() async {
    await FirebaseAuth.instance.signOut();
    context.read<UserCubit>().logoutUser();
  }

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((user) {
      setState(() {
        _user = user;
      });
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme
        ? Color.fromARGB(255, 248, 248, 248)
        : Colors.black;
    final Utils utils = Utils(context);
    final size = utils.getscreenSize;
    return Scaffold(body: SingleChildScrollView(
      child: Container(child: BlocBuilder<UserCubit, UserData>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_user != null)
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 20, top: 13),
                      child: const CircleAvatar(
                        radius: 25,
                        backgroundImage:
                            AssetImage('assets/offres/ofres/wishlist.png'),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 13,
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Hello',
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                          ),
                          child: Text(
                            ' ${_user!.email}',
                            style: TextStyle(fontSize: 16, color: color),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              else
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Center(
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return LoginState();
                          }));
                        },
                        child: Text(
                          'Đăng Nhập',
                          style: TextStyle(
                              fontSize: 23,
                              color: themeState.getDarkTheme
                                  ? Colors.white
                                  : Colors.blue),
                        )),
                  ),
                ),
              const Divider(),
              _listTiles(
                  title: 'orders',
                  icon: IconlyLight.bag,
                  color: color,
                  onPressed: () {}),
              _listTiles(
                  title: 'wishlist',
                  icon: IconlyLight.heart,
                  color: color,
                  onPressed: () {}),
              _listTiles(
                  title: 'viewed',
                  icon: IconlyLight.show,
                  color: color,
                  onPressed: () {}),
              _listTiles(
                  title: 'password',
                  icon: IconlyLight.unlock,
                  color: color,
                  onPressed: () {}),
              Center(
                child: SwitchListTile(
                  title: TextWidget(
                      text:
                          themeState.getDarkTheme ? 'dark mode' : 'light mode',
                      color: color,
                      texSize: FontStyle.normal),
                  secondary: Icon(themeState.getDarkTheme
                      ? Icons.dark_mode_outlined
                      : Icons.light_mode_outlined),
                  onChanged: (value) {
                    themeState.setDarkTheme = value;
                  },
                  value: themeState.getDarkTheme,
                ),
              ),
              _listTiles(
                  title: 'log our',
                  icon: IconlyLight.logout,
                  color: color,
                  onPressed: () {
                    _showLogoutDialog();
                  }),
            ],
          );
        },
      )),
    ));
  }

  Future<void> _showLogoutDialog() async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Row(
              children: [
                Image.asset(
                  'assets/offres/ofres/warning-sign.png',
                  height: 20,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Center(
                  child: Text('Sign out'),
                )
              ],
            ),
            content: const Text('Do yoy wanna sign out'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: TextWidget(
                      text: 'cancel',
                      color: Colors.cyan,
                      texSize: FontStyle.italic)),
              TextButton(
                onPressed: () {
                  signUserOut();
                  Navigator.pop(context);
                },
                child: TextWidget(
                    text: 'ok', color: Colors.red, texSize: FontStyle.normal),
              )
            ],
          );
        });
  }

  Future<void> _showdialog() async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Update'),
            content: TextField(
              onChanged: (value) {
                _textEditingController.text = value;
                print(_textEditingController);
              },
              decoration: const InputDecoration(hintText: 'Your address'),
            ),
            actions: [TextButton(onPressed: () {}, child: const Text('save'))],
          );
        });
  }

  Widget _listTiles(
      {required String title,
      String? subtitle,
      required IconData icon,
      required Function onPressed,
      required Color color}) {
    return ListTile(
      title: TextWidget(text: title, color: color, texSize: FontStyle.italic),
      subtitle: TextWidget(
          text: subtitle ?? '', color: color, texSize: FontStyle.normal),
      leading: Icon(icon),
      trailing: const Icon(IconlyLight.arrowRight2),
      onTap: () {
        onPressed();
      },
    );
  }

  nameGoogle() async {
    if (_user != null) {
      return Text(
        'Đã đăng nhập với: ${_user!.email}',
        style: TextStyle(fontSize: 16),
      );
    } else {
      final themeState = Provider.of<DarkThemeProvider>(context);
      return Padding(
        padding: const EdgeInsets.all(5.0),
        child: Center(
          child: TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LoginState();
                }));
              },
              child: Text(
                'Đăng Nhập',
                style: TextStyle(
                    fontSize: 23,
                    color:
                        themeState.getDarkTheme ? Colors.white : Colors.blue),
              )),
        ),
      );
    }
  }
}
