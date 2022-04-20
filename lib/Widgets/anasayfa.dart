import 'package:flutter/material.dart';
import 'package:ortalam_hesapla_2/Data/data.dart';
import 'package:ortalam_hesapla_2/Helper/dersler.dart';
import 'package:ortalam_hesapla_2/SabitElemanlar/sabitler.dart';
import 'package:ortalam_hesapla_2/Widgets/Ortalama.dart';
import 'package:ortalam_hesapla_2/Widgets/dersListesi.dart';
import 'package:ortalam_hesapla_2/Widgets/dropDownHarf.dart';
import 'package:ortalam_hesapla_2/Widgets/krediDropDown.dart';

class AnaSayfa extends StatefulWidget {
  AnaSayfa({Key? key}) : super(key: key);

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  final TextEditingController _textController = new TextEditingController();
  var key1 = GlobalKey<FormState>();
  String girilenDers = "";
  double secilenDropDownMenu = 4.0;
  int secilenKredi = 1;
  

  @override
  Widget build(BuildContext context) {
    print("Build Çalıştı");
    return Scaffold(
      appBar: AppBar(
        title: Text("Ortalama Hesapla", style: Sabitler.fontStili),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: buildTextFormField(),
              ),
              Expanded(
                child: OrtalamaWidget(
                    dersSayisi: MyData.dersler.length,
                    ortalama: MyData.ortalamaHesaplayici()),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: DersListesi(
              kaybet: (index) {
                setState(() {
                    MyData.dersler.removeAt(index);
                  });
              },
            ),
          ),
        ],
      ),
    );
  }

  buildTextFormField() {
    return Form(
      key: key1,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            child: _textFormFieldOlusturucu(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              HarfDropDpwn(donenDeger: (deger) {
                secilenDropDownMenu = deger;
              }),
              // Container(
              //   child: DropdownButton<double>(
              //     value: secilenDropDownMenu,
              //     items: MyData.myDropDown(),
              //     onChanged: (deger) {
              //       setState(() {
              //         secilenDropDownMenu = deger!;
              //       });
              //     },
              //   ),
              // ),
              KrediDropDown(donenKredi: (deger) {
                secilenKredi = deger;
              }),
              IconButton(
                  onPressed: () {
                    setState(() {
                      ortalamaHesapla();
                    });
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 32,
                    color: Sabitler.ikincilRenk,
                  ))
            ],
          ),
        ],
      ),
    );
  }

  TextFormField _textFormFieldOlusturucu() {
    return TextFormField(
      controller: _textController,
      
          validator: (e) {
            setState(() {});
            if (e!.length <= 0) {
              return "Ders Adınızı Giriniz";
            } else
              return null;
          },
          onSaved: (deger) {
            setState(() {
              girilenDers = deger!;
            });
            
          },
          decoration: InputDecoration(
              suffixIcon: IconButton(
            icon: Icon(Icons.delete , color: Colors.black,),
            onPressed: () {
              _textController.clear();
            },
          ),
              filled: true,
              hintText: "Ders Giriniz",
              border: OutlineInputBorder(
                  borderRadius: Sabitler.mainBorder,
                  borderSide: BorderSide.none),
              fillColor: Sabitler.ikincilRenk),
        );
  }

  void ortalamaHesapla() {
    setState(() {});
    if (key1.currentState!.validate()) {
      key1.currentState!.save();
      Dersler derslerim =
          Dersler(secilenKredi, secilenDropDownMenu, girilenDers);
      MyData.dersEkleyici(derslerim);
    }
  }
}
