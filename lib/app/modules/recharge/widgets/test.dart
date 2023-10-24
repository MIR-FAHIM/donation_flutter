import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:latest_payplus_agent/common/Color.dart';

class KeyboardDemo extends StatefulWidget {
  @override
  _KeyboardDemoState createState() => _KeyboardDemoState();
}

class _KeyboardDemoState extends State<KeyboardDemo> {
  TextEditingController _controller = TextEditingController();
  bool _readOnly = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color(0xFF652981),
        centerTitle: true,
        title: Text('test'),
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(height: 50),
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            style: TextStyle(fontSize: 24),
            autofocus: true,
            showCursor: true,
            readOnly: _readOnly,
          ),
          IconButton(
            icon: Icon(Icons.keyboard),
            onPressed: () {
              print(_controller.text);
              // setState(() {
              //   _readOnly = !_readOnly;
              // });
            },
          ),
          Spacer(),
          CustomKeyboard(
            onTextInput: (myText) {
              _insertText(myText);
            },
            onBackspace: () {
              _backspace();
            },
          ),
        ],
      ),
    );
  }

  void _insertText(String myText) {
    final text = _controller.text;
    final textSelection = _controller.selection;
    final newText = text.replaceRange(
      textSelection.start,
      textSelection.end,
      myText,
    );
    final myTextLength = myText.length;
    _controller.text = newText;
    _controller.selection = textSelection.copyWith(
      baseOffset: textSelection.start + myTextLength,
      extentOffset: textSelection.start + myTextLength,
    );
  }

  void _backspace() {
    final text = _controller.text;
    final textSelection = _controller.selection;
    final selectionLength = textSelection.end - textSelection.start;

    // There is a selection.
    if (selectionLength > 0) {
      final newText = text.replaceRange(
        textSelection.start,
        textSelection.end,
        '',
      );
      _controller.text = newText;
      _controller.selection = textSelection.copyWith(
        baseOffset: textSelection.start,
        extentOffset: textSelection.start,
      );
      return;
    }

    // The cursor is at the beginning.
    if (textSelection.start == 0) {
      return;
    }

    // Delete the previous character
    final previousCodeUnit = text.codeUnitAt(textSelection.start - 1);
    final offset = _isUtf16Surrogate(previousCodeUnit) ? 2 : 1;
    final newStart = textSelection.start - offset;
    final newEnd = textSelection.start;
    final newText = text.replaceRange(
      newStart,
      newEnd,
      '',
    );
    _controller.text = newText;
    _controller.selection = textSelection.copyWith(
      baseOffset: newStart,
      extentOffset: newStart,
    );
  }

  bool _isUtf16Surrogate(int value) {
    return value & 0xF800 == 0xD800;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class CustomKeyboard extends StatelessWidget {
  CustomKeyboard({
    Key? key,
    required this.onTextInput,
    required this.onBackspace,
  }) : super(key: key);

  final ValueSetter<String> onTextInput;
  final VoidCallback onBackspace;

  void _textInputHandler(String text) => onTextInput.call(text);

  void _backspaceHandler() => onBackspace.call();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      color: Colors.white,
      child: Column(
        children: [
          buildRowOne(),
          buildRowTwo(),
          buildRowThree(),
          buildRowFour()
        ],
      ),
    );
  }

  Expanded buildRowOne() {
    return Expanded(
      child: Row(
        children: [
          TextKey(
            text: '7',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '8',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '9',
            onTextInput: _textInputHandler,
          ),
        ],
      ),
    );
  }

  Expanded buildRowTwo() {
    return Expanded(
      child: Row(
        children: [
          TextKey(
            text: '4',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '5',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '6',
            onTextInput: _textInputHandler,
          ),
        ],
      ),
    );
  }

  Expanded buildRowThree() {
    return Expanded(
      child: Row(
        children: [
          TextKey(
            text: '1',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '2',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '3',
            onTextInput: _textInputHandler,
          ),
        ],
      ),
    );
  }

  Expanded buildRowFour() {
    return Expanded(
      child: Row(
        children: [
          TextKey(
            text: '.',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '0',
            onTextInput: _textInputHandler,
          ),
          BackspaceKey(
            onBackspace: _backspaceHandler,
          ),
        ],
      ),
    );
  }
}

class TextKey extends StatelessWidget {
  const TextKey({
    Key? key,
    required this.text,
    required this.onTextInput,
    this.flex = 1,
  }) : super(key: key);

  final String text;
  final ValueSetter<String> onTextInput;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Material(
          color: AppColors.SectionHighLightCardBg,
          child: InkWell(
            onTap: () {
              onTextInput.call(text);
            },
            child: Container(
              child: Center(
                  child: Text(
                text,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              )),
            ),
          ),
        ),
      ),
    );
  }
}

class BackspaceKey extends StatelessWidget {
  const BackspaceKey({
    Key? key,
    required this.onBackspace,
    this.flex = 1,
  }) : super(key: key);

  final VoidCallback onBackspace;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Material(
          color: Colors.grey,
          child: InkWell(
            onTap: () {
              onBackspace.call();
            },
            child: Container(
              child: Center(
                child: Icon(Icons.backspace),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// First Check

// // main.dart
// import 'package:flutter/material.dart';
// import 'package:paystation/common/Color.dart';

// // import our custom number keyboard
// import './num_pad.dart';

// class TestPage extends StatefulWidget {
//   const TestPage({Key? key}) : super(key: key);

//   @override
//   _TestPageState createState() => _TestPageState();
// }

// class _TestPageState extends State<TestPage> {
//   final TextEditingController _myController = TextEditingController();
//   @override
//   void initState() {
//     this._myController.text = "";
//     // TODO: implement initState
//     super.initState();
//   }
//   // text controller

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('test'),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           // display the entered numbers
//           Padding(
//             padding: const EdgeInsets.all(20),
//             child: SizedBox(
//               height: 70,
//               child: TextField(
//                   controller: _myController,
//                   textAlign: TextAlign.center,
//                   // showCursor: true,
//                   style: const TextStyle(fontSize: 30),
//                   // Disable the default soft keybaord
//                   keyboardType: TextInputType.number,
//                   onChanged: (text) {
//                     print(text);
//                     print(_myController.selection.start);
//                     // _myController.value = TextEditingValue(
//                     //     text: text,
//                     //     selection:
//                     //         TextSelection.collapsed(offset: text.length));
//                     TextSelection previousSelection = _myController.selection;
//                     final val = TextSelection.collapsed(
//                         offset: _myController.text.length);
//                     _myController.selection = val;
//                   }),
//             ),
//           ),
//           // implement the custom NumPad
//           NumPad(
//             buttonSize: 40,
//             buttonColor: AppColors.backgroundColor,
//             iconColor: AppColors.primaryColor,
//             controller: _myController,
//             delete: () {
//               _myController.text = _myController.text
//                   .substring(0, _myController.text.length - 1);
//             },
//             // do something with the input numbers
//             onSubmit: () {
//               debugPrint('Your code: ${_myController.text}');
//               showDialog(
//                   context: context,
//                   builder: (_) => AlertDialog(
//                         content: Text(
//                           "You code is ${_myController.text}",
//                           style: const TextStyle(fontSize: 30),
//                         ),
//                       ));
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

// Secod Check

// import 'package:flutter/material.dart';
// import 'package:keyboard_actions/keyboard_actions.dart';
// import 'package:intl/intl.dart';
// import 'package:paystation/app/modules/global_widgets/text_field_widget.dart';

// class Testing extends StatefulWidget {
//   // Testing({Key? key, this.title}) : super(key: key);

//   // final String title;

//   @override
//   _TestingState createState() => _TestingState();
// }

// class _TestingState extends State<Testing> {
//   final FocusNode _nodeText10 = FocusNode();
//   final FocusNode _nodeText2 = FocusNode();

//   final custom3Notifier = ValueNotifier<String>("");

//   final custom2Notifier = ValueNotifier<String>("");

//   KeyboardActionsConfig _buildConfig(BuildContext context) {
//     return KeyboardActionsConfig(
//       keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
//       keyboardBarColor: Colors.grey[200],
//       nextFocus: true,
//       actions: [
//         KeyboardActionsItem(
//           focusNode: _nodeText10,
//           displayActionBar: false,
//           footerBuilder: (_) => HexKeyboard(
//             focusNode: _nodeText10,
//             notifier: custom3Notifier,
//           ),
//         ),
//         KeyboardActionsItem(
//           focusNode: _nodeText2,
//           displayActionBar: false,
//           footerBuilder: (_) => HexKeyboard(
//             focusNode: _nodeText2,
//             notifier: custom2Notifier,
//           ),
//         ),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("title"),
//       ),
//       body: Column(
//         children: <Widget>[
//           Container(height: 450, child: Content()),
//         ],
//       ),
//     );
//   }
// }

// class Content extends StatefulWidget {
//   final bool isDialog;

//   const Content({Key? key, this.isDialog = false}) : super(key: key);

//   @override
//   _ContentState createState() => _ContentState();
// }

// class _ContentState extends State<Content> {
//   final FocusNode _nodeText10 = FocusNode();
//   final FocusNode _nodeText2 = FocusNode();
//   final FocusNode _nodeText1 = FocusNode();

//   final custom3Notifier = ValueNotifier<String>("");
//   final custom2Notifier = ValueNotifier<String>("");
//   final custom1Notifier = ValueNotifier<String>("");

//   /// Creates the [KeyboardActionsConfig] to hook up the fields
//   /// and their focus nodes to our [FormKeyboardActions].
//   KeyboardActionsConfig _buildConfig(BuildContext context) {
//     return KeyboardActionsConfig(
//       keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
//       keyboardBarColor: Colors.grey[200],
//       nextFocus: true,
//       actions: [
//         KeyboardActionsItem(
//           focusNode: _nodeText1,
//           displayActionBar: false,
//           footerBuilder: (_) => HexKeyboard(
//             focusNode: _nodeText1,
//             notifier: custom1Notifier,
//           ),
//         ),
//         KeyboardActionsItem(
//           focusNode: _nodeText10,
//           displayActionBar: false,
//           footerBuilder: (_) => HexKeyboard(
//             focusNode: _nodeText10,
//             notifier: custom3Notifier,
//           ),
//         ),
//         KeyboardActionsItem(
//           focusNode: _nodeText2,
//           displayActionBar: false,
//           footerBuilder: (_) => HexKeyboard(
//             focusNode: _nodeText2,
//             notifier: custom2Notifier,
//           ),
//         ),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return KeyboardActions(
//       isDialog: widget.isDialog,
//       config: _buildConfig(context),
//       child: Container(
//         color: Colors.blue,
//         padding: const EdgeInsets.all(15.0),
//         child: Center(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               TextFormField(
//                 cursorColor: Color(0xFF652981),

//                 decoration: InputDecoration(
//                   filled: true,
//                   fillColor: Colors.white,
//                   border: InputBorder.none,
//                   hintText: '017xxxxxxxx',
//                   focusColor: Color(0xFF652981),
//                 ),
//                 keyboardType: TextInputType.none,
//                 // validator: (String? value) {
//                 //
//                 // },
//                 onChanged: (String value) {},
//               ),
//               KeyboardCustomInput<String>(
//                 focusNode: _nodeText1,
//                 height: 130,
//                 notifier: custom1Notifier,
//                 builder: (context, val, hasFocus) {
//                   return TextFieldWidget(
//                     keyboardType: TextInputType.none,
//                     hintText: "Tap Here",
//                     onChanged: (String val) {},
//                     // initialValue: val.isEmpty ? "Tap Here" : val,
//                   );
//                 },
//               ),
//               KeyboardCustomInput<String>(
//                 focusNode: _nodeText10,
//                 height: 65,
//                 notifier: custom3Notifier,
//                 builder: (context, val, hasFocus) {
//                   return Container(
//                     width: 100,
//                     height: 50,
//                     child: Text(
//                       val.isEmpty ? "Tap Here" : val,
//                       style:
//                           TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
//                     ),
//                   );
//                 },
//               ),
//               KeyboardCustomInput<String>(
//                 focusNode: _nodeText2,
//                 height: 65,
//                 notifier: custom2Notifier,
//                 builder: (context, val, hasFocus) {
//                   return Container(
//                     alignment: Alignment.center,
//                     child: Text(
//                       val.isEmpty ? "Again Tap Here" : val,
//                       style:
//                           TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
//                     ),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class HexKeyboard extends StatelessWidget
//     with KeyboardCustomPanelMixin<String>
//     implements PreferredSizeWidget {
//   final ValueNotifier<String> notifier;
//   final FocusNode focusNode;

//   HexKeyboard({
//     Key? key,
//     required this.notifier,
//     required this.focusNode,
//   }) : super(key: key);

//   @override
//   Size get preferredSize => Size.fromHeight(190);

//   final format = NumberFormat("0000");

//   String _formatValue(String value) {
//     final updatedValue = value; //format.format(double.parse(value));
//     /*final finalValue = updatedValue.substring(0, updatedValue.length - 2) +
//         "." +
//         updatedValue.substring(updatedValue.length - 2, updatedValue.length);*/
//     final finalValue = updatedValue;
//     return finalValue;
//   }

//   void _onTapNumber(String value) {
//     if (value == "Done") {
//       focusNode.unfocus();
//       return;
//     }
//     final currentValue = notifier.value.replaceAll(".", "");
//     final temp = currentValue + value;
//     updateValue(_formatValue(temp));
//   }

//   void _onTapBackspace() {
//     final currentValue = notifier.value.replaceAll(".", "");
//     final temp = currentValue.substring(0, currentValue.length - 1);
//     updateValue(_formatValue(temp));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: preferredSize.height,
//       color: Color(0xFF313131),
//       child: Padding(
//         padding: const EdgeInsets.only(left: 15, right: 10),
//         child: GridView(
//           shrinkWrap: true,
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 3,
//             childAspectRatio: 3.5,
//             crossAxisSpacing: 10,
//             mainAxisSpacing: 8,
//           ),
//           children: [
//             _buildButton(text: "7", icon: Icons.abc, color: Colors.black),
//             _buildButton(text: "8", icon: Icons.abc, color: Colors.black),
//             _buildButton(text: "9", icon: Icons.abc, color: Colors.black),
//             _buildButton(text: "4", icon: Icons.abc, color: Colors.black),
//             _buildButton(text: "5", icon: Icons.abc, color: Colors.black),
//             _buildButton(text: "6", icon: Icons.abc, color: Colors.black),
//             _buildButton(text: "1", icon: Icons.abc, color: Colors.black),
//             _buildButton(text: "2", icon: Icons.abc, color: Colors.black),
//             _buildButton(text: "3", icon: Icons.abc, color: Colors.black),
//             _buildButton(text: "0", icon: Icons.abc, color: Colors.black),
//             _buildButton(text: "Done", icon: Icons.abc, color: Colors.black),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildButton({
//     String? text,
//     IconData? icon,
//     Color? color,
//   }) =>
//       NumericButton(
//         text: text!,
//         icon: icon!,
//         color: color!,
//         onTap: () => _onTapNumber(text),
//       );
// }

// class NumericButton extends StatelessWidget {
//   final String text;
//   final VoidCallback onTap;
//   final IconData icon;
//   final Color color;

//   const NumericButton({
//     Key? key,
//     required this.text,
//     required this.onTap,
//     required this.icon,
//     required this.color,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       borderRadius: BorderRadius.circular(5.0),
//       color: color ?? Color(0xFF4A4A4A),
//       elevation: 5,
//       child: InkWell(
//         onTap: onTap,
//         child: FittedBox(
//           child: Padding(
//             padding: const EdgeInsets.all(3.0),
//             child:
//                 // icon != null
//                 //     ? Icon(
//                 //         icon,
//                 //         color: Colors.white,
//                 //       )
//                 //     :
//                 Text(
//               text,
//               style: TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.w300,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
