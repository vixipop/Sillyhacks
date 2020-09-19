import 'package:flutter/material.dart';

final Color kBlueBG = Color(0xFF2D4A75);

var kTextFieldDecoration = InputDecoration(
  hintText:'',
  labelStyle: TextStyle(color: Colors.black),
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  contentPadding:
  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFFb6bbc9), width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: Color(0xFFb6bbc9), width: 3.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
);