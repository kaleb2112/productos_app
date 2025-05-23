// ignore_for_file: sort_child_properties_last, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: const  EdgeInsets.only( top:30, bottom: 50 ),
        width: double.infinity,
        height: 400,
        decoration:_cardBorders(),
        child:  Stack (
          alignment: Alignment.bottomLeft,
          children: [

           _Backgroundimage(),

           _ProductDetails(),

           Positioned(
            top: 0,
            right: 0,
            child: _PriceTag()
            ),


           // TODO: mostrar de manera condicional
           Positioned(
            top: 0,
            left: 0,
            child: _NotAvaible()
            ),

          ],
        ),
      ),
    );
  }

  BoxDecoration _cardBorders() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(25),
    boxShadow:const [ 
      BoxShadow  (
        color: Colors.black12,
        offset: Offset(0,7),
        blurRadius: 10
      )
    ]
  );
}

class _NotAvaible extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'No disponible',
            style: TextStyle( color: Colors.white, fontSize: 20 ),
          ),
        ),
      ),
      width: 100,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.yellow[800],
        borderRadius:const  BorderRadius.only( topLeft: Radius.circular(25), bottomRight: Radius.circular(25))
      ),
    );
  }
}

class _PriceTag extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10 ),
          child: Text('\$103.99', style: TextStyle( color: Colors.white, fontSize: 20 ))
          ),
      ),
      width: 100,
      height: 70,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Colors.indigo,
        borderRadius: BorderRadius.only( topRight: Radius.circular(25), bottomLeft: Radius.circular(25))
      ),
    );
  }
}

class _ProductDetails extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only( right: 50 ),
      child: Container(
        padding: const EdgeInsets.symmetric( horizontal: 20, vertical: 10 ),
        width: double.infinity,
        height: 70,
        decoration: _buildBoxDecoration(),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Disco duro G', 
              style: TextStyle( fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              'Id del disco duro',
              style: TextStyle( fontSize: 15, color: Colors.white ),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => const BoxDecoration(
    color: Colors.indigo,
    borderRadius: BorderRadius.only( bottomLeft: Radius.circular(25), topRight: Radius.circular(25) )
  );
}

class _Backgroundimage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      // ignore: sized_box_for_whitespace
      child: Container (
        width: double.infinity,
        height: 400,
        child: const FadeInImage(
          placeholder: AssetImage('assets/jar-loading.gif'),
          image: NetworkImage('https://via.placeholder.com/400x300/f6f6f6'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}