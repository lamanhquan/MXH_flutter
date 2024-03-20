import 'package:flutter/material.dart';
import 'main.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController emailController = TextEditingController();
  bool _isInputValid = true;
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

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
        color: Colors.grey,
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
                      color: Colors.blue[700],
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyHomePage()),
                      );
                    },
                  ))
            ]),
            Center(
              child: Card(
                  margin: EdgeInsets.only(
                      top: screenHeight * 0.2,
                      left: screenWidth * 0.05,
                      right: screenWidth * 0.05),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        title: Text(
                          'Find your account',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, bottom: 10),
                        height: 1.0,
                        color: Colors.grey,
                      ),
                      Container(
                          margin: EdgeInsets.all(20),
                          alignment: Alignment.bottomLeft,
                          child: Text('Please input email to find your account',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w100))),
                      _buildInputEmailField(emailController),
                      Container(
                        margin: EdgeInsets.only(top: 10, bottom: 10),
                        height: 1.0,
                        color: Colors.grey,
                      ),
                      Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                child: const Text('Cancle'),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MyHomePage()));
                                },
                              ),
                              TextButton(
                                child: const Text('Find'),
                                onPressed: () {
                                  validateInput(emailController.text);
                                  if (_isInputValid) {}
                                },
                              )
                            ],
                          ))
                    ],
                  )),
            )
          ],
        ));
  }

  Widget _buildInputEmailField(TextEditingController controller) {
    return Container(
        margin: EdgeInsets.all(10),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Email address',
              suffixIcon:
                  _isInputValid ? const Icon(null) : const Icon(Icons.close),
              errorText: _isInputValid ? null : 'Invalid input'),
        ));
  }
}
