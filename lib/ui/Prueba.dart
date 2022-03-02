import 'package:cloverplus/ui/colorTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app_provider.dart';
import 'package:provider/provider.dart';


class Prueba extends StatefulWidget {
  const Prueba({Key? key}) : super(key: key);

  @override
  _PruebaState createState() => _PruebaState();
}

class _PruebaState extends State<Prueba> {
  //late AppInfoProvider themeNotifier;

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<AppInfoProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Temas',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontFamily: 'Ubuntu'),
        ),
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
        child: Center(

          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0,bottom: 20.0,left: 15.0,right: 15.0),
                    child: Text('Seleccione un color:',textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontFamily: 'Ubuntu',color: Theme.of(context).primaryColor,fontSize: 20.0)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.purple,
                          radius: 30.0,
                          child: InkWell(
                            onTap: (){
                              onThemeChanged('purple',themeNotifier);
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.orange,
                          radius: 30.0,
                          child: InkWell(
                            onTap: (){
                              onThemeChanged('orange',themeNotifier);
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.teal,
                          radius: 30.0,
                          child: InkWell(
                            onTap: (){
                              onThemeChanged('teal',themeNotifier);
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.lime,
                          radius: 30.0,
                          child: InkWell(
                            onTap: (){
                              onThemeChanged('lime',themeNotifier);
                            },
                          ),
                        ),
                      ),

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.lightGreen,
                          radius: 30.0,
                          child: InkWell(
                            onTap: (){
                              onThemeChanged('greenAccent',themeNotifier);
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.indigo,
                          radius: 30.0,
                          child: InkWell(
                            onTap: (){
                              onThemeChanged('indigo',themeNotifier);
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.deepPurpleAccent,
                          radius: 30.0,
                          child: InkWell(
                            onTap: (){
                              onThemeChanged('deepPurpleAccent',themeNotifier);
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.green,
                          radius: 30.0,
                          child: InkWell(
                            onTap: (){
                              onThemeChanged('green',themeNotifier);
                            },
                          ),
                        ),
                      ),

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.pink,
                          radius: 30.0,
                          child: InkWell(
                            onTap: (){
                              onThemeChanged('pink',themeNotifier);
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.redAccent,
                          radius: 30.0,
                          child: InkWell(
                            onTap: (){
                              onThemeChanged('cyanAccent',themeNotifier);
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.cyan,
                          radius: 30.0,
                          child: InkWell(
                            onTap: (){
                              onThemeChanged('cyan',themeNotifier);
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.amberAccent,
                          radius: 30.0,
                          child: InkWell(
                            onTap: (){
                              onThemeChanged('yellow',themeNotifier);
                            },
                          ),
                        ),
                      ),


                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.red,
                          radius: 30.0,
                          child: InkWell(
                            onTap: (){
                              onThemeChanged('red',themeNotifier);
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.blue,
                          radius: 30.0,
                          child: InkWell(
                            onTap: (){
                              onThemeChanged('blue',themeNotifier);
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.lightBlueAccent,
                          radius: 30.0,
                          child: InkWell(
                            onTap: (){
                              onThemeChanged('lightBlue',themeNotifier);
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.amber,
                          radius: 30.0,
                          child: InkWell(
                            onTap: (){
                              onThemeChanged('amber',themeNotifier);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 30.0,
                          child: InkWell(
                            onTap: (){
                              onThemeChanged('dark',themeNotifier);
                            },
                          ),
                        ),
                      ),


                    ],
                  ),
                ],
              ),
            ),
          ),

        ),
      ),
    );
  }

  onThemeChanged(String value, AppInfoProvider themeNotifier) async{
    if(value=='dark'){
      themeNotifier.setTheme(darkTheme);
    }else if(value=='green'){
      themeNotifier.setTheme(greenTheme);
    }else if(value=='blue'){
      themeNotifier.setTheme(blueTheme);
    }else if(value=='lightBlue'){
      themeNotifier.setTheme(lightBlueTheme);
    }else if(value=='amber'){
      themeNotifier.setTheme(amberTheme);
    }else if(value=='yellow'){
      themeNotifier.setTheme(yellowTheme);
    }else if(value=='cyanAccent'){
      themeNotifier.setTheme(cyanAccentTheme);
    }else if(value=='deepPurple'){
      themeNotifier.setTheme(deepPurpleTheme);
    }else if(value=='pink'){
      themeNotifier.setTheme(pinkTheme);
    }else if(value=='deepPurpleAccent'){
      themeNotifier.setTheme(deepPurpleAccentTheme);
    }else if(value=='indigo'){
      themeNotifier.setTheme(indigoTheme);
    }else if(value=='greenAccent'){
      themeNotifier.setTheme(greenAccentTheme);
    }else if(value=='lime'){
      themeNotifier.setTheme(limeTheme);
    }else if(value=='teal'){
      themeNotifier.setTheme(tealTheme);
    }else if(value=='orange'){
      themeNotifier.setTheme(orangeTheme);
    }else if(value=='purple'){
      themeNotifier.setTheme(purpleTheme);
    }else if(value=='cyan'){
      themeNotifier.setTheme(cyanTheme);
    } else if(value=='red'){
      themeNotifier.setTheme(redTheme);
    }
    final pref =await SharedPreferences.getInstance();
    pref.setString('ThemeMode', value);



  }
}
