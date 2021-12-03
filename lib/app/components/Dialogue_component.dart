import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:treinos/app/controllers/Image_controller.dart';

class DialogueComponent extends StatelessWidget {
  const DialogueComponent({Key? key, required this.notaFinal, required this.tipo, required this.label}) : super(key: key);
  final String notaFinal;
  final bool tipo;
  final String label;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      content: SingleChildScrollView(
        child: Container(
          width: double.maxFinite,
          child: Row(
            children: [
              ImageController().getImage(double.parse(notaFinal), tipo),
              SizedBox(width: 10),
              Expanded(child: Text('$label $notaFinal', style: TextStyle(fontSize: 28))),
            ],
          ),
        ),
      ),
      actions: [
        CupertinoDialogAction(
            child: Text('Next'),
            onPressed: () {
              Navigator.pop(context);
            }),
      ],
    );
  }
}
