import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

@injectable
class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {}
