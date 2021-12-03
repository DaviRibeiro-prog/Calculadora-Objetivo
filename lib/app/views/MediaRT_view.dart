import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:treinos/app/components/Dialogue_component.dart';
import 'package:treinos/app/components/TextFieldMedia_component.dart';
import 'package:treinos/app/controllers/Calculator_controller.dart';
import 'package:treinos/app/controllers/Validation_controller.dart';

class MediaRt extends StatefulWidget {
  const MediaRt({Key? key}) : super(key: key);

  @override
  _MediaRtState createState() => _MediaRtState();
}

class _MediaRtState extends State<MediaRt> {
  double? n1, n2;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Média Recuperação Trimestral')),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 25),
                SizedBox(
                  width: 200,
                  height: 200,
                  child: CircleAvatar(
                    child: Icon(Icons.calculate, size: 170),
                  ),
                ),
                SizedBox(height: 20),
                TextFieldMediaComponent(
                    validate: (text) {
                      return Validation().setValidation(text);
                    },
                    onSaved: (value) {
                      n1 = double.parse(value!);
                    },
                    title: 'Média Trimestral:'),
                Padding(padding: EdgeInsets.all(10)),
                TextFieldMediaComponent(
                    validate: (text) {
                      return Validation().setValidation(text);
                    },
                    onSaved: (value) {
                      n2 = double.parse(value!);
                    },
                    title: 'Média Desejada:'),
                Padding(padding: EdgeInsets.all(10)),
                SizedBox(
                  height: 75,
                  width: 75,
                  child: FloatingActionButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      var form = formKey.currentState;
                      if (form!.validate()) {
                        form.save();
                        var notaFinal = Calculator().mediaRt(n1, n2);
                        showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                new DialogueComponent(notaFinal: notaFinal, tipo: false, label: 'Nota: '));
                      }
                    },
                    child: Icon(FontAwesomeIcons.equals, size: 40),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
