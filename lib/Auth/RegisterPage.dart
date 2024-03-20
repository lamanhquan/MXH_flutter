import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'main.dart';

class WwlcomeRegisterPage extends StatelessWidget {
  WwlcomeRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
        color: Colors.white,
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: IconButton(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.bottomLeft,
                    icon: Icon(
                      Icons.arrow_back,
                      size: 24,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyHomePage()),
                      );
                    },
                  )),
              Text(
                'Tạo tài khoản',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
            ]),
            Opacity(
                opacity: 0.5,
                child: Container(
                  height: 1.0,
                  color: Colors.grey,
                )),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Image.asset("assets/image/2823257.jpg"),
            ),
            Text('Tham gia Facebook',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            Padding(
                padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                child: Text(
                    'Chúng tôi sẽ giúp bạn tạo tài khoản sau vài bước dễ dàng',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.black))),
            Padding(
                padding: EdgeInsets.all(20),
                child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPage()),
                          );
                        },
                        child: Container(
                            margin: EdgeInsets.only(top: 20),
                            height: screenHeight * 0.06,
                            width: screenWidth,
                            color: Colors.blue[700],
                            alignment: Alignment.center,
                            child: Text(
                              "Tiếp",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            )))))
          ],
        ));
  }
}

class NameRegisterPage extends StatefulWidget {
  const NameRegisterPage({super.key});

  @override
  State<NameRegisterPage> createState() => _NameRegisterPageState();
}

class _NameRegisterPageState extends State<NameRegisterPage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  bool isEmpty = false;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
        color: Colors.white,
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            MouseRegion(
                cursor: SystemMouseCursors.click,
                child: IconButton(
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.bottomLeft,
                  icon: Icon(
                    Icons.arrow_back,
                    size: 24,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyHomePage()),
                    );
                  },
                )),
            Text(
              'Tên',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
          ]),
          Opacity(
              opacity: 0.5,
              child: Container(
                height: 1.0,
                color: Colors.grey,
              )),
          Padding(
            padding: EdgeInsets.only(top: 80),
            child: Text('Bạn tên gì',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
          ),
          Padding(
              padding: EdgeInsets.only(
                  top: screenHeight * 0.03,
                  left: screenWidth * 0.05,
                  right: screenWidth * 0.05),
              child: Row(
                children: [
                  Expanded(
                      child: _buildInputNameField(firstNameController, 'Họ')),
                  SizedBox(
                      width: 10), // Add some spacing between the TextFields
                  Expanded(
                    child: _buildInputNameField(lastNameController, 'Tên'),
                  ),
                ],
              )),
          Padding(
              padding: EdgeInsets.only(
                  left: 0.05 * screenWidth, right: 0.05 * screenWidth),
              child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                      onTap: () {
                        setEmptyValue(firstNameController.text);
                        setEmptyValue(lastNameController.text);
                        if (firstNameController.text != "" &&
                            lastNameController.text != "") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BirthdayRegisterPage()),
                          );
                        }
                      },
                      child: Container(
                          margin: EdgeInsets.only(top: 20),
                          height: screenHeight * 0.06,
                          width: screenWidth,
                          color: Colors.blue[700],
                          alignment: Alignment.center,
                          child: Text(
                            "Tiếp",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          )))))
        ]));
  }

  bool checkEmpty(String text) {
    if (text == "") return true;
    return false;
  }

  void setEmptyValue(String text) {
    setState(() {
      isEmpty = checkEmpty(text);
    });
  }

  Widget _buildInputNameField(TextEditingController controller, String label) {
    return Material(
        child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: label,
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF3b5998))),
        labelText: label,
        errorText: isEmpty ? 'Không được bỏ trống' : null,
      ),
    ));
  }
}

class BirthdayRegisterPage extends StatefulWidget {
  const BirthdayRegisterPage({super.key});

  @override
  State<BirthdayRegisterPage> createState() => _BirthdayRegisterPageState();
}

class _BirthdayRegisterPageState extends State<BirthdayRegisterPage> {
  DateTime _selectedDate = DateTime.now();
  bool isCorrect = true;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
        color: Colors.white,
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            MouseRegion(
                cursor: SystemMouseCursors.click,
                child: IconButton(
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.bottomLeft,
                  icon: Icon(
                    Icons.arrow_back,
                    size: 24,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyHomePage()),
                    );
                  },
                )),
            Text(
              'Sinh nhật',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
          ]),
          Opacity(
              opacity: 0.5,
              child: Container(
                height: 1.0,
                color: Colors.grey,
              )),
          Padding(
            padding: EdgeInsets.only(top: 80),
            child: Text('Sinh nhật bạn khi nào?',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
          ),
          if (isCorrect == false)
            Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Có vẻ như bạn đã nhập thông tin sai. Hãy đảm bảo bạn sử dụng ngày sinh thật của mình",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                      fontWeight: FontWeight.normal),
                )),
          Container(
              padding: EdgeInsets.only(top: 20),
              width: 0.8 * screenWidth,
              height: 0.3 * screenHeight,
              child: Row(children: [
                Expanded(
                    child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: _selectedDate,
                  minimumDate: DateTime(DateTime.now().year - 100),
                  maximumDate: DateTime(DateTime.now().year + 1),
                  onDateTimeChanged: (DateTime newDate) {
                    setState(() {
                      _selectedDate = newDate;
                    });
                  },
                ))
              ])),
          Padding(
              padding: EdgeInsets.only(
                  left: 0.05 * screenWidth, right: 0.05 * screenWidth),
              child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                      onTap: () {
                        checkDateTime();
                        if (isCorrect) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PolicyPage()),
                          );
                        }
                      },
                      child: Container(
                          margin: EdgeInsets.only(top: 20),
                          height: screenHeight * 0.06,
                          width: screenWidth,
                          color: Colors.blue[700],
                          alignment: Alignment.center,
                          child: Text(
                            "Tiếp",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          )))))
        ]));
  }

  void checkDateTime() {
    bool tmpCorrect = true;
    if (DateTime.now().year - _selectedDate.year < 16) {
      tmpCorrect = false;
    }
    setState(() {
      isCorrect = tmpCorrect;
    });
  }
}

class PolicyPage extends StatelessWidget {
  PolicyPage({super.key});
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
        color: Colors.white,
        child: Padding(
            padding: EdgeInsets.only(
                left: 0.05 * screenWidth, right: 0.05 * screenWidth),
            child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EmailRegisterPage()),
                      );
                    },
                    child: Container(
                        margin: EdgeInsets.only(top: 20),
                        height: screenHeight * 0.06,
                        width: screenWidth,
                        color: Colors.blue[700],
                        alignment: Alignment.center,
                        child: Text(
                          "Tiếp",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ))))));
  }
}

class EmailRegisterPage extends StatefulWidget {
  const EmailRegisterPage({super.key});

  @override
  State<EmailRegisterPage> createState() => _EmailRegisterPageState();
}

class _EmailRegisterPageState extends State<EmailRegisterPage> {
  TextEditingController emailController = TextEditingController();
  bool _isInputValid = true;
  bool _isRegister = false;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
        color: Colors.white,
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: IconButton(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.bottomLeft,
                    icon: Icon(
                      Icons.arrow_back,
                      size: 24,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyHomePage()),
                      );
                    },
                  )),
              Text(
                'Địa chỉ Email',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
            ]),
            Opacity(
                opacity: 0.5,
                child: Container(
                  height: 1.0,
                  color: Colors.grey,
                )),
            Padding(
              padding: EdgeInsets.only(top: 80),
              child: Text('Nhập địa chỉ email của bạn',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
            if (_isRegister)
              Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Hiện đã có tài khoản liên kết với email này",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                        fontWeight: FontWeight.normal),
                  )),
            Padding(
                padding: EdgeInsets.only(
                    top: screenHeight * 0.03,
                    left: screenWidth * 0.1,
                    right: screenWidth * 0.1),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: _buildInputEmailField(emailController)),
                    ])),
            Padding(
                padding: EdgeInsets.only(
                    left: 0.1 * screenWidth, right: 0.1 * screenWidth),
                child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                        onTap: () {
                          validateInput(emailController.text);
                          if (_isInputValid) {
                            //API
                            setState(() {
                              if (true)
                                _isRegister = true;
                              else
                                _isRegister = false;
                            });
                            if (_isRegister) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => VerifyEmailPage()),
                              );
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
                              "Tiếp",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            )))))
          ],
        ));
  }

  Widget _buildInputEmailField(TextEditingController controller) {
    return Material(
        child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
          hintText: 'Email address',
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF3b5998))),
          labelText: 'Email',
          suffixIcon:
              _isInputValid ? const Icon(null) : const Icon(Icons.close),
          errorText: _isInputValid ? null : 'Invalid input'),
    ));
  }

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
}

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({super.key});

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  TextEditingController codeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
        color: Colors.white,
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: IconButton(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.bottomLeft,
                    icon: Icon(
                      Icons.arrow_back,
                      size: 24,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyHomePage()),
                      );
                    },
                  )),
              Text(
                'Xác nhận Email',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
            ]),
            Opacity(
                opacity: 0.5,
                child: Container(
                  height: 1.0,
                  color: Colors.grey,
                )),
            Padding(
              padding: EdgeInsets.only(top: 80),
              child: Text('Chúng tôi đã gửi mã tới email của bạn',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.black)),
            ),
            Padding(
                padding: EdgeInsets.only(
                    top: screenHeight * 0.03,
                    left: screenWidth * 0.1,
                    right: screenWidth * 0.1),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: _buildInputCodeField(codeController)),
                    ])),
            Padding(
                padding: EdgeInsets.only(
                    left: 0.1 * screenWidth, right: 0.1 * screenWidth),
                child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                        onTap: () {},
                        child: Container(
                            margin: EdgeInsets.only(top: 20),
                            height: screenHeight * 0.06,
                            width: screenWidth,
                            color: Colors.blue[700],
                            alignment: Alignment.center,
                            child: Text(
                              "Tiếp",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            )))))
          ],
        ));
  }

  Widget _buildInputCodeField(TextEditingController controller) {
    return Material(
        child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: 'Code',
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF3b5998))),
        labelText: 'Code',
        //         suffixIcon:
        //             _isInputValid ? const Icon(null) : const Icon(Icons.close),
        //        errorText: _isInputValid ? null : 'Invalid input'
      ),
    ));
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cfPasswordController = TextEditingController();
  bool _isInputValid = true;
  bool _isPasswordValid = true;
  bool _isSame = true;

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

  void checkSamePassword(String password, String cfPassword) {
    bool Same = false;
    if (password != cfPassword)
      Same = false;
    else
      Same = true;
    setState(() {
      _isSame = Same;
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
    return Container(
        color: Colors.white,
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: IconButton(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.bottomLeft,
                    icon: Icon(
                      Icons.arrow_back,
                      size: 24,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyHomePage()),
                      );
                    },
                  )),
              Text(
                'Tạo tài khoản',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
            ]),
            Opacity(
                opacity: 0.5,
                child: Container(
                  height: 1.0,
                  color: Colors.grey,
                )),
            Container(
                height: screenHeight * 0.3,
                width: screenWidth,
                color: Colors.white,
                child: Icon(
                  Icons.facebook_outlined,
                  size: screenWidth * 0.2,
                  color: Colors.blue[700],
                )),
            Padding(
                padding: EdgeInsets.only(
                    top: screenHeight * 0.03,
                    left: screenWidth * 0.1,
                    right: screenWidth * 0.1),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // _buildGreyText("Email address"),
                      _buildInputEmailField(emailController),
                      _buildInputPasswordField(passwordController,
                          isPassword: true),
                      _buildCfPasswordField(cfPasswordController),
                      MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                              onTap: () {
                                validateInput(emailController.text);
                                passwordInput(passwordController.text,
                                    emailController.text);
                                checkSamePassword(passwordController.text,
                                    cfPasswordController.text);
                                if (_isInputValid &&
                                    _isPasswordValid &&
                                    _isSame) {
                                  List<Map<String, dynamic>> request = [
                                    {
                                      'email': emailController.text,
                                      'password': passwordController.text,
                                      'uuid': DeviceId
                                    }
                                  ];
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            NameRegisterPage()),
                                  );
                                }
                              },
                              child: Container(
                                  margin: EdgeInsets.only(top: 20),
                                  height: screenHeight * 0.06,
                                  width: screenWidth,
                                  color: Colors.blue[700],
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Register",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ))))
                    ]))
          ],
        ));
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

  Widget _buildCfPasswordField(TextEditingController controller) {
    bool obscureText = true;
    return Material(
        child: TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: 'Confirm Password',
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
        errorText: _isSame ? null : 'Password not match',
      ),
    ));
  }
}
