import 'package:app/login_screen/loginstate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  User? _user;
  var emailEditingcontroller = TextEditingController();
  var passwordEditingcontroller = TextEditingController();
  var confirmPasswordTextController = TextEditingController();
  RegisterPage registerPage = RegisterPage();

  void updateCurrentUser() {
    setState(() {
      _user = FirebaseAuth.instance.currentUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    void signUp() async {
      final email = emailEditingcontroller.text;
      final password = passwordEditingcontroller.text;
      final confirmPassword = confirmPasswordTextController.text;

      if (password != confirmPassword) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text(
                'Lỗi đăng ký',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
              content: const Text('Mật khẩu không khớp. Vui lòng thử lại.',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  )),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Đóng'),
                ),
              ],
            );
          },
        );
      } else if (password.length < 6) {
        {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text(
                  'Lỗi đăng ký',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                content: const Text(
                  'Mật khẩu phải có ít nhất 6 ký tự.',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Đóng'),
                  ),
                ],
              );
            },
          );
        }
      } else {
        try {
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailEditingcontroller.text,
            password: passwordEditingcontroller.text,
          );
          try {
            await FirebaseAuth.instance.signOut();
          } catch (error) {
            print('Lỗi đăng xuất: $error');
          }

          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return LoginState(
              email: '',
            );
          }));
        } catch (error) {
          if (error is FirebaseAuthException) {
            if (error.code == 'email-already-in-use') {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text(
                      'Lỗi đăng ký',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    content: const Text(
                      'Tài khoản đã tồn tại. Vui lòng sử dụng tài khoản khác.',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Đóng'),
                      ),
                    ],
                  );
                },
              );
            } else {
              print('Lỗi đăng ký: $error');
            }
          }
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 20, 235, 220),
        title: const Text(
          'Đăng Kí',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
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
                  onChanged: (value) {},
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35),
                      ),
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
                  onChanged: (value) {},
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
                  onChanged: (value) {},
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
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(35)),
            child: Center(
                child: ElevatedButton(
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.only(
                                left: 30, right: 30, top: 10, bottom: 10)),
                        side: MaterialStateProperty.all(const BorderSide(
                            color: Colors.black12, width: 1.5)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                        backgroundColor: const MaterialStatePropertyAll(
                            Color.fromARGB(255, 228, 126, 160))),
                    onPressed: () {
                      signUp();
                    },
                    child: const Text(
                      'Sign up',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ))),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                  text: TextSpan(
                      text: 'Already have an account?',
                      style: TextStyle(color: Colors.grey[500], fontSize: 16))),
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
    );
  }
}
