import 'package:e_survey/utility/app_url.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:e_survey/pages/dashboard.dart';
import 'package:e_survey/Models//user.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Signin extends StatefulWidget {

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  SharedPreferences? _prefs;
  static const String tokenPrefKey = 'token_pref';
  static const String userIDPrefKey = 'userId_pref';

  final _formKey = GlobalKey<FormState>();
  Future save() async {
    var res = await http.post(Uri.parse(AppUrl.login),
        headers: <String, String>{
          'Context-Type': 'application/json;charSet=UTF-8'
        },
        body: <String, String>{
          'userId': user.userId,
          'password': user.password
        });
    print(res.body);
   Map <String,dynamic>map =  jsonDecode(res.body);
     //data = json.decode(res.body);
    String uid=map['userId'];
    String tok =map['token'];
    _setStringPref( uid,tok);
    Navigator.push(
        context, new MaterialPageRoute(builder: (context) => Dashboard()));
  }

  User user = User('', '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        // Positioned(
        //     top: 0,
        //     child: SvgPicture.asset(
        //       'assets/top.svg',
        //       width: 400,
        //       height: 150,
        //     )),
        Container(
          alignment: Alignment.center,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 150,
                ),
                Text(
                  "E Survey",
                  style: GoogleFonts.pacifico(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                      color: Colors.blue),
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: TextEditingController(text: user.userId),
                    onChanged: (value) {
                      user.userId = value;
                    },
                    // validator: (value) {
                    //   if (value!.isEmpty) {
                    //     return 'Enter something';
                    //   } else if (RegExp(
                    //           r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    //       .hasMatch(value)) {
                    //     return null;
                    //   } else {
                    //     return 'Enter valid email';
                    //   }
                    // },
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.email,
                          color: Colors.blue,
                        ),
                        hintText: 'Enter User Id',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.blue)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.blue)),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.red)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.red))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: TextEditingController(text: user.userId),
                    onChanged: (value) {
                      user.userId = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter something';
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.vpn_key,
                          color: Colors.blue,
                        ),
                        hintText: 'Enter Password',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.blue)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.blue)),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.red)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.red))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(55, 16, 16, 0),
                  child: Container(
                    height: 50,
                    width: 400,
                    child: FlatButton(
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0)),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            save();
                          } else {
                            print("not ok");
                          }
                        },
                        child: Text(
                          "Signin",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                  ),
                ),
                // Padding(
                //     padding: const EdgeInsets.fromLTRB(95, 20, 0, 0),
                //     child: Row(
                //       children: [
                //         // Text(
                //         //   "Not have Account ? ",
                //         //   style: TextStyle(
                //         //       color: Colors.black, fontWeight: FontWeight.bold),
                //         // ),
                //         // InkWell(
                //         //   // onTap: () {
                //         //   //   Navigator.push(
                //         //   //       context,
                //         //   //       new MaterialPageRoute(
                //         //   //           builder: (context) => Signup()));
                //         //   // },
                //         //   // child: Text(
                //         //   //   "Esurvey",
                //         //   //   style: TextStyle(
                //         //   //       color: Colors.blue,
                //         //   //       fontWeight: FontWeight.bold),
                //         //   // ),
                //         // ),
                //       ],
                //     ))
              ],
            ),
          ),
        )
      ],
    ));
  }
  Future<void> _setStringPref(String token ,String userId) async {
    await this._prefs?.setString(tokenPrefKey, token);
    await this._prefs?.setString(userIDPrefKey, userId);
  }
}