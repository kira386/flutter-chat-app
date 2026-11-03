import 'package:flutter/material.dart';
import '../services/chat_api.dart';
class ConversationsPage extends StatefulWidget{const ConversationsPage({super.key});@override State<ConversationsPage> createState()=>_ConversationsPageState();}
class _ConversationsPageState extends State<ConversationsPage>{final api=ChatApi();late Future<List<dynamic>> future;@override void initState(){super.initState();future=api.conversations();}
@override Widget build(BuildContext context)=>Scaffold(appBar:AppBar(title:const Text('PingLine chats')),body:FutureBuilder<List<dynamic>>(future:future,builder:(context,s){if(s.connectionState==ConnectionState.waiting)return const Center(child:CircularProgressIndicator());if(s.hasError)return Center(child:Text('API error: ${s.error}'));final rows=s.data??[];if(rows.isEmpty)return const Center(child:Text('No conversations yet.'));return ListView.builder(itemCount:rows.length,itemBuilder:(context,i){final c=rows[i];return ListTile(leading:const CircleAvatar(child:Icon(Icons.person)),title:Text(c['name']??''),subtitle:Text(c['last_message']??''));});}));}
}
