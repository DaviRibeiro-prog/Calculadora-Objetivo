class Calculator {
  media(n1, n2, pga) {
    double total = ((n1 + n2) / 2 * 8 + (pga * 2)) / 10;

    return total.toStringAsFixed(2);
  }

  mediaRt(n1, n2) {
    double total = (n2 * 10 - n1 * 4) / 6;

    return total.toStringAsFixed(2);
  }

  mediaRf(n1) {
    double total = (50 - 6 * n1) / 4;

    return total.toStringAsFixed(2);
  }

  mediaPga(n1, n2, n3) {
    double total = (n3 * 10 - (n1 + n2) * 4) / 2;

    return total.toStringAsFixed(2);
  }
}
