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
  String str_res = '...';
  String arr_res = '';
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
    int s;
    try {
      s = int.parse(sum);
    } catch (e) {
      this.showDialog = true;
      return;
    }

    this.str_res = 'Идет вычисление...';
    this.service.startCalculate(items, s)
      .then((res) {    
        if (res == null) {
          this.str_res = 'Невозможно произвести выдачу заданной суммы';
          return;
        }

        Set<int> l = res.toSet();
        this.arr_res = res.toString();
        this.str_res = '';
        l.forEach((item) {
          this.str_res +=  item.toString() + ' x ' + (res.lastIndexOf(item) - res.indexOf(item) + 1).toString() + ' шт; ';
        });
        print(res);
      })
      .catchError((err) {
        // ...
      });
  }

  int remove(int index) => items.removeAt(index);
}
