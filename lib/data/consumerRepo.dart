import '../models/consumer.dart';

class ConsumerRepo {
  final Consumer consumer;

  ConsumerRepo(this.consumer);

  String get getName {
    return consumer.cName;
  }

  String get getImg {
    return consumer.cImg;
  }
}
