
import 'package:desktopi/kids_edit.dart';
import 'package:desktopi/kids_model.dart';
import 'package:desktopi/pdf.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

class MyList extends StatefulWidget {
  MyList(this.kidsmodel, this.index,  {Key? key}) : super(key: key);
  KidsModel kidsmodel;
  int index;

  @override
  State<MyList> createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.0),
      width: double.infinity,
      padding: EdgeInsets.all(30.0),
      decoration: BoxDecoration(
          color: Colors.purple[100],
          borderRadius: BorderRadius.circular(8.0)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text("Nom et prénom d'enfant : ${widget.kidsmodel.flname!}",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold)),
              ),
              IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>PdfScreen()));
                // print(K.allMatches(string));
                //    box.clear();
              }, icon: Icon(Icons.print,color: Colors.blue,)),


              IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>KidsEdit(kidsmodel: widget.kidsmodel,)));
              }, icon: Icon(Icons.edit,color: Colors.green,)),

              IconButton(onPressed: (){
                widget.kidsmodel.delete();
                //    box.clear();
              }, icon: Icon(Icons.delete,color: Colors.red,)),

            ],
          ),
          Divider(
            color: Colors.black87,height: 20.0,thickness: 1.0,
          ),
          Text("Nom du pére : ${widget.kidsmodel.parentflname!}",style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 13.0,fontWeight: FontWeight.bold, letterSpacing: .5),),),
          SizedBox(height: 6,),
          Text("Age : ${widget.kidsmodel.age!}",style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 13.0,fontWeight: FontWeight.bold, letterSpacing: .5),),),
          SizedBox(height: 6,),
          Text("Télephone : ${widget.kidsmodel.phone!}" , style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 13.0,fontWeight: FontWeight.bold, letterSpacing: .5),),),
          SizedBox(height: 6,),
          Text("Date du 1ére  Inscription  : ${widget.kidsmodel.yearofjoin!}", style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 13.0,fontWeight: FontWeight.bold, letterSpacing: .5),),),
          SizedBox(height: 6,),
          Text("Nombre du moins payé : ${widget.kidsmodel.pay!.toString()}" ,style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 13.0,fontWeight: FontWeight.bold, letterSpacing: .5),),),
          SizedBox(height: 6,),


        ],
      ),
    );
  }
}
