import 'dart:ffi' as ffi;
import 'dart:io' show Directory, Platform;
import 'package:path/path.dart' as path;
import 'package:ffi/ffi.dart';

// ignore: camel_case_types
typedef quad_cal_run = ffi.Pointer<Utf8> Function(ffi.Double a, ffi.Double b, ffi.Double c);
typedef QuadCalRun = ffi.Pointer<Utf8> Function(double a, double b, double c);

class QuadCal{
  String run(double a, double b, double c){
    String out = "Something went wrong!";
    if(Platform.isLinux) {
      var libpath = path.join(
          Directory.current.path, "lib", "libraries", "linux", "libquadcal.so");
      final dylib = ffi.DynamicLibrary.open(libpath);
      // ignore: non_constant_identifier_names
      final QuadCalRun Run = dylib.lookup<ffi.NativeFunction<quad_cal_run>>('Run').asFunction();
      ffi.Pointer<Utf8> tmp = Run(a, b, c);
      out = tmp.toDartString();
      malloc.free(tmp);
    }
    else if(Platform.isAndroid){
      final ffi.DynamicLibrary dylib = Platform.isAndroid
          ? ffi.DynamicLibrary.open('libquadcal.so')
          : ffi.DynamicLibrary.process();
      // ignore: non_constant_identifier_names
      final QuadCalRun Run = dylib.lookup<ffi.NativeFunction<quad_cal_run>>('Run').asFunction();
      ffi.Pointer<Utf8> tmp = Run(a, b, c);
      out = tmp.toDartString();
      malloc.free(tmp);
    }
    //print(out);
    return out;
  }
}

/*
void main(){
  QuadCal cal = QuadCal();
  String out = cal.run(1, 2, 3);
  print(out);
}

 */
