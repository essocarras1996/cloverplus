import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Historial_de_Cambios extends StatefulWidget {
  const Historial_de_Cambios({Key? key}) : super(key: key);

  @override
  _Historial_de_CambiosState createState() => _Historial_de_CambiosState();
}

class _Historial_de_CambiosState extends State<Historial_de_Cambios> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        title:Text('Historial de Cambios',style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold),),
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0,bottom: 10.0,left: 20.0,right: 20.0),
                  child: Text('Versión: 4.0.0',style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor), overflow: TextOverflow.ellipsis,),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2.0,right: 15.0,left: 15.0,bottom: 2.0),
                  child: Divider(
                    color: Theme.of(context).primaryColor.withOpacity(0.5),
                    height: 4.0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0,bottom: 0.0,left: 20.0,right: 20.0),
                  child: Text('- Implementación de nuevo Diseño Visual',style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor.withOpacity(0.6)), overflow: TextOverflow.ellipsis,),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 2.0,bottom: 0.0,left: 20.0,right: 20.0),
                  child: Text('- Añadido: Paquetes combinados',style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor.withOpacity(0.6)), overflow: TextOverflow.ellipsis,),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 2.0,bottom: 0.0,left: 20.0,right: 20.0),
                  child: Text('- Añadido: Menu lateral',style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor.withOpacity(0.6)), overflow: TextOverflow.ellipsis,),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 2.0,bottom: 0.0,left: 20.0,right: 20.0),
                  child: Text('- Añadido: Sección de donaciones',style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor.withOpacity(0.6)), overflow: TextOverflow.ellipsis,),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 2.0,bottom: 0.0,left: 20.0,right: 20.0),
                  child: Text('- Añadido: Nuevos temas de colores',style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor.withOpacity(0.6)), overflow: TextOverflow.ellipsis,),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 2.0,bottom: 10.0,left: 20.0,right: 20.0),
                  child: Text('- Eliminado: Creación de cuentas de AppleID',style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor.withOpacity(0.6)), overflow: TextOverflow.ellipsis,),
                ),


                Padding(
                  padding: const EdgeInsets.only(top: 10.0,bottom: 10.0,left: 20.0,right: 20.0),
                  child: Text('Versión: 3.2',style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor), overflow: TextOverflow.ellipsis,),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2.0,right: 15.0,left: 15.0,bottom: 2.0),
                  child: Divider(
                    color: Theme.of(context).primaryColor.withOpacity(0.5),
                    height: 4.0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0,bottom: 0.0,left: 20.0,right: 20.0),
                  child: Text('- Compatibilidad Android 10',style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor.withOpacity(0.6)), overflow: TextOverflow.ellipsis,),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 2.0,bottom: 0.0,left: 20.0,right: 20.0),
                  child: Text('- Nuevas Tarifas de Etecsa incluidas',style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor.withOpacity(0.6)), overflow: TextOverflow.ellipsis,),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 2.0,bottom: 0.0,left: 20.0,right: 20.0),
                  child: Text('- Arreglos en la sección nauta',style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor.withOpacity(0.6)), overflow: TextOverflow.ellipsis,),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 2.0,bottom: 0.0,left: 20.0,right: 20.0),
                  child: Text('- Arreglos al capturar el tiempo en Wifi Nauta',style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor.withOpacity(0.6)), overflow: TextOverflow.ellipsis,),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 2.0,bottom: 0.0,left: 20.0,right: 20.0),
                  child: Text('- Arreglos al capturar el tiempo en la WIFI (Nauta)',style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor.withOpacity(0.6)), overflow: TextOverflow.ellipsis,),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 2.0,bottom: 0.0,left: 20.0,right: 20.0),
                  child: Text('- Arreglos de los precios en Moneda Nacional',style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor.withOpacity(0.6)), overflow: TextOverflow.ellipsis,),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 2.0,bottom: 10.0,left: 20.0,right: 20.0),
                  child: Text('- Arreglos de errores encontrados',style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor.withOpacity(0.6)), overflow: TextOverflow.ellipsis,),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 10.0,bottom: 10.0,left: 20.0,right: 20.0),
                  child: Text('Versión: 3.1',style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor), overflow: TextOverflow.ellipsis,),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2.0,right: 15.0,left: 15.0,bottom: 2.0),
                  child: Divider(
                    color: Theme.of(context).primaryColor.withOpacity(0.5),
                    height: 4.0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0,bottom: 0.0,left: 20.0,right: 20.0),
                  child: Text('- Añadido: Opción crear cuenta AppleID',style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor.withOpacity(0.6)), overflow: TextOverflow.ellipsis,),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 2.0,bottom: 0.0,left: 20.0,right: 20.0),
                  child: Text('- Añadido: Opción en el menú nauta Retomar Usuario',style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor.withOpacity(0.6)), overflow: TextOverflow.ellipsis,),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 2.0,bottom: 0.0,left: 20.0,right: 20.0),
                  child: Text('- Arreglos en la sección WIFI Nauta',style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor.withOpacity(0.6)), overflow: TextOverflow.ellipsis,),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 2.0,bottom: 0.0,left: 20.0,right: 20.0),
                  child: Text('- Arreglos al capturar el tiempo en la Wifi Nauta',style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor.withOpacity(0.6)), overflow: TextOverflow.ellipsis,),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 2.0,bottom: 0.0,left: 20.0,right: 20.0),
                  child: Text('- Añadido: Datos de Nauta Hogar',style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor.withOpacity(0.6)), overflow: TextOverflow.ellipsis,),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 2.0,bottom: 0.0,left: 20.0,right: 20.0),
                  child: Text('- Burbuja flotante mejorada al stilo ETK(Beta)',style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor.withOpacity(0.6)), overflow: TextOverflow.ellipsis,),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 2.0,bottom: 10.0,left: 20.0,right: 20.0),
                  child: Text('- Arreglo de errores encontrados',style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor.withOpacity(0.6)), overflow: TextOverflow.ellipsis,),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 10.0,bottom: 10.0,left: 20.0,right: 20.0),
                  child: Text('Versión: 3.0',style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor), overflow: TextOverflow.ellipsis,),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2.0,right: 15.0,left: 15.0,bottom: 2.0),
                  child: Divider(
                    color: Theme.of(context).primaryColor.withOpacity(0.5),
                    height: 4.0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0,bottom: 0.0,left: 20.0,right: 20.0),
                  child: Text('- Añadido: Selección de tema de la apk',style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor.withOpacity(0.6)), overflow: TextOverflow.ellipsis,),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 2.0,bottom: 0.0,left: 20.0,right: 20.0),
                  child: Text('- Arreglos de diseño',style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor.withOpacity(0.6)), overflow: TextOverflow.ellipsis,),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 2.0,bottom: 10.0,left: 20.0,right: 20.0),
                  child: Text('- Arreglo de errores encontrados',style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor.withOpacity(0.6)), overflow: TextOverflow.ellipsis,),
                ),


                Padding(
                  padding: const EdgeInsets.only(top: 10.0,bottom: 10.0,left: 20.0,right: 20.0),
                  child: Text('Versión: 2.3.1',style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor), overflow: TextOverflow.ellipsis,),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2.0,right: 15.0,left: 15.0,bottom: 2.0),
                  child: Divider(
                    color: Theme.of(context).primaryColor.withOpacity(0.5),
                    height: 4.0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0,bottom: 10.0,left: 20.0,right: 20.0),
                  child: Text('- Arreglos de errores encontrados',style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor.withOpacity(0.6)), overflow: TextOverflow.ellipsis,),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 10.0,bottom: 10.0,left: 20.0,right: 20.0),
                  child: Text('Versión: 2.3',style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor), overflow: TextOverflow.ellipsis,),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2.0,right: 15.0,left: 15.0,bottom: 2.0),
                  child: Divider(
                    color: Theme.of(context).primaryColor.withOpacity(0.5),
                    height: 4.0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0,bottom: 0.0,left: 20.0,right: 20.0),
                  child: Text('- Añadido: Nuevos Servicios',style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor.withOpacity(0.6)), overflow: TextOverflow.ellipsis,),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 2.0,bottom: 0.0,left: 20.0,right: 20.0),
                  child: Text('- Añadido: Activar 3G',style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor.withOpacity(0.6)), overflow: TextOverflow.ellipsis,),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 2.0,bottom: 0.0,left: 20.0,right: 20.0),
                  child: Text('- Añadido: Activar 4G',style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor.withOpacity(0.6)), overflow: TextOverflow.ellipsis,),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 2.0,bottom: 0.0,left: 20.0,right: 20.0),
                  child: Text('- Añadido: Información de Red',style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor.withOpacity(0.6)), overflow: TextOverflow.ellipsis,),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 2.0,bottom: 10.0,left: 20.0,right: 20.0),
                  child: Text('- Añadido: Vaciar Bandeja de Correos',style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor.withOpacity(0.6)), overflow: TextOverflow.ellipsis,),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 10.0,bottom: 10.0,left: 20.0,right: 20.0),
                  child: Text('Versión: 2.2',style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor), overflow: TextOverflow.ellipsis,),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2.0,right: 15.0,left: 15.0,bottom: 2.0),
                  child: Divider(
                    color: Theme.of(context).primaryColor.withOpacity(0.5),
                    height: 4.0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0,bottom: 0.0,left: 20.0,right: 20.0),
                  child: Text('- Añadido: Tráfico de red flotante',style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor.withOpacity(0.6)), overflow: TextOverflow.ellipsis,),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 2.0,bottom: 10.0,left: 20.0,right: 20.0),
                  child: Text('- Correción de errores',style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor.withOpacity(0.6)), overflow: TextOverflow.ellipsis,),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 10.0,bottom: 10.0,left: 20.0,right: 20.0),
                  child: Text('Versión: 2.1',style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor), overflow: TextOverflow.ellipsis,),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2.0,right: 15.0,left: 15.0,bottom: 2.0),
                  child: Divider(
                    color: Theme.of(context).primaryColor.withOpacity(0.5),
                    height: 4.0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0,bottom:0.0,left: 20.0,right: 20.0),
                  child: Text('- Añadido: Modo LTE',style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor.withOpacity(0.6)), overflow: TextOverflow.ellipsis,),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 2.0,bottom:0.0,left: 20.0,right: 20.0),
                  child: Text('- Añadido: Nuevos paquetes de Internet',style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor.withOpacity(0.6)), overflow: TextOverflow.ellipsis,),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 2.0,bottom:0.0,left: 20.0,right: 20.0),
                  child: Text('- Añadido: Adelanta Saldo',style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor.withOpacity(0.6)), overflow: TextOverflow.ellipsis,),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 2.0,bottom:20.0,left: 20.0,right: 20.0),
                  child: Text('- Correción de errores',style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor.withOpacity(0.6)), overflow: TextOverflow.ellipsis,),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
