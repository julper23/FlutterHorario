import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CalendarData extends ChangeNotifier {
  // todos los huecos que hay
  var Huecos_horas = [0, 1, 2, 3, 4, 5, 6, 7];  

  //Los minutos de los huecos
  var minutosHueco = [55, 55, 55, 55, 25, 55, 55, 55];
  
  //Dias
  var NomDias = ["lunes","martes","miercoles","jueves","viernes"];

  //Horas
  var horas = ["08:00","08:55","09:50","10:45","11:40","12:05","13:00","13:55"];
  var horasSalida = ["08:55","09:50","10:45","11:40","12:05","13:00","13:55","14:50"];

  //Informacion de las asignaturas
  var asignaturas = ["","ACC","PMDM","DI","PSP","EIE","SGE"];
  var asignaturaProfe = ["","Miren","Santi","Martin","Beñat","Karmele","Aritz"];
  var aulas =["","104","104","104","104","107","104"];
  var colores = [Colors.amber[100],Colors.amber,Colors.blue,Colors.green,Colors.red,Colors.lime,Colors.pink[200]];
 
  //Array para saber cada dia cuantos huecos hay, que asignaturas hay en cada hueco y la duracion de estos
  var dias = [
    //huecos,asignaturas,tiempo
    [[5],[0,1,0,2,3],[111,111,25,55,111]],//Lunes
    [[6],[0,4,1,0,1,5],[55,111,55,25,55,111]],//Martes
    [[6],[0,3,4,0,4,6],[55,111,55,25,55,111]],//Miercoles
    [[6],[2,3,6,0,1,5],[111,55,55,25,111,55]],//Jueves
    [[5],[6,2,0,3,0],[111,111,25,111,55]] //Viernes
  ];

}
