import 'package:flutter/material.dart';
import '../constants.dart';

class PasswordField extends StatefulWidget {
  bool hidePass = true;
  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.only(),
          child: TextField(
            obscureText: widget.hidePass,
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.black
            ),
            decoration: kTextFieldDecoration.copyWith(
                hintText: "Enter your password",
                suffixIcon: IconButton(
                  icon: Icon(widget.hidePass ? Icons.visibility: Icons.visibility_off, color: Colors.grey,),
                  onPressed: (){
                    setState(() {
                      widget.hidePass = !widget.hidePass;
                    });
                  },
                )
            ),
          ),
    );
  }
}
class EmailField extends StatelessWidget {
  EmailField({this.placeholder});
  final String placeholder;

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 10),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.black
            ),
            onChanged: (value) {},
            decoration: kTextFieldDecoration.copyWith(hintText: placeholder),
          ),
    );
  }
}