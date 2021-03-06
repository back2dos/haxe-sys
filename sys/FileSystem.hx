package sys;

import haxe.Error;
import haxe.io.Bytes;
import sys.io.FileReadStream;
import sys.io.FileWriteStream;

extern class FileSystem {
  // sys.FileSystem-like functions
  static function access(path:String, ?mode:FileAccessMode):Void;
  static function chmod(path:String, mode:FileMode, ?followSymLinks:Bool = true):Void;
  static function chown(path:String, uid:Int, gid:Int, ?followSymLinks:Bool = true):Void;
  static function copyFile(src:String, dest:String, ?flags:FileCopyFlags):Void;
  //static function exists(path:String):Bool; // deprecated in node.js
  static function createReadStream(path:String, ?options:{?flags:FileOpenFlags, ?mode:FileMode, ?autoClose:Bool, ?start:Int, ?end:Int, ?highWaterMark:Int}):FileReadStream;
  static function createWriteStream(path:String, ?options:{?flags:FileOpenFlags, ?mode:FileMode, ?autoClose:Bool, ?start:Int}):FileWriteStream;
  static function link(existingPath:String, newPath:String):Void;
  static function mkdir(path:String, ?recursive:Bool, ?mode:FileMode):Void;
  static function mkdtemp(prefix:String):String;
  static function readdir(path:String):Array<String>;
  static function readdirTypes(path:String):Array<DirectoryEntry>;
  static function readlink(path:String):String;
  static function realpath(path:String):String;
  static function rename(oldPath:String, newPath:String):Void;
  static function rmdir(path:String):Void;
  static function stat(path:String, ?followSymLinks:Bool = true):FileStat;
  static function symlink(target:String, path:String, ?type:String):Void;
  static function truncate(path:String, len:Int):Void;
  static function unlink(path:String):Void;
  static function utimes(path:String, atime:Date, mtime:Date):Void;
  static function watch(filename:String, ?persistent:Bool, ?recursive:Bool):FileWatcher;
  
  // sys.io.File-like functions
  static function appendFile(path:String, data:Bytes, ?flags:FileOpenFlags, ?mode:FileMode):Void;
  static function open(path:String, ?flags:FileOpenFlags, ?mode:FileMode, ?binary:Bool = true):sys.io.File;
  static function readFile(path:String, ?flags:FileOpenFlags):Bytes;
  static function writeFile(path:String, data:Bytes, ?flags:FileOpenFlags, ?mode:FileMode):Void;
  
  // compatibility sys.FileSystem functions
  //static inline function absolutePath(path:String):String; // should be in haxe.io.Path?
  static inline function createDirectory(path:String):Void return mkdir(path, true);
  static inline function deleteDirectory(path:String):Void return rmdir(path);
  static inline function deleteFile(path:String):Void return unlink(path);
  static inline function exists(path:String):Bool return try { access(path); true; } catch (e:Dynamic) false;
  static inline function fullPath(path:String):String return realpath(path);
  static inline function isDirectory(path:String):Bool return stat(path).isDirectory();
  static inline function readDirectory(path:String):Array<String> return readdir(path);
  //static function rename(path:String, newPath:String) return rename(path, newPath); // matching interface
  //static function stat(path:String) return stat(path); // matching interface (more or less)
  
  // encoding compatibility
  static function pathOfBytes(b:Bytes):String;
  static function bytesOfPath(path:String):Bytes;
}
