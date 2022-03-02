
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Acerca_De extends StatelessWidget {
  const Acerca_De({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Acerca De',
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
              borderRadius: BorderRadius.only(topRight: Radius.circular(50.0),topLeft: Radius.circular(50.0)),
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
              child: SingleChildScrollView(
                  child: Column(
                      children: [
                        FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                 Padding(
                                   padding: const EdgeInsets.only(right: 15.0),
                                   child: Image(
                                    width: 90.0,
                                    image: AssetImage('assets/logo.png'),
                                ),
                                 ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Text('CloverPlus',style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold,fontSize: 20.0,fontFamily: 'Ubuntu'),),
                                      Text('Versión: 4.0.0',style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.normal,fontSize: 16.0,fontFamily: 'Ubuntu'),)

                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 35.0,right: 35.0,bottom: 20.0),
                          child: Divider(
                            color: Theme.of(context).primaryColor.withOpacity(0.5),
                            height: 20,
                            thickness: 1.5,
                            indent: 20,
                            endIndent: 20,
                          ),
                        ),

                        Text('Desarrollada por:',style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold,fontSize: 15.0,fontFamily: 'Ubuntu'),),
                        Padding(
                          padding: const EdgeInsets.only(left: 35.0,right: 35.0,top: 40.0,bottom: 40.0),
                          child: Text('Lic. Ernesto E. Sánchez Socarrás',style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.normal,fontSize: 15.0,fontFamily: 'Ubuntu'),),
                        ),
                        Text('Contacto:',style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold,fontSize: 15.0,fontFamily: 'Ubuntu'),),

                        Padding(
                          padding: const EdgeInsets.only(left: 35.0,right: 35.0,bottom: 8.0,top: 8.0),
                          child: Text('Email: essocarras@gmail.com',style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.normal,fontSize: 15.0,fontFamily: 'Ubuntu'),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                       ),

                        Padding(
                          padding: const EdgeInsets.only(left: 35.0,right: 35.0,bottom: 10.0),
                          child: Divider(
                            color: Theme.of(context).primaryColor.withOpacity(0.5),
                            height: 20,
                            thickness: 1.5,
                            indent: 20,
                            endIndent: 20,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 0.0, bottom: 30.0),
                          child: Text('Agradecimientos:',style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold,fontSize: 15.0,fontFamily: 'Ubuntu'),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 0.0,left: 45.0,right: 45.0),
                          child: Text('Gracias a todas las personas que de un modo u otro ayudaron a la creación de esta aplicación.',textAlign: TextAlign.justify,style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.normal,fontSize: 15.0,fontFamily: 'Ubuntu'),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0, bottom: 30.0),
                          child: Text('© 2019 - 2021',style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.normal,fontSize: 15.0,fontFamily: 'Ubuntu'),),
                        ),
                      ]

                  )
              ),
            ),
          ),

        ),
      ),
    );
  }
}
