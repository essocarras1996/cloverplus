import 'package:cloverplus/Acerca_de.dart';
import 'package:cloverplus/Calls/Call.dart';
import 'package:cloverplus/Datos_Moviles/Datos_Moviles.dart';
import 'package:cloverplus/Donar/Donar.dart';
import 'package:cloverplus/Helper/Operations.dart';
import 'package:cloverplus/HistorialDeCambios/Historial.dart';
import 'package:cloverplus/Nauta/Nauta.dart';
import 'package:cloverplus/ui/Prueba.dart';
import 'package:cloverplus/ui/app_provider.dart';
import 'package:cloverplus/ui/colorTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Planes_Etecsa/Planes_Etecsa.dart';
import 'Saldo/Saldo.dart';
import 'Servicios/Servicios.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked_themes/stacked_themes.dart';

 Future main() async{
   WidgetsFlutterBinding.ensureInitialized();
   await ThemeManager.initialise();
   SharedPreferences.getInstance().then((pref){
      var themeColor =pref.getString('ThemeMode');
      if(themeColor=='dark'){
        activeTheme = darkTheme;
      }else if(themeColor=='green'){
        activeTheme = greenTheme;
      }else if(themeColor=='lightBlue'){
        activeTheme = lightBlueTheme;
      }else if(themeColor=='amber'){
        activeTheme = amberTheme;
      }else if(themeColor=='yellow'){
        activeTheme = yellowTheme;
      }else if(themeColor=='cyanAccent'){
        activeTheme = cyanAccentTheme;
      }else if(themeColor=='deepPurple'){
        activeTheme = deepPurpleTheme;
      }else if(themeColor=='pink'){
        activeTheme = pinkTheme;
      }else if(themeColor=='deepPurpleAccent'){
        activeTheme = deepPurpleAccentTheme;
      }else if(themeColor=='indigo'){
        activeTheme = indigoTheme;
      }else if(themeColor=='lime'){
        activeTheme = limeTheme;
      }else if(themeColor=='teal'){
        activeTheme = tealTheme;
      }else if(themeColor=='orange'){
        activeTheme = orangeTheme;
      }else if(themeColor=='purple'){
        activeTheme = purpleTheme;
      }else if(themeColor=='cyan'){
        activeTheme = cyanTheme;
      }else if(themeColor=='red'){
        activeTheme = redTheme;
      }else {
        activeTheme = blueTheme;
      }
      runApp(MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context)=>AppInfoProvider(activeTheme),),
        ],
        child: MyApp(),
      ));
   });


}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<AppInfoProvider>(context);
    return MaterialApp(
      title: 'CloverPlus',
      debugShowCheckedModeBanner: false,
      theme: themeNotifier.getTheme,/*ThemeData(
        brightness: Brightness.light,
        primarySwatch: Theme.of(context).primaryColor,
      ),*/
      home: const MyHomePage(title: 'CloverPlus'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static var _scaffoldKey= new GlobalKey<ScaffoldState>();
late List<Operation> operations=[
  Operation(Icons.call, 'Llamadas', 'Realice llamadas de manera fácil',Call()),
  Operation(Icons.perm_data_setting_rounded, 'Datos Móviles', 'Servicios de Internet y Correo',Datos_Moviles()),
  Operation(Icons.wysiwyg_outlined, 'Planes Etecsa', 'Servicios de SMS, Voz y Plan Amigos',Planes_Etecsa()),
  Operation(Icons.wifi, 'Nauta', 'Servicios de Internet Nauta',Nauta()),
  Operation(Icons.monetization_on_rounded, 'Saldo', 'Gestione el balance de su cuenta',Saldo()),
  Operation(Icons.settings, 'Servicios', 'Servicios útiles',Servicios())
];


  @override
  Widget build(BuildContext context) {
    SystemUiOverlayStyle overlayStyle = SystemUiOverlayStyle(
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,//color bottomBar
      systemNavigationBarDividerColor: Colors.white,// color de dividir bottomBar de screen es una linea
      /*systemNavigationBarColor: SelectColor.parseColor("#120c6e"),
      systemNavigationBarDividerColor: SelectColor.parseColor("#120c6e"),*/
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,

    );
    SystemChrome.setSystemUIOverlayStyle(overlayStyle);

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'CloverPlus',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontFamily: 'Ubuntu'),
        ),
        leading:  Padding(
          padding: const EdgeInsets.only(top: 4.0,left: 5.0),
          child: IconButton(icon: Icon(Icons.sort_outlined,color: Colors.white, size: 32,), onPressed: () {
            ShowMenu();
          },),
        ),
      ),
      key:_scaffoldKey,
      drawer: ClipRRect(
        borderRadius: BorderRadius.only(topRight: Radius.circular(25.0),bottomRight:Radius.circular(25.0) ),
        child: Drawer(
          child: Container(
            color: Color.fromRGBO(227, 248, 248, 0.30196078431372547),
            child: ListView(
              // Importante: elimina cualquier padding del ListView.
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: Container(
                      child: Center(
                          child: Column(children:
                          [
                            new Image(
                              width: 90.0,
                              image: AssetImage('assets/logo.png'),
                            ),
                            Text('CloverPlus',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25.0,fontFamily: 'Ubuntu'),)
                          ]
                            , )
                      )
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4.5,
                        spreadRadius: 3.5,
                        offset: Offset(0, 2.3),
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25.0),
                      bottomRight: Radius.circular(25.0),
                      bottomLeft: Radius.circular(25.0),
                    ),
                  ),
                ),


                ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.palette,color: Theme.of(context).primaryColor),
                  ),
                  title: Text('Temas',style: TextStyle(color: Theme.of(context).primaryColor,fontFamily: 'Ubuntu',fontWeight: FontWeight.bold)),
                  onTap: () {
                    // // Actualiza el estado de la aplicación
                    // ...
                    // Luego cierra el drawer
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>Prueba()));
                  },
                ),
                ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.history_edu_sharp,color: Theme.of(context).primaryColor),
                  ),
                  title: Text('Historial de cambios',style: TextStyle(color: Theme.of(context).primaryColor,fontFamily: 'Ubuntu',fontWeight: FontWeight.bold)),
                  onTap: () {
                    // // Actualiza el estado de la aplicación
                    // ...
                    // Luego cierra el drawer
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>Historial_de_Cambios()));
                  },
                ),
                ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.monetization_on,color: Theme.of(context).primaryColor),
                  ),
                  title: Text('Donar',style: TextStyle(color: Theme.of(context).primaryColor,fontFamily: 'Ubuntu',fontWeight: FontWeight.bold)),
                  onTap: () {
                    // // Actualiza el estado de la aplicación
                    // ...
                    // Luego cierra el drawer
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>Donar()));
                  },
                ),
                ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.info,color: Theme.of(context).primaryColor),
                  ),
                  title: Text('Acerca de',style: TextStyle(color: Theme.of(context).primaryColor,fontFamily: 'Ubuntu',fontWeight: FontWeight.bold)),
                  onTap: () {
                    // // Actualiza el estado de la aplicación
                    // ...
                    // Luego cierra el drawer
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>Acerca_De()));
                  },
                ),
              ],
            ),
          ),

        ),
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
                           overlayColor: MaterialStateProperty.all<Color>(Theme.of(context).primaryColor.withOpacity(0.5)/*shade50*/),
                           backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                           shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                               RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(50.0),

                               )
                           )
                       ),
                       onPressed: (){
                         Navigator.push(
                             context,
                             MaterialPageRoute(
                                 builder: (context) =>operations[index].route));
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
        ),

      ),
    );
  }
static ShowMenu(){
  _scaffoldKey.currentState!.openDrawer();
}
}
