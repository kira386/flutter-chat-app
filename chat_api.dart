import 'dart:convert';
import 'package:http/http.dart' as http;
class ChatApi{
 static const baseUrl='http://10.0.2.2/pingline/backend/public/api';
 String? token;
 Map<String,String> get headers=>{'Content-Type':'application/json',if(token!=null)'Authorization':'Bearer $token'};
 Future<List<dynamic>> conversations()async{final r=await http.get(Uri.parse('$baseUrl/conversations.php'),headers:headers);if(r.statusCode!=200)throw Exception('Could not load chats');return jsonDecode(r.body)['conversations'];}
 Future<List<dynamic>> messages(int otherId)async{final r=await http.get(Uri.parse('$baseUrl/messages.php?with=$otherId'),headers:headers);if(r.statusCode!=200)throw Exception('Could not load messages');return jsonDecode(r.body)['messages'];}
 Future<void> send(int receiverId,String message)async{final r=await http.post(Uri.parse('$baseUrl/messages.php'),headers:headers,body:jsonEncode({'receiver_id':receiverId,'message':message}));if(r.statusCode>=300)throw Exception('Message send failed');}
}
