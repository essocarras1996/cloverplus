import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

class Donar extends StatelessWidget {

  final TextEditingController monto = TextEditingController();
  final TextEditingController pin = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Donar',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontFamily: 'Ubuntu', fontSize: 19),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
      ),
      body: Container(
        color: Theme.of(context).primaryColor,
        child: Center(
          child:  Container(
            margin: EdgeInsets.only(top: 10.0),
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
              child: ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50)),
                child: DefaultTabController(
                  length: 2,
                  child: Scaffold(
                    appBar: TabBar(
                      indicatorColor: Theme.of(context).primaryColor,
                      onTap: (index) {
                        // Tab index when user select it, it start from zero
                      },
                      tabs: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0,bottom: 15.0),
                          child: Text("Transferencia Bancaria",style: TextStyle(fontFamily: "Ubuntu",color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold,fontSize: 13.0),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0,bottom: 15.0),
                          child: Text("Saldo Móvil",style: TextStyle(fontFamily: "Ubuntu",color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold,fontSize: 13.0),),
                        ),

                      ],
                    ),


                    body: TabBarView(
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                  padding: EdgeInsets.all(35.0),
                                  child: Text(
                                    "Si le ha sido de utilidad la aplicación y desea ayudar a los desarrolladores, puede hacerlo en esta  sección a través de Transferencia Bancaria.",
                                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,fontFamily: "Ubuntu",color: Theme.of(context).primaryColor),
                                    textAlign: TextAlign.justify,
                                  )),

                              Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                    "Número de cuenta:",
                                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,fontFamily: "Ubuntu",color: Theme.of(context).primaryColor),
                                    textAlign: TextAlign.justify,
                                  )),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30.0),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromRGBO(227, 248, 248, 1.0),
                                      blurRadius: 5.5,
                                      spreadRadius: 5.5,
                                      offset: Offset(0, 1),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: SelectableText(
                                      "9205 1299 7494 0364",
                                      showCursor: true,
                                      cursorWidth: 2,
                                      cursorColor: Color.fromRGBO(22, 172, 172, 1.0),
                                      toolbarOptions: ToolbarOptions(copy: true,selectAll: true),
                                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal,fontFamily: "Ubuntu",color: Theme.of(context).primaryColor),
                                      textAlign: TextAlign.justify,
                                    )),

                              ),
                            ],

                          ),
                        ),
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                  padding: EdgeInsets.all(35.0),
                                  child: Text(
                                    "Si le ha sido de utilidad la aplicación y desea ayudar a los desarrolladores, puede hacerlo en esta  sección a través de Saldo Móvil.",
                                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,fontFamily: "Ubuntu",color: Theme.of(context).primaryColor),
                                    textAlign: TextAlign.justify,
                                  )),
                              Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                    "Donar con Saldo Móvil:",
                                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,fontFamily: "Ubuntu",color: Theme.of(context).primaryColor),
                                    textAlign: TextAlign.justify,
                                  )),
                              Padding(
                                padding: EdgeInsets.only(top: 10,left: 50,right: 50,bottom: 20),
                                child: TextFormField(
                                    controller: monto,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.monetization_on,color: Theme.of(context).primaryColor.withOpacity(0.8),),
                                      counterStyle: TextStyle(fontFamily: 'Ubuntu',color: Theme.of(context).primaryColor),
                                      labelText: "Cantidad (CUP)",

                                      fillColor: Theme.of(context).primaryColor,
                                      hoverColor: Theme.of(context).primaryColor,
                                      focusColor: Theme.of(context).primaryColor,
                                      suffixStyle: TextStyle(fontFamily: 'Ubuntu',color: Theme.of(context).primaryColor),
                                      hintStyle: TextStyle(fontFamily: 'Ubuntu',color: Theme.of(context).primaryColor),
                                      labelStyle: TextStyle(fontFamily: 'Ubuntu',color: Theme.of(context).primaryColor),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25.0),
                                        borderSide: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25.0),
                                        borderSide: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                          width: 2.0,
                                        ),
                                      ),
                                    )
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10,left: 50,right: 50,bottom: 20),
                                child: TextFormField(
                                    controller: pin,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.pin,color: Theme.of(context).primaryColor.withOpacity(0.8),),
                                      counterStyle: TextStyle(fontFamily: 'Ubuntu',color: Theme.of(context).primaryColor),
                                      labelText: "PIN (1234)",
                                      suffixStyle: TextStyle(fontFamily: 'Ubuntu',color: Theme.of(context).primaryColor),
                                      hintStyle: TextStyle(fontFamily: 'Ubuntu',color: Theme.of(context).primaryColor),
                                      labelStyle: TextStyle(fontFamily: 'Ubuntu',color: Theme.of(context).primaryColor),
                                      fillColor: Theme.of(context).primaryColor,
                                      hoverColor: Theme.of(context).primaryColor,
                                      focusColor: Theme.of(context).primaryColor,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25.0),
                                        borderSide: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25.0),
                                        borderSide: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                          width: 2.0,
                                        ),
                                      ),
                                    )
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(bottom: 40.0 ),
                                child: ElevatedButton(
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Text(
                                          "  Donar  ".toUpperCase(),
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
                                      String cantidad= monto.text;
                                      String code= pin.text;
                                      await launch('tel:*234*1*54471038*'+code+'*'+cantidad+'#');
                                      monto.clear();
                                      pin.clear();
                                    }),
                              ),
                            ],

                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        ),
    );
  }
}
