import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:device_info/device_info.dart';
import '../Auth/RegisterPage.dart';
import '../Auth/ForgotPasswordPage.dart';
import 'dart:io' show Platform;
//import 'package:awesome_dialog/awesome_dialog.dart';

import '../MainPage/MainPage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';

//url api
const String domain = "https://it4788.catan.io.vn";
var apiLogin = Uri.parse(domain + "/login");
var apiSignup = Uri.parse(domain + "/signup");
var apiChangePassword = Uri.parse(domain + "/change_password");
var apiLogout = Uri.parse(domain + "/logout");
var apiGetVerifyCode = Uri.parse(domain + "/get_verify_code");
var apiCheckVerifyCode = Uri.parse(domain + "/check_verify_code");
var apiResetPassword = Uri.parse(domain + "/reset_password");

late String DeviceId;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DeviceId = await getDeviceId();
  print(DeviceId);
  runApp(const MyApp());
}

Future<String> getDeviceId() async {
  String deviceId = '';
  try {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceId = androidInfo.androidId; // Android device ID
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      deviceId = iosInfo.identifierForVendor; // iOS device ID
    }
  } catch (e) {
    print('Error getting device ID: $e');
  }
  return deviceId;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isInputValid = true;
  bool _isPasswordValid = true;

  bool isEmailValid(String email) {
    const pattern = r'^[\w-]+(\.[\w-]+)*@([a-z0-9]+(-[a-z0-9]+)*\.)+[a-z]{2,}$';
    final regex = RegExp(pattern);
    return regex.hasMatch(email);
  }

  void validateInput(String text) {
    bool isValid = isEmailValid(text);

    // Update the state variable to control the error state
    setState(() {
      _isInputValid = isValid;
    });
  }

  void passwordInput(String text, String email) {
    bool isShort = false;
    if (text.length < 6) {
      isShort = false;
    } else {
      isShort = true;
    }
    int index = email.indexOf("@");
    if (email.contains("@")) {
      String nameEmail = email.substring(0, index);

      if (text.contains(nameEmail)) isShort = false;
    } else {
      if (text.contains(email)) isShort = false;
    }
    setState(() {
      _isPasswordValid = isShort;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final theme = Theme.of(context);
    return Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
                height: screenHeight * 0.35,
                width: screenWidth,
                color: Colors.blue[700],
                child: Icon(
                  Icons.facebook_outlined,
                  size: screenWidth * 0.2,
                  color: Colors.white,
                )),
            Padding(
                padding: EdgeInsets.only(
                    top: screenHeight * 0.03,
                    left: screenWidth * 0.1,
                    right: screenWidth * 0.1),
                child: Column(children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // _buildGreyText("Email address"),
                      _buildInputEmailField(emailController),
                      _buildInputPasswordField(passwordController,
                          isPassword: true),
                      MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                              onTap: () async {
                                validateInput(emailController.text);
                                passwordInput(passwordController.text,
                                    emailController.text);
                                List<Map<String, dynamic>> request = [
                                  {
                                    'email': emailController.text,
                                    'password': passwordController.text,
                                    'uuid': DeviceId == '' ? '1' : DeviceId
                                  }
                                ];
                                if (_isInputValid && _isPasswordValid) {
                                  try {
                                    var response = await http.post(apiLogin,
                                        headers: {
                                          'Content-Type': 'application/json'
                                        },
                                        body: json.encode(request));
                                    print(response.statusCode);
                                    if (response.statusCode == 200) {
                                      print("Login_success");
                                      /*Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MainPage()));*/
                                    } else if (response.statusCode == 400) {}
                                  } catch (e) {
                                    print('Error: $e');
                                  }
                                }
                              },
                              child: Container(
                                  margin: EdgeInsets.only(top: 20),
                                  height: screenHeight * 0.06,
                                  width: screenWidth,
                                  color: Colors.blue[700],
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Log in",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  )))),
                      MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ForgotPasswordPage()),
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 20),
                                alignment: Alignment.center,
                                child: Text(
                                  "Forgot password ?",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w100),
                                ),
                              ))),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        height: 1.0,
                        color: Colors.grey,
                      ),
                      MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          WwlcomeRegisterPage()),
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 20),
                                alignment: Alignment.center,
                                child: Text(
                                  "Create new account",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w100),
                                ),
                              )))
                    ],
                  ),
                ]))
          ],
        ));
  }

  Widget _buildGreyText(String text) {
    return Text(text, style: const TextStyle(color: Colors.grey));
  }

  Widget _buildInputEmailField(TextEditingController controller) {
    return Material(
        child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
          hintText: 'Email address',
          suffixIcon:
              _isInputValid ? const Icon(null) : const Icon(Icons.close),
          errorText: _isInputValid ? null : 'Invalid input'),
    ));
  }

  Widget _buildInputPasswordField(TextEditingController controller,
      {isPassword = false}) {
    bool obscureText = true;
    return Material(
        child: TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: 'Password',
        suffixIcon: IconButton(
          icon: obscureText
              ? const Icon(Icons.visibility_off)
              : const Icon(Icons.visibility),
          onPressed: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
        ),
        errorText: _isPasswordValid ? null : 'Password too short',
      ),
    ));
  }
}
