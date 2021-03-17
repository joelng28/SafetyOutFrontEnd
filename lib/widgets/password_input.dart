import 'package:app/defaults/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PasswordInput extends StatefulWidget{
  PasswordInput({this.labelText});

  final String labelText;

  @override
  PasswordInputState createState() => PasswordInputState(labelText: this.labelText);
}

class PasswordInputState extends State<PasswordInput> {
  PasswordInputState({this.labelText});

  final String labelText;
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: Constants.a7(context),
        child: TextField(
          autocorrect: false,
          obscureText: showPassword ? false : true,
          style: TextStyle(
            color: Constants.black(context)
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: Constants.h3(context), vertical: Constants.v3(context)),
            filled: true,
            fillColor: Constants.lightGrey(context),
            labelText: labelText,
            labelStyle: TextStyle(
              fontSize: Constants.m(context),
              color: Constants.grey(context)
            ),
            hintText: labelText,
            hintStyle: TextStyle(
              fontSize: Constants.m(context),
              color: Constants.grey(context)
            ),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(40),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(40),
            ),
            prefixIcon: Padding(
              padding: EdgeInsets.only(left: 15, right: 10),
              child: Icon(
                FontAwesomeIcons.lock,
                color: Constants.black(context),
                size: 32 / (MediaQuery.of(context).size.width < 380 ? 1.3 : 1),)
            ),
            suffixIcon: Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: InkWell(
                onTap: () { 
                  setState(() {
                  showPassword = !showPassword;
                  });
                },
                child: Icon(
                  showPassword ? Icons.visibility_outlined : 
                    Icons.visibility_off_outlined,
                  color: Constants.black(context),
                  size: 30 / (MediaQuery.of(context).size.width < 380 ? 1.3 : 1),
                  ),
              )
            )
          )
        ),
      ),
    );
  }
}