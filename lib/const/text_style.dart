import 'package:flutter/material.dart';


TextStyle customTextStyle(double fontSize,{Color? color}){
  return  TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
      color: color ?? Colors.black
  );
}TextStyle customTextStyleWhite(double fontSize,{Color? color}){
  return  TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
      color: color ?? Colors.white
  );
}