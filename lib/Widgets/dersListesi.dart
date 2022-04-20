import 'package:flutter/material.dart';
import 'package:ortalam_hesapla_2/Data/data.dart';
import 'package:ortalam_hesapla_2/Helper/dersler.dart';
import 'package:ortalam_hesapla_2/SabitElemanlar/sabitler.dart';

class DersListesi extends StatelessWidget {
  final Function kaybet;
  const DersListesi({required this.kaybet, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Dersler> myList = MyData.dersler;
    return myList.length >0
        ? ListView.builder(
            itemCount: myList.length,
            itemBuilder: ((context, index) => Dismissible(
                  key: UniqueKey(),
                  direction: DismissDirection.endToStart,
                  onDismissed: (e) {
                    kaybet(index);
                  },
                  child: Card(
                    color: Colors.white12,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(myList[index].dersAdi),
                        leading: CircleAvatar(
                            child: Text(myList[index].kredi.toString())),
                        subtitle: Text(
                            "Kredi ${myList[index].kredi} , Ortalama ${myList[index].ortalama}"),
                      ),
                    ),
                  ),
                )),
          )
        : Center(child: Container(child:Text("Ders Seçiniz" , style: Sabitler.textStili,)));
  }
}
