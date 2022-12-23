import 'dart:ffi' as ffi;
import 'dart:io' show Directory, Platform;
import 'package:path/path.dart' as path;
import 'package:ffi/ffi.dart';

// ignore: camel_case_types
typedef quad_cal_run = ffi.Pointer<Utf8> Function(
    ffi.Double a, ffi.Double b, ffi.Double c);
typedef QuadCalRun = ffi.Pointer<Utf8> Function(double a, double b, double c);

class QuadCal {
  String run(double a, double b, double c) {
    String out = "Something went wrong!";

    try {
      if (Platform.isLinux) {
        var libpath = path.join(Directory.current.path, "lib", "libquadcal.so");
        final dylib = ffi.DynamicLibrary.open(libpath);
        // ignore: non_constant_identifier_names
        final QuadCalRun Run =
            dylib.lookup<ffi.NativeFunction<quad_cal_run>>('Run').asFunction();
        ffi.Pointer<Utf8> tmp = Run(a, b, c);
        out = tmp.toDartString();
        malloc.free(tmp);
      }
      if (Platform.isWindows) {
        var libpath =
            path.join(Directory.current.path, "lib", "libquadcal.dll");
        final dylib = ffi.DynamicLibrary.open(libpath);
        final QuadCalRun Run =
            dylib.lookup<ffi.NativeFunction<quad_cal_run>>('Run').asFunction();
        ffi.Pointer<Utf8> tmp = Run(a, b, c);
        out = tmp.toDartString();
        malloc.free(tmp);
      } else if (Platform.isAndroid) {
        final ffi.DynamicLibrary dylib = Platform.isAndroid
            ? ffi.DynamicLibrary.open('libquadcal.so')
            : ffi.DynamicLibrary.process();
        // ignore: non_constant_identifier_names
        final QuadCalRun Run =
            dylib.lookup<ffi.NativeFunction<quad_cal_run>>('Run').asFunction();
        ffi.Pointer<Utf8> tmp = Run(a, b, c);
        out = tmp.toDartString();
        malloc.free(tmp);
      }
    } catch (error) {
      if (Platform.isLinux) {
        out = "libquadcal.so missiong!";
      } else if (Platform.isWindows) {
        out = "libquadcal.dll missing!";
      }
      if (Platform.isAndroid) {
        out = "libquadcal not found!\nPlease produce a bug report";
      }
    }
    //print(out);
    return out;
  }
}
