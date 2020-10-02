import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:yemek_tarifleri/yemek.dart';
import 'package:yemek_tarifleri/yemek_listesi.dart';

class YemekDetay extends StatefulWidget {
  int gelenIndex;

  YemekDetay(this.gelenIndex);

  @override
  _YemekDetayState createState() => _YemekDetayState();
}

class _YemekDetayState extends State<YemekDetay> {
  Yemek secilenYemek;
  Color baskinRenk;
  PaletteGenerator paletteGenerator;

  @override
  void initState() {
    super.initState();
    secilenYemek = YemekListesi.tumYemekler[widget.gelenIndex];
    baskinRengiBul();
  }

  void baskinRengiBul() {
    Future<PaletteGenerator> fPaletGenerator =
    PaletteGenerator.fromImageProvider(
        AssetImage("images/" + secilenYemek.yemekResim));
    fPaletGenerator.then((value) {
      paletteGenerator = value;
      setState(() {
        baskinRenk = paletteGenerator.vibrantColor.color;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        primary: true,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 250,
              pinned: true,
              backgroundColor: baskinRenk != null ? baskinRenk : Colors.pink,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  "images/" + secilenYemek.yemekResim,
                  fit: BoxFit.cover,
                ),
                centerTitle: true,
                title: Text(secilenYemek.yemekAdi),
              ),
            ),
            SliverToBoxAdapter(
                child: Container(
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.pink.shade50,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: SingleChildScrollView(
                        child: Text(
                      secilenYemek.yemekTarifi,
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ))))
          ],
        ));
  }


}
