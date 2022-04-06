import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
            padding: const EdgeInsets.fromLTRB(100.0, 0.0, 0.0, 32.0),
            margin: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 466.0),
            constraints: const BoxConstraints(maxHeight: 310),
            decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.indigo),
        ),
        Stack(
            children:const [
                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    height: 250,
                    child: CircleAvatar(
                      radius: 80.0,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 76.0,
                        backgroundImage: NetworkImage('https://images.unsplash.com/photo-1597466765990-64ad1c35dafc'),
                      ),
                    ),)
              ),
            ],),
      ],
    );


    // Padding(
    //   padding: const EdgeInsets.only(bottom: 20.0),
    //   child: Center(
    //     child: Container(
    //
    //       margin: const EdgeInsetsDirectional.fromSTEB(0.0, 36.0, 0.0, 0.0),
    //       child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_qrayBvlGWQwPARXPQz6h0tJ3viA432scGg&usqp=CAU'),
    //       decoration: const ShapeDecoration(
    //         shape: CircleBorder(),
    //         color: Colors.indigo
    //       ),
    //     ),
    //   ),
    // )


  }
}
