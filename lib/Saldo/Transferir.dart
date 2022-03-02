

import 'package:cloverplus/Saldo/Cambiar_Password.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Transferir extends StatefulWidget {
  const Transferir({Key? key}) : super(key: key);

  @override
  _TransferirState createState() => _TransferirState();
}

class _TransferirState extends State<Transferir> {
  TextEditingController phone = TextEditingController();
  TextEditingController catidad = TextEditingController();
  TextEditingController code = TextEditingController();
  late String? nombre='';
  late bool isNombre=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0,
          title:Text('Transferir',style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold),),

        ),
        body: Container(
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
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(top: 40.0,left: 45.0,right: 20.0),
                          child: Text('Enviar saldo a:',style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor),overflow: TextOverflow.ellipsis,textAlign: TextAlign.left,)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(child: Container(
                            width: 180.0,
                            padding: EdgeInsets.only(top: 20,left: 30,right: 5,bottom: 2.0),
                            child: TextFormField(
                                controller: phone,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  new LengthLimitingTextInputFormatter(8),
                                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                ],
                                textAlign: TextAlign.center,
                                style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor.withOpacity(0.8)),
                                decoration: InputDecoration(
                                  labelText: "Teléfono",
                                  hintStyle: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor.withOpacity(0.8)),
                                  floatingLabelStyle: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor.withOpacity(0.8)),
                                  fillColor: Colors.white,
                                  labelStyle: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor.withOpacity(0.8)),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor.withOpacity(0.8),
                                      width: 2.0,
                                    ),
                                  ),
                                )
                            ),
                          ),),
                          Expanded(child: InkWell(
                            onTap: (){
                              _getContact();
                            },
                            child: CircleAvatar(
                              radius: 25.0,
                              backgroundColor: Theme.of(context).primaryColor,
                              child: Icon( Icons.contacts,color: Colors.white,),
                            ),
                          )),
                        ],
                      ),
                      isNombre?Container(
                          margin: EdgeInsets.only(top: 2,left: 50.0,right: 5.0,bottom: 15.0),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Contacto:',
                                  style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor),
                                ),
                                TextSpan(
                                  text: ' $nombre',
                                  style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor),
                                ),

                              ]
                            ),
                          ),
                      ):Padding(padding: EdgeInsets.all(5)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          Expanded(
                            child:  Container(
                              width: 200.0,
                              padding: EdgeInsets.only(top: 0,left: 30,right: 5,bottom: 15),
                              child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    new LengthLimitingTextInputFormatter(8),
                                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                  ],
                                  controller: catidad,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor.withOpacity(0.8)),
                                  decoration: InputDecoration(
                                    labelText: "Cantidad",
                                    floatingLabelStyle: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor.withOpacity(0.8)),
                                    labelStyle: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor.withOpacity(0.8)),
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
                                        color: Theme.of(context).primaryColor.withOpacity(0.8),
                                        width: 2.0,
                                      ),
                                    ),
                                  )
                              ),
                            ),),
                          Expanded(
                            child: Container(
                              width: 200.0,
                              padding: EdgeInsets.only(top: 0,left: 5,right: 30,bottom: 15),
                              child: TextFormField(
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor.withOpacity(0.8)),
                                  controller: code,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    new LengthLimitingTextInputFormatter(4),
                                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                  ],
                                  decoration: InputDecoration(
                                    labelText: "Código (1234)",
                                    floatingLabelStyle: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor.withOpacity(0.8)),
                                    labelStyle: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor.withOpacity(0.8)),
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
                                        color: Theme.of(context).primaryColor.withOpacity(0.8),
                                        width: 2.0,
                                      ),
                                    ),
                                  )
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 35.0,top: 15.0,bottom: 15.0),
                        alignment: Alignment.centerRight,

                        child: ElevatedButton(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 15,bottom: 15,right: 8,left: 8),
                              child: Text(
                                  "  Transferir  ".toUpperCase(),
                                  style: TextStyle(fontSize: 14)
                              ),
                            ),
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18.0),
                                        side: BorderSide(color: Theme.of(context).primaryColor)
                                    )
                                )
                            ),
                            onPressed: () async{
                              String tel= phone.text;
                              String cod = code.text;
                              String cant=  catidad.text;
                              if(tel.length==8&&cod.length==4&&cant.isNotEmpty){
                                var numbers = '*234*1*$tel*$cod*$cant#';
                                bool? res = await FlutterPhoneDirectCaller.callNumber(numbers);
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
                                phone.clear();
                                code.clear();
                                catidad.clear();
                                isNombre= false;
                                nombre="";
                                setState(() {

                                });
                            }),
                      ),

                      Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 1.5,
                                spreadRadius: 1.5,
                                offset: Offset(0, 1),
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(50.0))
                        ),
                        margin: EdgeInsets.only(top: 50.0,left: 20.0,right: 20.0,bottom: 35.0),
                        child: ElevatedButton(
                          onPressed: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>Cambiar_Password()));
                          },
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
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0,right: 15.0,top: 15.0,bottom: 15.0),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    radius: 30.0,
                                    backgroundColor: Theme.of(context).primaryColor,
                                    child: Icon(
                                      Icons.vpn_key_rounded,
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
                                          Text('Cambiar contraseña',
                                            style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold,fontSize: 16.0,color:Theme.of(context).primaryColor),
                                            overflow:TextOverflow.ellipsis ,
                                          ),
                                          SizedBox(height: 2.0,),
                                          Text('Opción para cambiar el pin de trasnferir',
                                            style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.w200,fontSize: 11.0,color:Theme.of(context).primaryColor),
                                            overflow:TextOverflow.ellipsis ,
                                          ),
                                        ],
                                      ),
                                    ),
                                  )

                                ]

                            ),
                          ),
                        ),
                      )

                    ],
                  ),
                )
            )
        )
    );
  }
  _getContact() async {
    nombre='';
    final FullContact contact =
    await FlutterContactPicker.pickFullContact();
    var number =contact.phones.first.number?.replaceAll(" ", "").replaceAll("+53", "");
    phone.text=number.toString();
    nombre=contact.name?.nickName;
    isNombre = true;
    setState(() {

    });


  }
}


