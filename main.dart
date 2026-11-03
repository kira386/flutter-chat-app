import 'package:flutter/material.dart';
import 'screens/conversations_page.dart';
void main()=>runApp(const PingLineApp());
class PingLineApp extends StatelessWidget{const PingLineApp({super.key});@override Widget build(BuildContext context)=>MaterialApp(title:'PingLine',debugShowCheckedModeBanner:false,theme:ThemeData(colorSchemeSeed:Colors.teal,useMaterial3:true),home:const ConversationsPage());}
