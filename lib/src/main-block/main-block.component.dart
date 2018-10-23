import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/material_dialog/material_dialog.dart';
import 'package:angular_components/laminate/components/modal/modal.dart';
import 'package:angular_components/material_expansionpanel/material_expansionpanel.dart';

import 'main-block.service.dart';

@Component(
  selector: 'main-block',
  styleUrls: ['main-block.component.css'],
  templateUrl: 'main-block.component.html',
  directives: [
    MaterialCheckboxComponent,
    MaterialFabComponent,
    MaterialIconComponent,
    MaterialExpansionPanel,
    MaterialButtonComponent,
    MaterialDialogComponent,
    materialInputDirectives,
    ModalComponent,
    NgFor,
    NgIf,
  ],
  providers: [const ClassProvider(MainBlockService), overlayBindings],
)
class MainBlockComponent implements OnInit {

  bool showDialog = false;
  final MainBlockService service;

  List<int> items = [1, 5, 10];
  String sum = '';
  String newItem = '';

  MainBlockComponent(this.service);

  @override
  Future<Null> ngOnInit() async {
  }

  void add() {
    try {
      int item = int.parse(newItem);
      if (items.indexOf(item) == -1)
        items.add(item);

      newItem = '';
    } catch (e) {
      this.showDialog = true;
    }
  }

  void doCalc() {
    int s = int.parse(sum);
    List<int> x = this.service.calc(items, s);
    print(x);
  }

  int remove(int index) => items.removeAt(index);
}
