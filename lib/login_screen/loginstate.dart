import 'package:app/register_screen/register_page.dart';
import 'package:app/login_screen/bloc/login_cubit.dart';
import 'package:app/login_screen/state/login_State.dart';
import 'package:app/services/utils.dart';
import 'package:app/login_screen/widget/login_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginState extends StatefulWidget {
  const LoginState({super.key, required email});

  @override
  State<LoginState> createState() => _LoginStateState();
}

class _LoginStateState extends State<LoginState> {
  late String errorText = '';
  var emailEditingcontroller = TextEditingController();
  var passwordEditingcontroller = TextEditingController();
  bool isInputValid = false;
  @override
  Widget build(BuildContext context) {
    Utils utils = Utils(context);
    Color color = utils.color;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color.fromARGB(255, 20, 235, 220),
          title: const Text(
            'Đăng Nhập',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        backgroundColor: Colors.white,
        body: BlocBuilder<LoginCubit, LoginStates?>(builder: (context, state) {
          if (state != null && state.error != null) {
            errorText = state.error!;
          } else {
            errorText = '';
          }
          return Column(
            children: [
              Container(
                height: 300,
                width: 430,
                child: Stack(fit: StackFit.loose, children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    child: Image.asset(
                        'assets/offres/ofres/thuc-pham-huu-co-la-gi-loi-ich-va-cach-nhan-biet--3.jpg'),
                  ),
                  const Positioned(
                      top: 130,
                      left: 140,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          CircleAvatar(
                            radius: 70,
                            backgroundImage:
                                AssetImage('assets/offres/ofres/wishlist.png'),
                          )
                        ],
                      ))
                ]),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.only(left: 15, top: 5),
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Hello',
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      'Sign into your account',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[500]),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.only(left: 15, right: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                ),
                child: Column(
                  children: [
                    TextField(
                      style: const TextStyle(color: Colors.black),
                      controller: emailEditingcontroller,
                      onChanged: (value) {
                        setState(() {
                          isInputValid =
                              emailEditingcontroller.text.isNotEmpty &&
                                  passwordEditingcontroller.text.isNotEmpty;
                        });
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 1.0)),
                          hintText: 'Nhập Tài Khoản',
                          hintStyle: TextStyle(color: Colors.black38),
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Colors.black),
                          prefixIcon: const Icon(
                            Icons.email,
                            color: Colors.deepOrangeAccent,
                          )),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextField(
                      style: const TextStyle(color: Colors.black),
                      controller: passwordEditingcontroller,
                      onChanged: (value) {
                        setState(() {
                          isInputValid =
                              emailEditingcontroller.text.isNotEmpty &&
                                  passwordEditingcontroller.text.isNotEmpty;
                        });
                      },
                      decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.password_outlined,
                            color: Colors.deepOrangeAccent,
                          ),
                          hintText: 'Nhập Mật Khẩu',
                          hintStyle: const TextStyle(color: Colors.black38),
                          labelText: 'Mật Khẩu',
                          labelStyle: const TextStyle(color: Colors.black),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 1.0))),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return RegisterPage();
                              }));
                            },
                            child: const Text(
                              'Create Account',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.blue),
                            )),
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Forgot your PassWord?',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black45),
                            ))
                      ],
                    ),
                    Text(
                      errorText,
                      style: const TextStyle(
                        color: Colors.red,
                      ),
                    )
                  ],
                ),
              ),
              Opacity(
                opacity: isInputValid ? 1.0 : 0.5,
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(35)),
                  child: Center(
                      child: ElevatedButton(
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.only(
                                      left: 30,
                                      right: 30,
                                      top: 10,
                                      bottom: 10)),
                              side: MaterialStateProperty.all(const BorderSide(
                                  color: Colors.black12, width: 1.5)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15))),
                              backgroundColor: const MaterialStatePropertyAll(
                                  Color.fromARGB(255, 228, 126, 160))),
                          onPressed: isInputValid
                              ? () {
                                  context.read<LoginCubit>().signIn(
                                        emailEditingcontroller.text,
                                        passwordEditingcontroller.text,
                                      );
                                }
                              : null,
                          child: const Text(
                            'Sign in',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ))),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              RichText(
                  text: TextSpan(
                      text: 'Sign up using one of the following methods',
                      style: TextStyle(color: Colors.grey[500], fontSize: 16))),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GoogleState(
                    images: const ['assets/offres/ofres/google.png'],
                    onPressed: () {},
                  ),
                  GoogleState(images: const [
                    'assets/offres/ofres/Facebook_Logo_(2019).png'
                  ], onPressed: () {})
                ],
              )
            ],
          );
        }));
  }
}
