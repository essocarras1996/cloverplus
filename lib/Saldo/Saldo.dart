

import 'package:cloverplus/Helper/Operations.dart';
import 'package:cloverplus/Saldo/Transferir.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:fluttertoast/fluttertoast.dart';


class Saldo extends StatelessWidget {
  TextEditingController adelanta = TextEditingController();
  TextEditingController cupon = TextEditingController();
  late List<Operation> operations=[
    Operation(Icons.phone_forwarded_rounded, 'Adelanta Saldo', 'Adelanta saldo de 25 o 50 CUP',null),
    Operation(Icons.shopping_bag_rounded, 'Bonos', 'Consulte sus bonos actuales',null),
    Operation(Icons.attach_money_sharp, 'Recargar', 'Recarga rápida',null),
    Operation(Icons.monetization_on, 'Saldo', 'Consulte su saldo',null),
    Operation(Icons.send_to_mobile, 'Transferir', 'Envíe saldo a amigos',Transferir()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        title:Text('Saldo',style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold),),

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
                                _adelantaSaldo(context);
                                break;
                              }
                              case 1:{
                                _consultarBono();
                                break;
                              }
                              case 2:{
                                _recargaSaldo(context);
                                break;
                              }

                              case 3:{
                                _consultarSaldo();
                                break;
                              }
                              case 4:{
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
  _consultarSaldo() async{
    const number = '*222#'; //set the number here
    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
  }
  _consultarBono() async{
    const number = '*222*266#'; //set the number here
    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
  }
  _adelantaSaldo(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            contentPadding: EdgeInsets.only(top: 10.0),
            content: Container(
              width: MediaQuery.of(context).size.width*0.8,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Adelanta Saldo",style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor,fontSize: 20.0),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Divider(
                      color: Theme.of(context).primaryColor.withOpacity(0.7),
                      height: 4.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:15,left: 30,right: 30,bottom: 30),
                      child: Text(
                        "Seleccione el monto adelantar de 25 o 50 CUP",style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor,fontSize: 16.0),
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Row(

                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () async {
                              var numbers = '*234*3*1*25#';
                              bool? res = await FlutterPhoneDirectCaller.callNumber(numbers);
                              adelanta.clear();
                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor.withOpacity(0.9),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(32.0),
                                ),
                              ),
                              child: Text(
                                "25 CUP",
                                style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold,color: Colors.white,fontSize: 16.0,),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () async {
                              var numbers = '*234*3*1*50#';
                              bool? res = await FlutterPhoneDirectCaller.callNumber(numbers);
                              adelanta.clear();
                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(32.0)),
                              ),
                              child: Text(
                                "50 CUP",
                                style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold,color: Colors.white,fontSize: 16.0,),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
  _recargaSaldo(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            contentPadding: EdgeInsets.only(top: 10.0),
            content: Container(
              width: MediaQuery.of(context).size.width*0.8,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Recargar",style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor,fontSize: 20.0),
                              overflow: TextOverflow.fade,
                              maxLines: 1,
                              softWrap: false,
                            ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Divider(
                      color: Theme.of(context).primaryColor.withOpacity(0.7),
                      height: 4.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:15,left: 30,right: 30,bottom: 30),
                      child: Text(
                        "Introduce el número del cupón",style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor,fontSize: 16.0),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 0,left: 30,right: 30,bottom: 40),
                      child: TextFormField(
                          textAlign: TextAlign.center,
                          style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor.withOpacity(0.6),fontSize: 14),
                          controller: cupon,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            new LengthLimitingTextInputFormatter(16),
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          decoration: InputDecoration(
                            labelText: "Cupón",
                            floatingLabelStyle: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor.withOpacity(0.7)),
                            labelStyle: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor.withOpacity(0.7)),
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide(
                                color: Theme.of(context).primaryColor.withOpacity(0.5),
                                width: 2.0,
                              ),
                            ),
                          )
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        String num = cupon.text;
                        if(num!=null){
                          if(num.length==16){
                            var numbers = '*662*$num#';
                            bool? res = await FlutterPhoneDirectCaller.callNumber(numbers);
                            cupon.clear();
                            Navigator.pop(context);
                          }else{
                            Fluttertoast.showToast(
                                msg: "Error verifique los campos",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                textColor: Colors.white,
                                fontSize: 16.0
                            );
                          }

                        }
                      },
                      child: Container(
                        padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(32.0),
                              bottomRight: Radius.circular(32.0)),
                        ),
                        child: Text(
                          "Recargar",
                          style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold,color: Colors.white,fontSize: 16.0,),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
