import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

const swatch2 = Color(0xff9b92ff);
const primaryColor = Color(0xFF255ED6);
const textColor = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    
    colors: [
      Color(0xff9b92ff),
      Color(0xff271BA4)
    ]);
const backgroundColor = Color(0xFF1E1E1E);
const redColor = Color(0xFFE85050);

const defaultPadding = 16.0;

OutlineInputBorder textFieldBorder = OutlineInputBorder(
  borderSide: BorderSide(
    color: primaryColor.withOpacity(0.1),
  ),
);



const emailError = 'Enter a valid email address';
const requiredField = "This field is required";

final passwordValidator = MultiValidator(
  [
    RequiredValidator(errorText: 'password is required'),
    MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])',
        errorText: 'passwords must have at least one special character')
  ],
);


