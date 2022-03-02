import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DeleteFriend extends StatefulWidget {
  const DeleteFriend({Key? key}) : super(key: key);

  @override
  _DeleteFriendState createState() => _DeleteFriendState();
}

class _DeleteFriendState extends State<DeleteFriend> {
  TextEditingController phone = TextEditingController();
  late String? nombre='';
  late bool isNombre=false;

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        title:Text('Eliminar Amigo',style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold),),

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
                            child: Text('Introduce el número:',style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor),overflow: TextOverflow.ellipsis,textAlign: TextAlign.left,)),
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
                                        color: Theme.of(context).primaryColor.withOpacity(0.5),
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
                        Container(
                          margin: EdgeInsets.only(right: 35.0,top: 15.0,bottom: 15.0),
                          alignment: Alignment.centerRight,

                          child: ElevatedButton(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 15,bottom: 15,right: 8,left: 8),
                                child: Text(
                                    "  Eliminar  ".toUpperCase(),
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
                                if(tel.length==8){
                                  var numbers = '*133*4*2*2*$tel#';
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
                                isNombre= false;
                                nombre="";
                                setState(() {

                                });
                              }),
                        ),


                      ],
                    ),
                  )
              )
          )
      ),);
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
