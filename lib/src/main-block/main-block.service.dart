import 'dart:async';
import 'package:angular/core.dart';

import 'logic.dart' as lg;

@Injectable()
class MainBlockService {

  Future<List<int>> startCalculate(List<int> nominals, int sum) async {
    return await lg.calc(nominals, sum);
  }
}
