# flutter-chat-app
flutter-php chat application
# PingLine Chat

A Flutter chat client with a PHP/MySQL REST backend. The starter implements account registration,
login, conversation list and persistent message send/read endpoints.

## Features
- User registration and secure password storage
- Bearer-token authentication
- One-to-one conversations
- Message history with pagination
- Sender/receiver ownership checks
- Flutter conversation list and chat screen starter

## Setup
Import `database/pingline.sql`, configure `backend/config/config.php`, serve `backend/public`,
then set the Flutter API base URL. Run `flutter pub get` and `flutter run`.

This implementation uses REST polling, not WebSocket push. For true real-time chat, add
WebSocket infrastructure (for example, Ratchet or a managed realtime service), delivery/read receipts,
push notifications, abuse reporting, blocking and message rate limits.
