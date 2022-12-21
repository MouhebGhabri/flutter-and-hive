//import 'dart:ffi';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:desktopi/kids_model.dart';
import 'package:desktopi/kids_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class KidsEdit extends StatefulWidget  {
  KidsEdit({this.kidsmodel, Key? key}) : super(key: key);

  KidsModel? kidsmodel;
  @override
  State<KidsEdit> createState() => _KidsEditState();
}

class _KidsEditState extends State<KidsEdit> {


  @override
  Widget build(BuildContext context) {
    TextEditingController _kname      = TextEditingController(text: widget.kidsmodel == null ?null:widget.kidsmodel!.flname!);
    TextEditingController _pname      = TextEditingController(text: widget.kidsmodel == null ?null:widget.kidsmodel!.parentflname!);
    TextEditingController _age        = TextEditingController(text: widget.kidsmodel == null ?null:widget.kidsmodel!.age!.toString());
    TextEditingController _phone      = TextEditingController(text: widget.kidsmodel == null ?null:widget.kidsmodel!.phone!);
    TextEditingController _yearofjoin = TextEditingController(text: widget.kidsmodel == null ?null:widget.kidsmodel!.yearofjoin!);
    TextEditingController _pay        = TextEditingController(text: widget.kidsmodel == null ?null:widget.kidsmodel!.pay!.toString());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.purple,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text( widget.kidsmodel == null ? "Insertions d'enfants" :"Modifier les informations sur les enfants", style:  GoogleFonts.mochiyPopOne(fontSize: 30.0,color: Color.fromARGB(194, 255, 251, 6)),
        ),elevation: 0.0,
      ),
      body: Padding(padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Ajoutez soigneusement les données',
              style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.bold,color: Colors.greenAccent),
            ),
            SizedBox(height: 12.0,),
            TextField(
              style: TextStyle(fontSize: 20.0),
              keyboardType: TextInputType.multiline,
              minLines: 1,
              maxLines:1 ,
              controller:_kname ,
              decoration: InputDecoration(fillColor: Colors.purple[200],filled: true,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,borderRadius:BorderRadius.circular(8.0),),
                hintText: "Enfant nom et prénom",
              ),
            ),
            SizedBox(height: 10.0,),
            TextField(
              style: TextStyle(fontSize: 20.0),
              keyboardType: TextInputType.multiline,
              minLines: 1,
              maxLines:1 ,
              controller:_pname ,
              decoration: InputDecoration(fillColor: Colors.purple[200],filled: true,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,borderRadius:BorderRadius.circular(8.0)),
                hintText: "Nom du père ou de la mère de l'enfant",
              ),
            ),
            SizedBox(height: 10.0,),
            TextField(
              style: TextStyle(fontSize: 20.0),
              keyboardType: TextInputType.multiline,
              minLines: 1,
              maxLines:1 ,
              controller:_age ,
              decoration: InputDecoration(fillColor: Colors.purple[200],filled: true,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,borderRadius:BorderRadius.circular(8.0)),
                hintText: "Âge de l'enfant",
              ),
            ),
            SizedBox(height: 10.0,),
            TextField(
              style: TextStyle(fontSize: 20.0),
              keyboardType: TextInputType.multiline,
              minLines: 1,
              maxLines:1 ,
              controller:_phone ,
              decoration: InputDecoration(fillColor: Colors.purple[200],filled: true,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,borderRadius:BorderRadius.circular(8.0)),
                hintText: "Télephone",
              ),
            ),
            SizedBox(height: 10.0,),
            TextField(
              style: TextStyle(fontSize: 20.0),
              keyboardType: TextInputType.multiline,
              minLines: 1,
              maxLines:1 ,
              controller:_yearofjoin ,
              decoration: InputDecoration(fillColor: Colors.purple[200],filled: true,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,borderRadius:BorderRadius.circular(8.0)),
                hintText: "Enfant première année d'adhésion",
              ),
            ),
            SizedBox(height: 10.0,),
            TextField(style: TextStyle(fontSize: 20.0),
              keyboardType: TextInputType.multiline,
              minLines: 1,
              maxLines:1 ,
              controller:_pay ,
              decoration: InputDecoration(fillColor: Colors.purple[200],filled: true,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,borderRadius:BorderRadius.circular(8.0)),
                hintText: "Nombre de mois payés",
              ),
            ),
            SizedBox(height: 10.0,),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: 60.0,
                  child: RawMaterialButton(
                    onPressed: () async {
                      // delet update function
                      var newkid =KidsModel(
                        flname: _kname.text,
                        parentflname: _pname.text,
                        age: _age.text,
                        phone: _phone.text,
                        yearofjoin: _yearofjoin.text,
                        pay: _pay.text ,
                      );
                      Box<KidsModel> kidsmodelbox =Hive.box<KidsModel>("kidsmodel");
                      if(widget.kidsmodel != null){
                        widget.kidsmodel!.flname =newkid.flname;
                        widget.kidsmodel!.parentflname =newkid.parentflname;
                        widget.kidsmodel!.age =newkid.age;
                        widget.kidsmodel!.phone =newkid.phone;
                        widget.kidsmodel!.yearofjoin =newkid.yearofjoin;
                        widget.kidsmodel!.pay =newkid.pay;
                        widget.kidsmodel?.save();
                        Navigator.push(context, MaterialPageRoute(builder: ((context) =>KidsPage())));
                      }else if(newkid.flname.toString().isEmpty |
                      newkid.parentflname.toString().isEmpty  |
                      newkid.age.toString().isEmpty  |
                      newkid.phone.toString().isEmpty |
                      newkid.yearofjoin.toString().isEmpty |
                      newkid.pay.toString().isEmpty){
                        AwesomeDialog(
                            width: 300,
                            context: context,
                            title: "Alert",
                            body: Text("Il y a un champ vide!!",style: TextStyle(color: Colors.redAccent,fontSize: 15,)))
                          .show();
                      }else{
                        await kidsmodelbox.add(newkid);
                        Navigator.push(context, MaterialPageRoute(builder: ((context) =>KidsPage())));
                      }
                    },
                    fillColor: Colors.purple[200],
                    child: Text(
                      widget.kidsmodel == null ? 'Enregistrer' : "Modifier",
                      style: GoogleFonts.robotoCondensed(fontWeight: FontWeight.bold,letterSpacing: 1.5 ,color: Color.fromARGB(194, 255, 251, 6),fontSize: 30.0),
                      // style:  GoogleFonts.Helectivia(fontSize: 30.0,color: Color.fromARGB(194, 255, 251, 6)),
                      // TextStyle(
                      //     color: Colors.white,
                      //     fontWeight: FontWeight.bold,
                      //     fontSize: 18.0
                      // ),
                    ),
                  ),

                ),
              ),),
          ],
        ),
      ),
    );
  }
}
