import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

const MethodChannel _channel = MethodChannel('wear');

class Wear {
  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}

enum Shape { square, round }
enum Mode { active, ambient }

class InheritedShape extends InheritedWidget {
  const InheritedShape({
    Key? key,
    required this.shape,
    required Widget child,
  }) : super(key: key, child: child);

  final Shape shape;

  static InheritedShape? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedShape>();
  }

  @override
  bool updateShouldNotify(InheritedShape old) => shape != old.shape;
}

typedef WatchShapeBuilder = Widget Function(BuildContext context, Shape shape);

class WatchShape extends StatefulWidget {
  const WatchShape({Key? key, required this.builder}) : super(key: key);
  final WatchShapeBuilder builder;

  @override
  createState() => _WatchShapeState();
}

class _WatchShapeState extends State<WatchShape> {
  Shape shape = Shape.round;

  @override
  initState() {
    super.initState();
    _setShape();
  }

  Future<void> _setShape() async {
    final Shape currentShape = await _getShape();
    setState(() => shape = currentShape);
  }

  Future<Shape> _getShape() async {
    try {
      final result = await _channel.invokeMethod('getShape');

      // Si el resultado es un String, intenta convertirlo a int
      if (result is String) {
        final int? parsedResult = int.tryParse(result);
        if (parsedResult != null) {
          return parsedResult == 1 ? Shape.square : Shape.round;
        }
      }

      // Si ya es un int, simplemente lo procesamos
      if (result is int) {
        return result == 1 ? Shape.square : Shape.round;
      }

      // En caso de cualquier otro tipo de dato o conversión fallida, devolvemos el valor por defecto
      return Shape.round;
    } on PlatformException {
      // Manejar el caso en el que la llamada a la plataforma falle
      return Shape.round;
    }
  }


  @override
  Widget build(BuildContext context) => widget.builder(context, shape);
}

typedef AmbientModeWidgetBuilder = Widget Function(BuildContext context, Mode mode);

class AmbientMode extends StatefulWidget {
  const AmbientMode({Key? key, required this.builder, this.update}) : super(key: key);
  final AmbientModeWidgetBuilder builder;
  final VoidCallback? update;

  @override
  createState() => _AmbientModeState();
}

class _AmbientModeState extends State<AmbientMode> {
  Mode ambientMode = Mode.active;

  @override
  void initState() {
    super.initState();
    _channel.setMethodCallHandler((call) async {
      switch (call.method) {
        case 'enter':
          setState(() => ambientMode = Mode.ambient);
          break;
        case 'update':
          if (widget.update != null) {
            widget.update!();
          } else {
            setState(() => ambientMode = Mode.ambient);
          }
          break;
        case 'exit':
          setState(() => ambientMode = Mode.active);
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) => widget.builder(context, ambientMode);
}
