import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  DateTime initialDate = DateTime.now();
  DateTime minBirthDay = DateTime.now();
  DateTime maxBirthDay = DateTime.now();
  final Map<String, String> _formData = {};
  final TextEditingController _dateContoller = TextEditingController();
  FaIcon? nameIcon;
  FaIcon? emailIcon;
  FaIcon? birthdayIcon;
  bool showDisclaimer = false;

  @override
  void dispose() {
    _dateContoller.dispose();
    super.dispose();
  }

  void _setTextFieldDate(DateTime date) {
    minBirthDay = DateTime(
      initialDate.year - 100,
      initialDate.month,
      initialDate.day,
    );
    maxBirthDay = DateTime(
      initialDate.year - 12,
      initialDate.month,
      initialDate.day,
    );
  }

  void onPressNext() {
    print("onPressNext() called. _formData= $_formData");
    if (_formKey.currentState != null) {
      // triggers validator
      if (_formKey.currentState!.validate()) {
        // triggers onSave calleback
        _formKey.currentState!.save();
        print(_formData);
      }
    }
    setState(() {});
  }

  String? isNameValid(String? value) {
    // print("isNameValid() called. value = $value");
    if (value == null || value.isEmpty || value.length < 3) {
      // print("Name should be more than 3 letters.");
      nameIcon = null;
      return "Name should be more than 3 letters.";
    }
    nameIcon = FaIcon(
      FontAwesomeIcons.solidCircleCheck,
      size: Sizes.size24,
      color: Colors.green,
    );
    return null;
  }

  String? isEmailValid(String? value) {
    final regExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    if (value == null || value.isEmpty || !regExp.hasMatch(value)) {
      emailIcon = null;
      return "Please provide a valid email or phone number.";
    }
    return null;
  }

  String? isPhoneNumberValid(String? value) {
    if (value == null || value.isEmpty) return null;
    // perform validation and return results
    final regExp = RegExp(
      r"^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$",
    );
    if (!regExp.hasMatch(value)) {
      return "Please provide a valid email or phone number.";
    }
    return null;
  }

  String? isEmailOrPhoneNumberValid(String? value) {
    var emailValid = isEmailValid(value);
    var phoneNumberValid = isPhoneNumberValid(value);
    // print("isEmailOrPhoneNumberValid: value = $value");
    emailIcon = null;
    if (value == null || value.isEmpty) {
      return emailValid;
    }
    // print("email valid = $emailValid");
    // print("phone number valid = $phoneNumberValid");

    if (emailValid != null) {
      if (phoneNumberValid == null) {
        return phoneNumberValid;
      } else {
        return emailValid;
      }
    }

    emailIcon = FaIcon(
      FontAwesomeIcons.solidCircleCheck,
      size: Sizes.size24,
      color: Colors.green,
    );

    return null;
  }

  String? isBirthdayValid(String? value) {
    birthdayIcon = null;
    if (value == null || value.isEmpty) {
      return "Please provide a valid birthday.";
    } else {
      birthdayIcon = FaIcon(
        FontAwesomeIcons.solidCircleCheck,
        size: Sizes.size24,
        color: Colors.green,
      );
      return null;
    }
  }

  void _showDatePicker(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return Container(
          height: 280,
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: 200,
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: maxBirthDay,
                  minimumDate: minBirthDay,
                  maximumDate: maxBirthDay,
                  onDateTimeChanged: (value) {
                    _dateContoller.text = value.toString().split(" ").first;
                    _formData["birthday"] = value.toString();
                  },
                ),
              ),
              CupertinoButton(
                onPressed: () => {
                  Navigator.of(context).pop(),
                  showDisclaimer = false,
                  setState(() {}),
                },
                child: Text(
                  "Done",
                  style: TextStyle(
                    fontSize: Sizes.size24,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
    showDisclaimer = true;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _setTextFieldDate(initialDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          onPressed: () => {Navigator.of(context).pop()},
          child: Text(
            "Cancel",
            style: TextStyle(color: Colors.black, fontSize: Sizes.size16),
          ),
        ),
        automaticallyImplyLeading: false,
        leadingWidth: Sizes.size96,
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: FaIcon(FontAwesomeIcons.twitter, color: Color(0xFF1DA1F2)),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: Sizes.size40),
          child: Column(
            children: [
              Gaps.v24,
              Text(
                "Create your account",
                style: TextStyle(
                  fontSize: Sizes.size24,
                  fontWeight: FontWeight.w900,
                  color: Colors.black87,
                ),
              ),
              Gaps.v28,
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      style: TextStyle(color: Colors.lightBlue),
                      decoration: InputDecoration(
                        suffixIcon: nameIcon,
                        hintText: "Name",
                        hintStyle: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: Sizes.size16,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                      ),
                      validator: (value) => isNameValid(value),
                      onSaved: (newValue) => {
                        if (newValue != null) {_formData["name"] = newValue},
                      },
                    ),
                    Gaps.v10,
                    TextFormField(
                      style: TextStyle(color: Colors.lightBlue),
                      decoration: InputDecoration(
                        suffix: emailIcon,
                        hintText: "Phone number or email address",
                        hintStyle: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: Sizes.size16,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                      ),
                      validator: (value) => isEmailOrPhoneNumberValid(value),
                      onSaved: (newValue) => {
                        if (newValue != null) _formData["email"] = newValue,
                      },
                    ),
                    Gaps.v10,
                    TextFormField(
                      style: TextStyle(color: Colors.lightBlue),
                      onTap: () => _showDatePicker(context),
                      controller: _dateContoller,
                      decoration: InputDecoration(
                        suffix: birthdayIcon,
                        hintText: "Date of birth",
                        hintStyle: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: Sizes.size16,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                      ),
                      validator: (value) => isBirthdayValid(value),
                      onSaved: (newValue) => {
                        if (newValue != null) _formData["birthday"] = newValue,
                      },
                    ),
                    Gaps.v10,
                    AnimatedOpacity(
                      opacity: showDisclaimer ? 1 : 0,
                      duration: Duration(milliseconds: 300),
                      child: Text(
                        "This will not be shown publicly. Confirm your own age, even if this account is for a business, a pet, or something else.",
                        style: TextStyle(
                          fontSize: Sizes.size14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () => onPressNext(),
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: Sizes.size5,
                  horizontal: Sizes.size16,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.shade600,
                ),
                child: Text(
                  "Next",
                  style: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: Sizes.size16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Gaps.h10,
          ],
        ),
      ),
    );
  }
}
