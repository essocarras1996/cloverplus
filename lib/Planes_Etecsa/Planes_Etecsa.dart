import 'package:cloverplus/Helper/Operations.dart';
import 'package:cloverplus/Planes_Etecsa/Plan_Amigos.dart';
import 'package:cloverplus/Planes_Etecsa/SMS.dart';
import 'package:cloverplus/Planes_Etecsa/VOZ.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Planes_Etecsa extends StatelessWidget {
  late List<Operation> operations=[
    Operation(Icons.sms_rounded, 'SMS', 'Gestione su plan de mensajería',SMS()),
    Operation(Icons.settings_phone, 'VOZ', 'Gestione su plan de voz',VOZ()),
    Operation(Icons.phone_android, 'Plan Amigos', 'Gestione su plan de amigos',Plan_Amigos()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        title:Text('Planes Etecsa',style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold),),

    ),
      body: Center(
        child: Container(
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
        color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5.5,
                spreadRadius: 5.5,
                offset: Offset(0, 1),
              ),
            ],
        borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50))
        ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ListView.builder(
                    itemCount: operations.length,
                    itemBuilder: (BuildContext context,int index){

                      return ElevatedButton(
                        style: ButtonStyle(
                            elevation:MaterialStateProperty.all(0) ,
                            overlayColor: MaterialStateProperty.all<Color>(Theme.of(context).primaryColor.withOpacity(0.5)),
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),

                                )
                            )
                        ),
                        onPressed: (){
                            switch(index){
                              case 0:{
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>operations[index].route));
                                break;
                              }
                              case 1:{
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>operations[index].route));
                                break;
                              }
                              case 2:{
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>operations[index].route));
                                break;
                              }

                            }
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 35.0,right: 35.0,top: 15.0,bottom: 15.0),
                          child:  Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 30.0,
                                  backgroundColor: Theme.of(context).primaryColor,
                                  child: Icon(
                                    operations[index].avatar,
                                    size: 30.0 ,
                                    color: Colors.white,
                                  ),
                                ),
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(operations[index].title,
                                          style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold,fontSize: 18.0,color:Theme.of(context).primaryColor),
                                          overflow:TextOverflow.ellipsis ,
                                        ),
                                        SizedBox(height: 2.0,),
                                        Text(operations[index].subtitle,
                                          style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.w200,fontSize: 12.0,color:Theme.of(context).primaryColor),
                                          overflow:TextOverflow.ellipsis ,
                                        ),
                                      ],
                                    ),
                                  ),
                                )

                              ]

                          ),
                        ),
                      );
                    }
                ),
              ),
            )
        )
    ),)
    ;
  }
}
