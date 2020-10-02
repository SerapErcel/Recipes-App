import 'package:flutter/material.dart';
import 'package:yemek_tarifleri/yemek.dart';
import 'package:yemek_tarifleri/strings.dart';

class YemekListesi extends StatelessWidget {
  static List<Yemek> tumYemekler;

  @override
  Widget build(BuildContext context) {
    tumYemekler=veriKaynaginiHazirla();
    return Scaffold(
      appBar: AppBar(
        title: Text("Yemek Tarifleri"),
      ),
      body: listeyiHazirla(),
    );
  }

  List<Yemek> veriKaynaginiHazirla() {
    List<Yemek> yemekler = [];
    for (int i = 0; i < 15; i++) {
      String resim = Strings.YEMEK_ADLARI[i].toLowerCase() + ".jpg";
      Yemek eklenecekYemek = Yemek(
        Strings.YEMEK_ADLARI[i],
        Strings.HAZIRLANMA_SURESI[i],
        Strings.YEMEK_TARIFI[i],
        resim,
      );
      yemekler.add(eklenecekYemek);
    }
    return yemekler;
  }

  Widget listeyiHazirla() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return tekSatirYemek(context, index);
      },
      itemCount: tumYemekler.length,
    );
  }

  Widget tekSatirYemek(BuildContext context, int index) {
    Yemek oanListeyeEklenenYemek = tumYemekler[index];
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
            onTap: () => Navigator.pushNamed(context, "/yemekDetay/$index"),
            leading: Image.asset(
              "images/"+oanListeyeEklenenYemek.yemekResim,
              width:90,
              height: 90,
            ),
            title: Text(
              oanListeyeEklenenYemek.yemekAdi,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                color: Colors.pink.shade500,
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                oanListeyeEklenenYemek.hazirlikSuresi,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.black45),
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.pink,
            )),
      ),
    );
  }
}
