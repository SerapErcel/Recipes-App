class Yemek {

  String _yemekAdi;
  String _hazirlikSuresi;
  String _yemekTarifi;
  String _yemekResim;

  String get yemekAdi => _yemekAdi;

  set yemekAdi(String value) {
    _yemekAdi = value;
  }

  Yemek(this._yemekAdi, this._hazirlikSuresi, this._yemekTarifi,
      this._yemekResim);

  String get hazirlikSuresi => _hazirlikSuresi;

  String get yemekResim => _yemekResim;

  set yemekResim(String value) {
    _yemekResim = value;
  }

  String get yemekTarifi => _yemekTarifi;

  set yemekTarifi(String value) {
    _yemekTarifi = value;
  }

  set hazirlikSuresi(String value) {
    _hazirlikSuresi = value;
  }
}