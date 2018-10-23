import 'dart:html';

void main() {

  window.onMessage.listen( (event) => onData);

}

void onData(){
  var a = 10 + 25;
}