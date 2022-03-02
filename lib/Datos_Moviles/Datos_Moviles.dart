
import 'package:cloverplus/Datos_Moviles/Paquetes_Combinados.dart';
import 'package:cloverplus/Datos_Moviles/Paquetes_LTE.dart';
import 'package:cloverplus/Helper/Operations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class Datos_Moviles extends StatelessWidget {
  late List<Operation> operations=[
    Operation(Icons.call, 'Tarifa por consumo', 'Active o desactive la tarifa por consumo',null),
    Operation(Icons.alternate_email_outlined, 'Bolsa Correo', 'Comprar bolsa correo',null),
    Operation(Icons.trending_up, 'Bolsa Diaria', 'Comprar bolsa diaria',null),
    Operation(Icons.wifi_tethering_outlined, 'Paquetes Combinados', 'Comprar paquetes combinados',Paquetes_Combinados()),
    Operation(Icons.network_cell, 'Paquetes LTE', 'Comprar paquetes de datos LTE',Paquetes_LTE()),
    Operation(Icons.monetization_on, 'Saldo', 'Consultar megas disponibles',null),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        title:Text('Datos Móviles',style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold),),

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
                                _tarifaPorConsumo(context);
                                break;
                              }
                              case 1:{
                                _bolsaCorreo();
                                break;
                              }
                              case 2:{
                                _bolsaDiaria();
                                break;
                              }
                              case 3:{
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>operations[index].route));
                                break;
                              }
                              case 4:{
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>operations[index].route));
                                break;
                              }
                              case 5:{
                                _saldoPaquetes();
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
  _bolsaCorreo() async {
      const numbers = '*133*1*2#';
      bool? res = await FlutterPhoneDirectCaller.callNumber(numbers);
  }
  _bolsaDiaria() async {
    const numbers = '*133*1*3#';
    bool? res = await FlutterPhoneDirectCaller.callNumber(numbers);
  }
  _saldoPaquetes() async {
    const numbers = '*222*328#';
    bool? res = await FlutterPhoneDirectCaller.callNumber(numbers);
  }
  _tarifaPorConsumo(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            contentPadding: EdgeInsets.only(top: 10.0),
            content: Container(
              width: 300.0,
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
                          "Tarifa por Consumo",style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor,fontSize: 20.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Divider(
                      color: Theme.of(context).primaryColor.withOpacity(0.5),
                      height: 4.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:15,left: 30,right: 30,bottom: 20),
                      child: Text(

                        "Si usted tiene activada esta opción, el consumo de datos se le cobrará de su saldo principal a un mayor precio.",style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor,fontSize: 14.0),
                       textAlign:  TextAlign.justify,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () async {
                              const numbers = '*133*1*1*2#';
                              bool? res = await FlutterPhoneDirectCaller.callNumber(numbers);
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
                                "Deshabilitar",
                                style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold,color: Colors.white,fontSize: 15.0,),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () async {
                              const numbers = '*133*1*1*1#';
                              bool? res = await FlutterPhoneDirectCaller.callNumber(numbers);
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
                                "Habilitar",
                                style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold,color: Colors.white,fontSize: 15.0,),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
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
}
