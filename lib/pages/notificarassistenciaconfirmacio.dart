import 'package:app/app_localizations.dart';
import 'package:app/defaults/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

class Notificarassistenciaconfirmacio extends StatefulWidget {
  Notificarassistenciaconfirmacio({Key key}) : super(key: key);

  //final String title;

  @override
  _Notificarassistenciaconfirmacio createState() =>
      _Notificarassistenciaconfirmacio();
}

class _Notificarassistenciaconfirmacio
    extends State<Notificarassistenciaconfirmacio> {
  static bool activeButton = false;
  static bool isLoading = false;    
  Function submitAssistencia = (BuildContext context) {};

  @override
  void initState() {
    super.initState();
    submitAssistencia = (BuildContext context){
      isLoading = true;
      activeButton = false;
      var url =  Uri.parse('https://safetyout.herokuapp.com/assistance');
      http.post(url, body:{
        'user_id': "abcd",
        'dateTime': "15:00",
        'num_hours': "2",
      }).then((res) {
        if (res.statusCode == 201){
          setState(() {
              isLoading = false;
              activeButton = true;
            });
        }//Correcte, guardar, notificació assitència ok i tornar a pantalla discover
        else {
          setState(() {
              isLoading = false;
              activeButton = true;
            });
          showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    contentPadding: EdgeInsets.fromLTRB(24, 20, 24, 0),
                    content: SingleChildScrollView(
                        child: ListBody(
                      children: <Widget>[
                        Text(
                            AppLocalizations.of(context)
                                .translate("Ja has notificat assistència en aquest lloc, data i hora"),
                            style: TextStyle(fontSize: Constants.m(context))),
                      ],
                    )),
                    actions: <Widget>[
                      TextButton(
                        child: Text(
                            AppLocalizations.of(context).translate("Acceptar"),
                            style: TextStyle(color: Constants.black(context))),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                });
        }
      }).catchError((err) {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  contentPadding: EdgeInsets.fromLTRB(24, 20, 24, 0),
                  content: SingleChildScrollView(
                      child: ListBody(
                    children: <Widget>[
                      Text(
                          AppLocalizations.of(context)
                              .translate("Error_de_xarxa"),
                          style: TextStyle(fontSize: Constants.m(context))),
                    ],
                  )),
                  actions: <Widget>[
                    TextButton(
                      child: Text(
                          AppLocalizations.of(context).translate("Acceptar"),
                          style: TextStyle(color: Constants.black(context))),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              });
              
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Notificar assistència'),
        centerTitle: true,
        backgroundColor: Constants.white(context),
        actions: [
          IconButton(icon: const Icon(Icons.check_rounded), onPressed: () {}),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
              top: Constants.v2(context),
              left: Constants.h6(context),
              right: Constants.h6(context)),
          child: Column(
            children: <Widget>[
              Row(children: [
                Text(
                  "Parc de Pedralbes",
                  style: TextStyle(
                      color: Constants.black(context),
                      fontWeight: Constants.bolder,
                      fontSize: Constants.l(context)),
                ),
              ]),
              // Padding(
              // padding: EdgeInsets.only(top: Constants.v1(context)),
              //child:
              Row(children: [
                Text(
                  "Pedralbes, Barcelona",
                  style: TextStyle(
                      color: Constants.black(context),
                      fontWeight: Constants.bolder,
                      fontSize: Constants.m(context)),
                ),
              ]),
              //),
              Padding(
                padding: EdgeInsets.only(top: Constants.v3(context)),
                child: Row(children: [
                  SvgPicture.asset('assets/icons/placeholder.svg',
                      color: Constants.black(context),
                      height: Constants.xxl(context),
                      width: Constants.xxl(context)),
                  Padding(
                    padding: EdgeInsets.only(left: Constants.h1(context)),
                    child: Text(
                      "Ubicació",
                      style: TextStyle(
                          color: Constants.black(context),
                          fontSize: Constants.s(context)),
                    ),
                  ),
                ]),
              ),
              Padding(
                padding: EdgeInsets.only(top: Constants.v1(context)),
                child: Row(children: [
                  Icon(Icons.calendar_today_rounded,
                      size: Constants.xxl(context)),
                  Padding(
                    padding: EdgeInsets.only(left: Constants.h1(context)),
                    child: Text(
                      "Dia",
                      style: TextStyle(
                          color: Constants.black(context),
                          fontSize: Constants.s(context)),
                    ),
                  ),
                ]),
              ),
              Padding(
                padding: EdgeInsets.only(top: Constants.v1(context)),
                child: Row(children: [
                  Icon(Icons.watch_later_outlined,
                      size: Constants.xxl(context)),
                  Padding(
                    padding: EdgeInsets.only(left: Constants.h1(context)),
                    child: Text(
                      "Hora",
                      style: TextStyle(
                          color: Constants.black(context),
                          fontSize: Constants.s(context)),
                    ),
                  ),
                ]),
              ),
              Padding(
                padding: EdgeInsets.only(top: Constants.v3(context)),
                child: Row(children: [
                  Text(
                    "Amb qui t'agradaria assistir?",
                    style: TextStyle(
                        color: Constants.black(context),
                        fontWeight: Constants.bolder,
                        fontSize: Constants.l(context)),
                  ),
                ]),
              ),
              /*Row(children: [
              ListWheelScrollView(
                children: <Widget>[
                  const Text("Només jo"),
                  const Text("Bombolla 1"),
                  const Text("Bombolla 2")
                ],
                //onSelectedItemChanged: ,
                itemExtent: 50.0,
              )
            ]),*/
            ],
          ),
        ),
      ),
    );
  }
}
}
