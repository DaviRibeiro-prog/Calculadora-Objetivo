import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:treinos/app/components/Dialogue_component.dart';
import 'package:treinos/app/components/TextFieldMedia_component.dart';
import 'package:treinos/app/controllers/Calculator_controller.dart';
import 'package:treinos/app/controllers/Validation_controller.dart';

class Media extends StatefulWidget {
  const Media({Key? key}) : super(key: key);

  @override
  _MediaState createState() => _MediaState();
}

class _MediaState extends State<Media> {
  double? n1, n2, pga;
  final formKey = GlobalKey<FormState>();

  validation(String? text) {
    if (text!.isEmpty || text.contains(new RegExp(r'[a-z]')) || !(double.parse(text) <= 10 && double.parse(text) >= 0)) {
      return 'Impossible Value';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Média Trimestral')),
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
                    child: Icon(Icons.calculate_outlined, size: 170),
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
                    title: 'Nota 1:'),
                Padding(padding: EdgeInsets.all(10)),
                TextFieldMediaComponent(
                    validate: (text) {
                      return Validation().setValidation(text);
                    },
                    onSaved: (value) {
                      n2 = double.parse(value!);
                    },
                    title: 'Nota 2:'),
                Padding(padding: EdgeInsets.all(10)),
                TextFieldMediaComponent(
                    validate: (text) {
                      return Validation().setValidation(text);
                    },
                    onSaved: (value) {
                      pga = double.parse(value!);
                    },
                    title: 'PGA:'),
                Padding(padding: EdgeInsets.all(5)),
                SizedBox(
                  height: 75,
                  width: 75,
                  child: FloatingActionButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      var form = formKey.currentState;

                      if (form!.validate()) {
                        form.save();
                        var notaFinal = Calculator().media(n1, n2, pga);

                        showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                new DialogueComponent(notaFinal: notaFinal, tipo: true, label: 'Media: '));
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
