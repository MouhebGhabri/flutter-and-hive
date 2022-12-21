import 'package:desktopi/kids_edit.dart';
import 'package:desktopi/kids_model.dart';
import 'package:desktopi/my_list.dart';
import 'package:desktopi/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';



class KidsPage extends StatelessWidget {
  const KidsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat.yMMMEd().format(now);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.purple,

        // leading: IconButton(
        //     icon: Icon(Icons.search),
        //     hoverColor: Color.fromARGB(194, 255, 251, 6),
        //     color: Colors.white,
        //     onPressed: () {
        //       Navigator.push(context, MaterialPageRoute(builder: (context)=>searchWidget()));            }),
        title: Text(
          "Excellence École",
          style:  GoogleFonts.mochiyPopOne(fontSize: 30.0,color: Color.fromARGB(194, 255, 251, 6)),
          // style: TextStyle(
          //   color: Color.fromARGB(194, 255, 251, 6),
          //   fontSize: 30.0,
          // ),
        ),
      ),
      body: ValueListenableBuilder<Box<KidsModel>>(
        valueListenable: Hive.box<KidsModel>("kidsmodel").listenable(),
        builder: (context, box, _){
          return Padding(padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Bienvenu", textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.blueAccent,fontSize: 20.0,fontWeight: FontWeight.bold),),
                SizedBox(height: 10.0,),
                Text(formattedDate,style: TextStyle(color: Colors.greenAccent,fontWeight: FontWeight.bold,fontSize: 18.0)),
                Divider(height: 40.0,thickness: 1.0,),
                Expanded(child: ListView.builder(
                  itemCount: box.values.length,
                  itemBuilder: (context, index) {
                    KidsModel currentKidsModel = box.getAt(index)!;
                    return MyList(currentKidsModel, index);

                  },


                ))

              ],
            ),

          );
        },

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> KidsEdit()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
