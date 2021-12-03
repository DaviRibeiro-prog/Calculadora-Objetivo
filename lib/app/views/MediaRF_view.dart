import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:treinos/app/components/Dialogue_component.dart';
import 'package:treinos/app/components/TextFieldMedia_component.dart';
import 'package:treinos/app/controllers/Calculator_controller.dart';
import 'package:treinos/app/controllers/Validation_controller.dart';

class MediaRf extends StatefulWidget {
  const MediaRf({Key? key}) : super(key: key);

  @override
  _MediaRfState createState() => _MediaRfState();
}

class _MediaRfState extends State<MediaRf> {
  double? n1;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Média Recuperação Final')),
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
                    title: 'Média Final:'),
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
                        var notaFinal = Calculator().mediaRf(n1);
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => new DialogueComponent(
                                notaFinal: notaFinal, tipo: false, label: 'Precisa tirar uma nota acima de: '));
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
