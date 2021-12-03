import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Image.asset('assets/images/objetivo_white.png', width: 150, fit: BoxFit.cover),
          )
        ],
      ),
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Align(
              child: Column(
                children: [
                  Padding(padding: const EdgeInsets.all(10)),
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: CircleAvatar(
                      backgroundColor: Colors.indigo[600],
                      child: FaIcon(FontAwesomeIcons.userAstronaut, size: 120, color: Colors.white),
                    ),
                  ),
                  Padding(padding: const EdgeInsets.all(15)),
                  Divider(color: Colors.black87),
                  Padding(padding: const EdgeInsets.all(5)),
                  Text('WELCOME', style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold, fontFamily: 'Concert One')),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                          'Conheça o mais novo app de médias, aqui você poderá fazer sozinho o cálculo de suas respectivas notas, trimestral, PGA e recuperação (RT, RF).',
                          style: TextStyle(fontSize: 20, color: Colors.black87)),
                    ),
                  ),
                ],
              ),
              alignment: Alignment.center,
            ),
          ),
        ],
      ),
    );
  }
}
