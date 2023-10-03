import 'package:app/login_screen/loginstate.dart';
import 'package:app/register_screen/bloc/register_cubit.dart';
import 'package:app/register_screen/state/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var emailEditingcontroller = TextEditingController();
  var passwordEditingcontroller = TextEditingController();
  var confirmPasswordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 20, 235, 220),
        title: const Text(
          'Đăng Kí',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: BlocListener<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (state.error.isNotEmpty) {
              showDialog(
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
                            child: Text(
                              'Thông báo lỗi',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                      content: Text(
                        state.error,
                        style: const TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Ok',
                              style: TextStyle(color: Colors.black),
                            ))
                      ],
                    );
                  });
            } else if (state.isRegistrySuccess) {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Đăng ký thành công'),
                    content: const Text('Bạn đã đăng ký thành công.'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Future.delayed(const Duration(seconds: 1), () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) =>
                                    const LoginState(email: ''),
                              ),
                            );
                          });
                        },
                        child: const Text('Đóng'),
                      ),
                    ],
                  );
                },
              );
            }
          },
          child: Column(
            children: [
              SizedBox(
                height: 270,
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
                      top: 120,
                      left: 140,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          CircleAvatar(
                            radius: 60,
                            backgroundImage:
                                AssetImage('assets/offres/ofres/wishlist.png'),
                          )
                        ],
                      ))
                ]),
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
                      'Register your account',
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
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    TextField(
                      style: const TextStyle(color: Colors.black),
                      controller: emailEditingcontroller,
                      onChanged: (value) {
                        context.read<RegisterCubit>().langnghe(value, 'email');
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35),
                          ),
                          hintText: 'Nhập Tài Khoản',
                          hintStyle: const TextStyle(color: Colors.black38),
                          labelText: 'Email',
                          labelStyle: const TextStyle(color: Colors.black),
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
                        context
                            .read<RegisterCubit>()
                            .langnghe(value, 'password');
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
                          )),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextField(
                      style: const TextStyle(color: Colors.black),
                      controller: confirmPasswordTextController,
                      onChanged: (value) {
                        context
                            .read<RegisterCubit>()
                            .langnghe(value, 'confirmPassword');
                      },
                      decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.password_outlined,
                            color: Colors.deepOrangeAccent,
                          ),
                          hintText: 'Nhập lại Mật Khẩu',
                          hintStyle: const TextStyle(color: Colors.black38),
                          labelText: 'Nhập lại Mật Khẩu',
                          labelStyle: const TextStyle(color: Colors.black),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 1.0))),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              BlocBuilder<RegisterCubit, RegisterState>(
                  builder: (context, state) {
                return Opacity(
                  opacity: context.read<RegisterCubit>().state.isInputValid
                      ? 1.0
                      : 0.5,
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
                                side: MaterialStateProperty.all(
                                    const BorderSide(
                                        color: Colors.black12, width: 1.5)),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15))),
                                backgroundColor: const MaterialStatePropertyAll(
                                    Color.fromARGB(255, 228, 126, 160))),
                            onPressed:
                                context.read<RegisterCubit>().state.isInputValid
                                    ? () {
                                        context.read<RegisterCubit>().signUp();
                                      }
                                    : null,
                            child: const Text(
                              'Sign up',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ))),
                  ),
                );
              }),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                      text: TextSpan(
                          text: 'Already have an account?',
                          style: TextStyle(
                              color: Colors.grey[500], fontSize: 16))),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Login Now',
                      style: TextStyle(fontSize: 16, color: Colors.blue),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
