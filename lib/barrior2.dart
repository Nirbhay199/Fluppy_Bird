import 'package:flutter/material.dart';
// ignore: camel_case_types
class barrior2 extends StatelessWidget {
  final size;
  barrior2({this.size});
  @override
  Widget build(BuildContext context) {
    return 
        Container(
      height: size,
      width: 100,
      decoration:BoxDecoration(
        color: Colors.green,
        border: Border.all(width:10,color:Colors.green[500]),
        borderRadius: BorderRadius.circular(10)
        
      ) );
      
    
     
      
  }
}


