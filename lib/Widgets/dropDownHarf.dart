import 'package:flutter/material.dart';
import 'package:ortalam_hesapla_2/Data/data.dart';
import 'package:ortalam_hesapla_2/SabitElemanlar/sabitler.dart';

class HarfDropDpwn extends StatefulWidget {
  final Function donenDeger;
  HarfDropDpwn({required this.donenDeger, Key? key}) : super(key: key);

  @override
  State<HarfDropDpwn> createState() => _HarfDropDpwnState();
}

class _HarfDropDpwnState extends State<HarfDropDpwn> {
  double secilenDropDownMenu = 4.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16 , vertical: 8),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: Sabitler.mainBorder, 
        color: Sabitler.ikincilRenk,
      ),
      child: DropdownButton<double>(
        value: secilenDropDownMenu,
        items: MyData.myDropDown(),
        onChanged: (deger) {
          setState(() {
            secilenDropDownMenu = deger!;
            widget.donenDeger(secilenDropDownMenu);
          });
        },
      ),
    );
  }
}
