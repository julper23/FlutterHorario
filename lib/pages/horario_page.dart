import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/data.dart';

class HorarioPage extends StatefulWidget {
  HorarioPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HorarioPageState createState() => _HorarioPageState();
}

class _HorarioPageState extends State<HorarioPage> {
  @override
  Widget build(BuildContext context) {
    var data = context.watch<CalendarData>();
    final barraHeight = 40.0;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          GestureDetector(
            child: SizedBox(
              height: barraHeight,
              child: Center(
                child: Column(
                  children: [
                    //margen superior
                    Container(
                      width: double.infinity,
                      height: 2,
                      color: Colors.white,
                    ),
                    Expanded(
                        flex: 1,
                        child: Container(
                          child: Row(
                            children: <Widget>[
                              Column(children: <Widget>[Container(width: 2,child:Text(""),)]),
                              Column(children: <Widget>[Container(width: 45,height:36,color: Colors.amber[100],child:Text(""),)]),
                              Column(children: <Widget>[Container(width: 2,child:Text(""),)]),
                              Expanded(
                                flex: 5,
                                child: Container(
                                  width: double.infinity,
                                  color: Colors.amber[100],
                                  padding: EdgeInsets.all(5),
                                  child: Column(
                                    children: <Widget>[Container(child:Text("L",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)))]
                                  ),
                                ),
                              ),
                              Column(children: <Widget>[Container(width: 2,child:Text(""),)]),
                              Expanded(
                                flex: 5,
                                child: Container(
                                  width: double.infinity,
                                  color: Colors.amber[100],
                                  padding: EdgeInsets.all(5),
                                  child: Column(
                                    children: <Widget>[Container(child:Text("M",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)))]
                                  ),
                                ),
                              ),
                              Column(children: <Widget>[Container(width: 2,child:Text(""),)]),
                              Expanded(
                                flex: 5,
                                child: Container(
                                  width: double.infinity,
                                  color: Colors.amber[100],
                                  padding: EdgeInsets.all(5),
                                  child: Column(
                                    children: <Widget>[Container(child:Text("X",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)))]
                                  ),
                                ),
                              ),
                              Column(children: <Widget>[Container(width: 2,child:Text(""),)]),
                              Expanded(
                                flex: 5,
                                child: Container(
                                  width: double.infinity,
                                  color: Colors.amber[100],
                                  padding: EdgeInsets.all(5),
                                  child: Column(
                                    children: <Widget>[Container(child:Text("J",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)))]
                                  ),
                                ),
                              ),
                              Column(children: <Widget>[Container(width: 2,child:Text(""),)]),
                              Expanded(
                                flex: 5,
                                child: Container(
                                  width: double.infinity,
                                  color: Colors.amber[100],
                                  padding: EdgeInsets.all(5),
                                  child: Column(
                                    children: <Widget>[Container(child:Text("V",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)))]
                                  ),
                                ),
                              ),
                              Column(children: <Widget>[Container(width: 2,child:Text(""),)]),
                            ]
                          )
                        )
                    ),
                    //margen inferior
                    Container(
                      width: double.infinity,
                      height: 2,
                      color: Colors.white,
                    )
                  ]
                )
              )
            ),
          ),
          Container(
            //hacemos que la app se adapte al tamaño de la pantalla
            height: MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top -
                kToolbarHeight -
                barraHeight -
                barraHeight,
            child: Row(
              children: [
                Container(
                  width: 2,
                  child: Column(
                    children: [
                      Text(''),
                    ],
                  ),
                ),
                Container(
                  width: 45,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                      children: [
                        for (var i in data.Huecos_horas) ...[
                          Expanded(
                            flex: data.minutosHueco[i],
                            child: Container(
                              width: double.infinity,
                              color: Colors.amber[100],
                              padding: EdgeInsets.all(5),
                              child: Column(
                                children: <Widget>[
                                  data.minutosHueco[i]<=25 ? Container(child:Text(""),) : Container(child:Text(data.horas[i]),),
                                  data.minutosHueco[i]>25 ? Container(child:Text("-"),): Container(),
                                  data.minutosHueco[i]>25 ? Container(child:Text(data.horasSalida[i]),): Container()
                                ]
                              ),
                            ),
                          ),
                          Divider(
                            height: 2,
                          )
                        ]
                      ],
                    ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 2,
                  child: Column(
                    children: [
                      Text(''),
                    ],
                  ),
                ),
                for(var y = 0; y< data.dias.length; y++) ...[
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        for(var x = 0; x< data.dias[y][0][0]; x++)...{
                            Expanded(
                            flex: data.dias[y][2][x],
                            child: Container(
                              width: double.infinity,
                              color: data.colores[data.dias[y][1][x]],
                              padding: EdgeInsets.all(5),
                              child: Column(
                                 //Solucion para alinear el contenido de la columna en el centro
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  //Asignatura
                                  if(data.asignaturas[data.dias[y][1][x]]!="")Text(
                                    data.asignaturas[data.dias[y][1][x]],
                                    style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                                    ),
                                  //Profesor
                                  if(data.asignaturaProfe[data.dias[y][1][x]]!="")Text(
                                    data.asignaturaProfe[data.dias[y][1][x]],
                                    style: TextStyle(fontSize: 12),
                                    ),
                                  //Aula
                                  if(data.aulas[data.dias[y][1][x]]!="")Text(
                                    data.aulas[data.dias[y][1][x]],
                                    style: TextStyle(fontSize: 12),
                                    ),
                                ]
                              ),
                            ),
                          ),
                          Divider(
                            height: 2,
                          )
                        }
                      ]
                    )
                  ),
                  //Separador entre dias
                  Container(
                    width: 2,
                    child: Column(
                      children: [
                        Text(''),
                      ],
                    ),
                  ),
                ]
              ],
            ),
          ),
                              Expanded(
                        flex: 1,
                        child: Container(
                          child: Row(
                            children: <Widget>[
                              Column(children: <Widget>[Container(width: 2,child:Text(""),)]),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  width: double.infinity,
                                  color: Colors.amber[100],
                                  padding: EdgeInsets.all(5),
                                  child: Column(
                                    children: <Widget>[Container(child:Text("®Julen Perez",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)))]
                                  ),
                                ),
                              ),
                              Column(children: <Widget>[Container(width: 2,child:Text(""),)]),
                            ]
                          )
                        )
                    ),
        ],
      ),
 
    );
  }
}
