import 'package:cloverplus/Helper/Operations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';



class Call extends StatelessWidget {
  late List<Operation> operations=[
    Operation(Icons.call, 'Asterisco 99', 'Llamada Gratis',null),
    Operation(Icons.phone_locked, 'Número Privado', 'Llame con número Privado',null),
    Operation(Icons.phone_forwarded_rounded, 'Números Útiles', 'Información sobre números útiles',null),
  ];

  late List<Operation> utiles=[
    Operation(Icons.phone_forwarded_rounded, 'Atención al cliente', '2266',null),
    Operation(Icons.dock_rounded, 'Línea Antidroga', '103',null),
    Operation(Icons.local_hospital_rounded, 'Ambulancias', '104',null),
    Operation(Icons.whatshot_sharp, 'Bomberos', '105',null),
    Operation(Icons.local_police, 'Policía', '106',null),
    Operation(Icons.directions_boat, 'Salvamento Marítimo', '107',null),
    Operation(Icons.info_outlined, 'CUBACEL INFO', '118',null),
  ];




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        title:Text('Llamadas',style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold),),

      ),
      body: Center(
          child: Container(
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5.5,
                    spreadRadius: 5.5,
                    offset: Offset(0, 1),
                  ),
                ],
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
                              overlayColor: MaterialStateProperty.all<Color>(Theme.of(context).primaryColor.withOpacity(0.4)),
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),

                                  )
                              )
                          ),
                          onPressed: () async {

                            switch(index){
                              case 0:{
                                _callFree();
                                break;
                              }
                              case 1:{
                                _callHide();
                                break;
                              }
                              case 2:{
                                _numberUtil(context);
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
      ),);
  }
  _callFree() async {
    final FullContact contact =
        await FlutterContactPicker.pickFullContact();
    String number =contact.phones.first.number.toString().replaceAll(" ", "").replaceAll("+53", "");
    if(number!=null){
      var numbers = '*99$number'; //set the number here
      bool? res = await FlutterPhoneDirectCaller.callNumber(numbers);
    }

  }

  _callHide() async {
    final FullContact contact =
    await FlutterContactPicker.pickFullContact();
    String number =contact.phones.first.number.toString().replaceAll(" ", "").replaceAll("+53", "");
    if(number!=null){
      var numbers = '#31#$number';
      bool? res = await FlutterPhoneDirectCaller.callNumber(numbers);
    }
  }

  _numberUtil(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            contentPadding: EdgeInsets.only(top: 10.0),
            content: Container(
              width: 300.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              "Números Útiles",style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor,fontSize: 18.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Divider(
                    color: Theme.of(context).primaryColor.withOpacity(0.6),
                    height: 4.0,
                  ),

                  Container(
                    margin: EdgeInsets.only(bottom: 5.0,right: 12,left: 12),
                    width: MediaQuery.of(context).size.width*0.9,
                    height: MediaQuery.of(context).size.height*0.5,
                    child: ListView.builder(

                        itemCount: utiles.length,
                        itemBuilder: (BuildContext context,int index){
                          return ElevatedButton(
                            style: ButtonStyle(
                                elevation:MaterialStateProperty.all(0) ,
                                overlayColor: MaterialStateProperty.all<Color>(Theme.of(context).primaryColor.withOpacity(0.6)),
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0),

                                    )
                                )
                            ),
                            onPressed: () async {
                              switch (index){
                                case 0:{
                                  var numbers = '2266'; //set the number here
                                  bool? res = await FlutterPhoneDirectCaller.callNumber(numbers);
                                  break;
                                }
                                case 1:{
                                  var numbers = '103'; //set the number here
                                  bool? res = await FlutterPhoneDirectCaller.callNumber(numbers);
                                  break;
                                }
                                case 2:{
                                  var numbers = '104'; //set the number here
                                  bool? res = await FlutterPhoneDirectCaller.callNumber(numbers);
                                  break;
                                }
                                case 3:{
                                  var numbers = '105'; //set the number here
                                  bool? res = await FlutterPhoneDirectCaller.callNumber(numbers);
                                  break;
                                }
                                case 4:{
                                  var numbers = '106'; //set the number here
                                  bool? res = await FlutterPhoneDirectCaller.callNumber(numbers);
                                  break;
                                }
                                case 5:{
                                  var numbers = '107'; //set the number here
                                  bool? res = await FlutterPhoneDirectCaller.callNumber(numbers);
                                  break;
                                }
                                case 6:{
                                  var numbers = '118'; //set the number here
                                  bool? res = await FlutterPhoneDirectCaller.callNumber(numbers);
                                  break;
                                }

                              }
                              Navigator.pop(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 8.0,bottom: 8.0),
                              child:  Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      radius: 20.0,
                                      backgroundColor: Theme.of(context).primaryColor,
                                      child: Icon(
                                        utiles[index].avatar,
                                        size: 20.0 ,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Flexible(
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 20.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(utiles[index].title,
                                              style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold,fontSize: 15.0,color:Theme.of(context).primaryColor),
                                              overflow:TextOverflow.ellipsis ,
                                            ),
                                            SizedBox(height: 2.0,),
                                            Text(utiles[index].subtitle,
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
                  )

                ],
              ),
            ),
          );
        });
  }
}
