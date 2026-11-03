# PingLine API

Authenticate with `POST /api/login.php`, then pass `Authorization: Bearer TOKEN`.

- `POST /api/register.php`: `{ "name":"A", "email":"a@example.com", "password":"long-password" }`
- `POST /api/login.php`: `{ "email":"a@example.com", "password":"long-password" }`
- `GET /api/conversations.php`: recent one-to-one conversations
- `GET /api/messages.php?with=USER_ID`: latest 50 messages
- `POST /api/messages.php`: `{ "receiver_id": 2, "message": "Hello" }`

The mobile starter's API class expects a token to be assigned after login. Implement the login form and
secure token storage before treating the Flutter client as a complete end-user application.
REST polling is not instant push. WebSocket transport is a future enhancement.
