import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'agenda.dart';
import 'citas.dart';

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
            children: const [
              CustomCard(),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 300,
                child: Text(
                    't is a long established fact that a reader will be distracted by the readable content of a page will be distracted by the readable content of a page'),
              ),
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
      height: 560,
      width: 300,
      // color: Colors.amber,
      child: Stack(
        alignment: Alignment.center,
        children: [
          const _Card(),
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

                SizedBox(width: 20),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: const Color(0xffffffff),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.7),
                        blurRadius: 7,
                        spreadRadius: 3,
                        offset: const Offset(1, 3),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.favorite,
                    color: Color(0xffe24e5a),
                    size: 35,
                  ),
                ),
                const SizedBox(width: 20),
                Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Color(0xffe24e5a),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
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

class _Card extends StatelessWidget {
  const _Card();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      padding: EdgeInsets.all(10),
      width: 300,
      height: 500,
      decoration: BoxDecoration(
        color: Colors.amber,
        image: const DecorationImage(
          image: AssetImage('assets/images/fondo.jpg'),
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
            'David Robledo',
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
}
