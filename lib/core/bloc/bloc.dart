import 'dart:async';

abstract class Bloc<T> {
  late T _t;

  ///Set the controller as brodcast so Bloc can have multiple listner
  final _streamController = StreamController<T>.broadcast();
  Stream<T> get stream => _streamController.stream;

  ///create state variable so state is maintained thought the APP.
  T get state => _t;

  ///[Bloc] constructor creates a stream and state with
  ///default value from abstract method
  Bloc() {
    _t = initDefaultValue();
    _streamController.sink.add(_t);
  }

  ///[initDefaultValue] is an interface.
  T initDefaultValue();

  ///[emit] update the state and add data to the stream
  ///[T] generic type state.
  void emit(T data) {
    if (!_streamController.isClosed) {
      _t = data;
      _streamController.sink.add(data);
    }
  }

  ///[dispose] dispose the stream when the widget is getting disposed
  void dispose() {
    _streamController.close();
  }
}
