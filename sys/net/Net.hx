package sys.net;

extern class Net {
  // static function createConnection():Socket; // new Socket + connect?
  // static function createServer(?allowHalfOpen:Bool, ?pauseOnConnect:Bool, ?connectionListener:Callback<Socket>):Server;
  static function isIP(input:String):Null<IPFamily>;
  static function isIPv4(input:String):Bool;
  static function isIPv6(input:String):Bool;
}

enum NetFamily {
  IP(sub:IPFamily);
  UDP;
  Unix;
}

enum IPFamily {
  IPv4;
  IPv6;
}

enum SocketAddress {
  Network(port:Int, family:String, address:String);
  Unix(name:String);
}
