
import 'package:cloverplus/Helper/Operations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class Paquetes_LTE extends StatelessWidget {
  late List<Operation> operations=[
    Operation(Icons.network_cell, '1 GB LTE', 'Precio: \$100.00 CUP',null),
    Operation(Icons.network_cell, '2.5 GB LTE', 'Precio: \$200.00 CUP',null),
    Operation(Icons.network_cell, '4 GB + 12 GB LTE', 'Precio: \$950.00 CUP',null),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        title:Text('Paquetes LTE',style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold),),

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
                                _paquete1GB();
                                break;
                              }
                              case 1:{
                                _paquete2GB();
                                break;
                              }
                              case 2:{
                                _paquete16GB();
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
                                            style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.w200,fontSize: 13.0,color:Theme.of(context).primaryColor),
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
  _paquete1GB() async {
    const numbers = '*133*1*4*1#';
    bool? res = await FlutterPhoneDirectCaller.callNumber(numbers);
  }
  _paquete2GB() async {
    const numbers = '*133*1*4*2#';
    bool? res = await FlutterPhoneDirectCaller.callNumber(numbers);
  }
  _paquete16GB() async {
    const numbers = '*133*1*4*3#';
    bool? res = await FlutterPhoneDirectCaller.callNumber(numbers);
  }
}
