package haxe.io;

import haxe.Error;
import haxe.NoData;
import haxe.async.Event;

interface IReadable {
  final eventClose:Event<NoData>;
  final eventData:Event<Bytes>;
  final eventEnd:Event<NoData>;
  final eventError:Event<Error>;
  final eventPause:Event<NoData>;
  final eventReadable:Event<NoData>;
  final eventResume:Event<NoData>;
  
  var readable(default, null):Bool;
  var readableHighWaterMark(default, null):Int;
  var readableLength(default, null):Int;
  
  function destroy(?error:Error):Void;
  function isPaused():Bool;
  function pause():Void;
  function pipe(destination:IWritable, ?end:Bool = true):IWritable;
  function read(?size:Int):Bytes;
  function resume():Void;
  function unpipe(?destination:IWritable):Void;
  function unshift(chunk:Bytes):Void;
}