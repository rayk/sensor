/// Collection of transforms to be used when dealing with streams of signals.
/// As the tranformers calls intercept the stream passing itself to the tranformer and then
/// returning the result stream.
///
/// We have implemented the bind and streamcontroller in a generic form so they can
/// used by all the transformers.
library transformers;

import 'dart:async';

Stream _bindStream(
    {Stream like,
    StreamSubscription onListen(EventSink sink),
    onCancel(),
    bool sync: false}) {
  StreamSubscription subscription;
  StreamController controller;

  controller = _createControllerLikeStream(
      stream: like,
      sync: sync,
      onListen: () => subscription = onListen(controller),
      onPause: () => subscription.pause(),
      onResume: () => subscription.resume(),
      onCancel: () {
        var futures = [onCancel, subscription.cancel]
            .where((function) => function != null)
            .map((function) => function())
            .where((future) => future != null);
        return Future.wait(futures);
      });

  return controller.stream;
}

Future _cancelSubscriptions(Iterable<StreamSubscription> subscriptions) {
  var futures = subscriptions
      .map((subscription) => subscription.cancel())
      .where((future) => future != null);
  return Future.wait(futures);
}

StreamController _createControllerLikeStream(
    {Stream stream,
    void onListen(),
    onCancel(),
    void onPause(),
    void onResume(),
    bool sync: false}) {
  if (stream == null || !stream.isBroadcast) {
    return new StreamController(
        onListen: onListen,
        onCancel: onCancel,
        onPause: onPause,
        onResume: onResume,
        sync: sync);
  } else {
    return new StreamController.broadcast(
        onListen: onListen, onCancel: onCancel, sync: sync);
  }
}

void verctorise(String value, EventSink<List<String>> sink) {
  List<String> vx = value.trim().split(',');
  assert(vx.isNotEmpty);
  sink.add(vx);
}

void dropItem1(List value, EventSink<List> sink) {
  assert(value.length > 1);
  value.removeRange(1, 2);
  sink.add(value);
}
