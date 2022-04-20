import 'package:flutter/material.dart';
import 'package:ortalam_hesapla_2/Data/data.dart';
import 'package:ortalam_hesapla_2/SabitElemanlar/sabitler.dart';

class KrediDropDown extends StatefulWidget {
  final Function donenKredi;
  KrediDropDown({required this.donenKredi, Key? key}) : super(key: key);

  @override
  State<KrediDropDown> createState() => _KrediDropDownState();
}

class _KrediDropDownState extends State<KrediDropDown> {
  int secilenKredi = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: Sabitler.mainBorder,
        color: Sabitler.ikincilRenk,
      ),
      child: DropdownButton<int>(
        value: secilenKredi,
        items: MyData.dropDownKredi(),
        onChanged: (deger) {
          setState(() {
            secilenKredi = deger!;
            widget.donenKredi(secilenKredi);
          });
        },
      ),
    );
  }
}
