import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Giriş Ekranı',
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/flutter-banner.png', // Resim dosya yolu
                    width: 200, // Resim genişliği
                    height: 100, // Resim yüksekliği
                  ),
                  const SizedBox(width: 30.0),
                  const Text(
                    '',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ],
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      // 'Forgot Password?' tıklandığında yapılacak işlemler
                      print('Forgot Password?');
                    },
                    child: const Text('Forgot Password?'),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Giriş butonuna tıklandığında yapılacak işlemler
                    String username = _emailController.text;
                    String password = _passwordController.text;

                    // Boşluk kontrolü
                    if (username.trim().isEmpty || password.trim().isEmpty) {
                      _showSnackBar(context, 'Kullanıcı adı ve şifre boş bırakılamaz.');
                      return;
                    }

                    // Kullanıcı adı ve şifre kontrolü burada yapılabilir

                    // Örnek: Basit bir kontrol - Kullanıcı adı ve şifre boş olmamalı
                    if (username.isNotEmpty && password.isNotEmpty) {
                      // Giriş başarılı, işlemleri burada yapabilirsiniz
                      _showSnackBar(context, 'Giriş Başarılı \n Email: $username');
                    } else {
                      // Giriş başarısız mesajı veya işlemleri burada yapabilirsiniz
                      _showSnackBar(context, 'Giriş Başarısız');
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 85.0, vertical: 15.0),
                  // Genişlik ayarı
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0), // Şekil ayarı
                  ),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0, // Yazı boyutu ayarı
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              const Spacer(), // Sayfanın geri kalanını aşağı itmek için Spacer ekledim
              const Text(
                'New User? Create Account',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
