import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:internative_test/screens/home/view/homepage.dart';
import 'package:internative_test/service/api_constants.dart';
import 'package:internative_test/service/signin_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  SigninService signin = SigninService();
  Future<void> readySharedPreferences() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    ApiConstants.Token = sharedPreferences.getString("token") ?? "";
  }

  Future<void> saveData() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("token", ApiConstants.Token);
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return "* Required";
    } else if (value.length < 6) {
      return "Password should be atleast 6 characters";
    } else if (value.length > 15) {
      return "Password should not be greater than 15 characters";
    } else
      return null;
  }

  var _signinfetch;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readySharedPreferences().whenComplete(() => {
          if (ApiConstants.Token != "") {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()))}
        });
  }

  bool _isHidden = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formkey,
            child: Column(
              children: <Widget>[
                buildEmailArea(),
                buildPasswordArea(),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    if (formkey.currentState!.validate()) {
                      _signinfetch = await signin.getToken();
                      saveData();
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage())); //değiş

                    } else {
                      showAlertDialog(context);
                    }
                  },
                  child: Text(
                    'Giriş',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding buildEmailArea() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
          decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Email', hintText: 'Enter valid email id as abc@gmail.com'),
          validator: MultiValidator([
            RequiredValidator(errorText: "* Required"),
            EmailValidator(errorText: "Enter valid email id"),
          ])),
    );
  }

  Padding buildPasswordArea() {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
      child: TextFormField(
          keyboardType: TextInputType.number,
          obscureText: _isHidden,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Password',
            suffix: InkWell(
              onTap: _togglePasswordView,
              child: Icon(
                _isHidden ? Icons.visibility : Icons.visibility_off,
              ),
            ),
          ),
          validator: MultiValidator([
            RequiredValidator(errorText: "* Required"),
            MinLengthValidator(6, errorText: "Password should be atleast 6 characters"),
            MaxLengthValidator(15, errorText: "Password should not be greater than 15 characters")
          ])),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  showAlertDialog(BuildContext context) {
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Yanlış giriş"),
      content: Text("Geçerli bir e-posta ve şifre giriniz."),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
