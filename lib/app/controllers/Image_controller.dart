import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ImageController {
  getImage(double notaFinal, bool tipo) {
    if (tipo) {
      if (notaFinal >= 6 && notaFinal < 8) {
        return FaIcon(FontAwesomeIcons.meh, size: 60);
      } else if (notaFinal >= 8) {
        return FaIcon(FontAwesomeIcons.smile, size: 60);
      } else if (notaFinal < 6) {
        return FaIcon(FontAwesomeIcons.sadCry, size: 60);
      }
    } else {
      if (notaFinal < 5) {
        return FaIcon(FontAwesomeIcons.smileBeam, size: 60);
      } else if (notaFinal < 7) {
        return FaIcon(FontAwesomeIcons.flushed, size: 60);
      } else {
        return FaIcon(FontAwesomeIcons.dizzy, size: 60);
      }
    }
  }
}
