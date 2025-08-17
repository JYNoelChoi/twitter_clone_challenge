import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';
import 'package:twitter_clone/features/authentication/widgets/auth_button.dart';
import 'package:twitter_clone/features/authentication/widgets/password_screen.dart';
import 'package:twitter_clone/features/authentication/widgets/twitter_appbar.dart';
import 'package:twitter_clone/features/confirmation/widgets/pin_textfield.dart';

class ConfirmationScreen extends StatefulWidget {
  final Map<String, String> formData;

  const ConfirmationScreen({super.key, required this.formData});

  @override
  State<ConfirmationScreen> createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
  final FocusNode _pin0Focus = FocusNode();
  final FocusNode _pin1Focus = FocusNode();
  final FocusNode _pin2Focus = FocusNode();
  final FocusNode _pin3Focus = FocusNode();
  final FocusNode _pin4Focus = FocusNode();
  final FocusNode _pin5Focus = FocusNode();
  List<String> inputValues = [];
  List<TextEditingController> controllers = [];
  List<Function(int index, String value)> callbacks = [];
  bool _isComplete = false;
  bool _showLoader = false;

  void _onInputChanged(int index, String value) {
    inputValues[index] = value;
    // print("index: $index, value: $inputValues");
    // print("inputValues.isEmpty : ${inputValues.isEmpty}");
    // print("_isInputComplete: ${_isInputComplete()}");
    if (_isComplete != _isInputComplete()) {
      _isComplete = _isInputComplete();
      setState(() {
        _pin0Focus.unfocus();
        _pin1Focus.unfocus();
        _pin2Focus.unfocus();
        _pin3Focus.unfocus();
        _pin4Focus.unfocus();
        _pin5Focus.unfocus();
      });
    }
  }

  bool _isInputComplete() {
    if (inputValues.isEmpty) return false;
    for (var value in inputValues) {
      if (value == "") return false;
    }
    return true;
  }

  void _onPressNext() {
    setState(() {
      _showLoader = true;
    });
    Future.delayed(const Duration(seconds: 1)).then((value) {
      if (!mounted) return;
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (context) => PasswordScreen()));
    });
  }

  @override
  void initState() {
    super.initState();
    List.generate(6, (index) {
      inputValues.add("");
      controllers.add(TextEditingController());
      callbacks.add(_onInputChanged);
    });
  }

  @override
  void dispose() {
    _pin0Focus.dispose();
    _pin1Focus.dispose();
    _pin2Focus.dispose();
    _pin3Focus.dispose();
    _pin4Focus.dispose();
    _pin5Focus.dispose();

    for (var controller in controllers) {
      controller.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: TwitterAppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(
            vertical: Sizes.size20,
            horizontal: Sizes.size40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "We sent you a code",
                style: TextStyle(
                  fontSize: Sizes.size24,
                  fontWeight: FontWeight.w900,
                  color: Colors.black87,
                ),
              ),
              Gaps.v20,
              Text(
                "Enter it below to verify \n${widget.formData["email"]}.",
                style: TextStyle(fontSize: Sizes.size16, color: Colors.black54),
              ),
              Gaps.v28,
              Row(
                children: [
                  PinTextfield(
                    focusNode: _pin0Focus,
                    prevFocus: null,
                    nextFocus: _pin1Focus,
                    controller: controllers[0],
                    index: 0,
                    onInputChanged: callbacks[0],
                  ),
                  Gaps.h16,
                  PinTextfield(
                    focusNode: _pin1Focus,
                    prevFocus: _pin0Focus,
                    nextFocus: _pin2Focus,
                    controller: controllers[1],
                    index: 1,
                    onInputChanged: callbacks[1],
                  ),
                  Gaps.h16,
                  PinTextfield(
                    focusNode: _pin2Focus,
                    prevFocus: _pin1Focus,
                    nextFocus: _pin3Focus,
                    controller: controllers[2],
                    index: 2,
                    onInputChanged: callbacks[2],
                  ),
                  Gaps.h16,
                  PinTextfield(
                    focusNode: _pin3Focus,
                    prevFocus: _pin2Focus,
                    nextFocus: _pin4Focus,
                    controller: controllers[3],
                    index: 3,
                    onInputChanged: callbacks[3],
                  ),
                  Gaps.h16,
                  PinTextfield(
                    focusNode: _pin4Focus,
                    prevFocus: _pin3Focus,
                    nextFocus: _pin5Focus,
                    controller: controllers[4],
                    index: 4,
                    onInputChanged: callbacks[4],
                  ),
                  Gaps.h16,
                  PinTextfield(
                    focusNode: _pin5Focus,
                    prevFocus: _pin4Focus,
                    nextFocus: null,
                    controller: controllers[5],
                    index: 5,
                    onInputChanged: callbacks[5],
                  ),
                ],
              ),
              Gaps.v10,
              AnimatedOpacity(
                opacity: _isComplete ? 1 : 0,
                duration: Duration(milliseconds: 300),
                child: Container(
                  alignment: Alignment.center,
                  child: FaIcon(
                    FontAwesomeIcons.solidCircleCheck,
                    color: Colors.green.withAlpha(200),
                    size: Sizes.size28,
                  ),
                ),
              ),
              Gaps.v96,
              Gaps.v24,
              Text.rich(
                TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: "Didn't receive a code? ",
                      style: TextStyle(
                        fontSize: Sizes.size14,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent.withAlpha(150),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 120,
        child: BottomAppBar(
          child: AuthButton(
            text: "Next",
            buttonColor: _isComplete ? Colors.black : Colors.black54,
            textColor: _isComplete ? Colors.white : Colors.grey.shade400,
            onPressed: _onPressNext,
            showLeader: _showLoader,
          ),
        ),
      ),
    );
  }
}
