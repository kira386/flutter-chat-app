<?php
require_once __DIR__.'/../config/config.php';
function db():PDO{static $p=null;if(!$p)$p=new PDO('mysql:host='.DB_HOST.';dbname='.DB_NAME.';charset=utf8mb4',DB_USER,DB_PASS,[PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION,PDO::ATTR_DEFAULT_FETCH_MODE=>PDO::FETCH_ASSOC]);return $p;}
function body():array{$d=json_decode(file_get_contents('php://input'),true);return is_array($d)?$d:[];}
function respond(array $d,int $s=200):never{http_response_code($s);header('Content-Type: application/json');echo json_encode($d);exit;}
function user():array{$h=$_SERVER['HTTP_AUTHORIZATION']??'';if(!preg_match('/Bearer\s+(.+)/',$h,$m))respond(['error'=>'Unauthorized'],401);$q=db()->prepare("SELECT u.id,u.name FROM tokens t JOIN users u ON u.id=t.user_id WHERE t.token_hash=? AND t.expires_at>NOW()");$q->execute([hash('sha256',trim($m[1]))]);$u=$q->fetch();if(!$u)respond(['error'=>'Unauthorized'],401);return $u;}
