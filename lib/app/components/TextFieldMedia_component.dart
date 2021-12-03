import 'package:flutter/material.dart';

class TextFieldMediaComponent extends StatelessWidget {
  final String title;
  final Function(String?)? onSaved;
  final String? Function(String?)? validate;

  TextFieldMediaComponent({this.onSaved, required this.title, this.validate});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 60),
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20, right: 10),
          child: Text(title, style: TextStyle(fontSize: 20)),
        ),
        Expanded(
          child: Container(
            width: MediaQuery.of(context).size.width / 4,
            child: TextFormField(
              decoration: InputDecoration(
                contentPadding: new EdgeInsets.symmetric(vertical: 10, horizontal: 10.0),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
                filled: true,
                fillColor: Colors.black12,
                focusColor: Colors.grey,
              ),
              validator: validate,
              onSaved: onSaved,
              maxLength: 4,
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 25),
            ),
          ),
        ),
      ]),
    );
  }
}
