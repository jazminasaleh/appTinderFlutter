import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swipe_deck/swipe_deck.dart';

import 'agenda.dart';
import 'citas.dart';
import 'package:swipable_stack/swipable_stack.dart';

class Perfil extends StatelessWidget {
  const Perfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffbfbfb),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.10,
              ),
              CustomCard(),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.85,
      width: MediaQuery.of(context).size.width * 0.90,
      // color: Colors.amber,
      child: Stack(
        alignment: Alignment.center,
        children: [
          _Card(),
          Positioned(
            bottom: 0,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(Citas());
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Color(0xff5588a2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.calendar_month,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

List imagnes = [
  'https://img.freepik.com/foto-gratis/retrato-hermoso-mujer-joven-posicion-pared-gris_231208-10760.jpg',
  'https://www.shutterstock.com/image-photo/young-handsome-man-beard-wearing-260nw-1817367890.jpg',
  'https://www.shutterstock.com/image-photo/happy-positive-handsome-old-man-260nw-2136574865.jpg'
];

class _Card extends StatefulWidget {
  @override
  State<_Card> createState() => _CardState();
}

class _CardState extends State<_Card> {
  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      body:
          /*Container(
          height: MediaQuery.of(context).size.height*0.90,
          width:  MediaQuery.of(context).size.width*0.90,
          child: SwipeDeck(
            widgets: imagnes.map((e) => tarjeta(e, context)).toList())
          ),*/

          Stack(children: [
        SwipableStack(
          allowVerticalSwipe: false,
          itemCount: imagnes.length,
          builder: (BuildContext context, index) {
            return Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width * 0.90,
              height: MediaQuery.of(context).size.height * 0.80,
              decoration: BoxDecoration(
                color: Colors.amber,
                image: DecorationImage(
                  image: NetworkImage(
                      imagnes[0]),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.red.withOpacity(0.2),
                    spreadRadius: 6,
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Sofia Robledo',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 14,
                    ),
                    margin: const EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Tauro',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  )
                ],
              ),
            );
          },
        ),
      ]),
    );
  }
}

Widget tarjeta(String fotos, BuildContext context) {
  return Container(
    alignment: Alignment.bottomLeft,
    padding: EdgeInsets.all(10),
    width:  MediaQuery.of(context).size.width*0.80,
    height:  MediaQuery.of(context).size.height*0.80,
    decoration: BoxDecoration(
      color: Colors.amber,
      image: DecorationImage(
        image: NetworkImage(fotos),
        fit: BoxFit.cover,
      ),
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: Colors.red.withOpacity(0.2),
          spreadRadius: 6,
          blurRadius: 8,
        ),
      ],
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Sofia Robledo',
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 14,
          ),
          margin: const EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text(
            'Tauro',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 80,
        )
      ],
    ),
  );
}
