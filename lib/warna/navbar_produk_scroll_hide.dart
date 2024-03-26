import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ScrollToHideWidget extends StatefulWidget {

final Widget child;
final ScrollController controller;
final Duration duration;


const ScrollToHideWidget({
  Key?key,
  required this.child,
  required this.controller,
  this.duration = const Duration(microseconds: 300),
}) : super(key: key);

  @override
  State<ScrollToHideWidget> createState() => _ScrollToHideWidgetState();
}

class _ScrollToHideWidgetState extends State<ScrollToHideWidget> {

bool isVisbile = true;

@override
void initState(){
  super.initState();

  widget.controller.addListener(listen);
}


@override
void dispose(){
  widget.controller.removeListener(listen);


  super.dispose();
}

void listen(){
if( widget.controller.position.pixels >= 200){
  show();
}else{
  hide();
}

}

void show(){
  if(!isVisbile) setState(() => isVisbile = true);
}


void hide(){
  if(!isVisbile) setState(() => isVisbile = false);
}




  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: widget.duration,
      child: widget.child,
      height: isVisbile? kBottomNavigationBarHeight :0,
      );
  }
}