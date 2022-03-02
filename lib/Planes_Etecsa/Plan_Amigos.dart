import 'package:cloverplus/Helper/Operations.dart';
import 'package:cloverplus/Planes_Etecsa/AddFriend.dart';
import 'package:cloverplus/Planes_Etecsa/DeleteFriend.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class Plan_Amigos extends StatelessWidget {

  late List<Operation> operations=[
    Operation(Icons.person, 'Estado', 'Consultar estado del plan',null),
    Operation(Icons.favorite, 'Activar', 'Activar plan',null),
    Operation(Icons.cancel_sharp, 'Desactivar', 'Desactivar plan',null),
    Operation(Icons.person_add_alt_1, 'Agregar Amigo', 'Agregar el número de un amigo',AddFriend()),
    Operation(Icons.person_remove, 'Eliminar Amigo', 'Eliminar el número de un amigo',DeleteFriend()),
    Operation(Icons.view_list, 'Lista de amigos', 'Consulte su lista de amigos',null),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        title:Text('Plan Amigos',style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold),),

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
                            switch (index){
                              case 0:{
                                _consultarEstado();
                                break;
                              }
                              case 1:{
                               _activarPlanAmigos();
                                break;
                              }
                              case 2:{
                                _desactivarPlanAmigos();
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
                                _listaAmigos();
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
  _consultarEstado() async {
    const numbers = '*222*264#';
    bool? res = await FlutterPhoneDirectCaller.callNumber(numbers);
  }
  _activarPlanAmigos() async {
    const numbers = '*133*4*1*1#';
    bool? res = await FlutterPhoneDirectCaller.callNumber(numbers);
  }
  _desactivarPlanAmigos() async {
    const numbers = '*133*4*1*2#';
    bool? res = await FlutterPhoneDirectCaller.callNumber(numbers);
  }
  _listaAmigos() async {
    const numbers = '*133*4*3*1*1#';
    bool? res = await FlutterPhoneDirectCaller.callNumber(numbers);
  }
}