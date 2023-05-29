import 'package:flutter/material.dart';


class Agenda extends StatefulWidget {
  @override
  State<Agenda> createState() => _AgendaState();
}

class _AgendaState extends State<Agenda> {
  DateTime dateTime = DateTime.now();

  String fecha = '';

  String fechaHoy = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF7F7F7), // Color de fondo del contenedor
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.2,
            color: Colors
                .transparent, // Color transparente para evitar superposición
            child: Image.asset(
              'assets/images/calendario.png',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              style: TextStyle(
                fontSize: 16,
              ),
              children: [
                TextSpan(
                  text: 'Vas a invitar a David Robledo \n',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF5387A2), // Color #5387A2
                  ),
                ),
                TextSpan(
                  text: 'a vivir la experiencia Match Coffee',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF5387A2), // Color #5387A2
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
               fechaHoy = '${dateTime.day}/${dateTime.month}/${dateTime.year}';
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2025))
                  .then((value) {
                    setState(() {
                      dateTime = value!;
                      fecha = '${dateTime.day}/${dateTime.month}/${dateTime.year}';
                    });
                  });
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFFCCED1)),
                borderRadius: BorderRadius.circular(18),
              ),
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
              child: Row(
                children: [
                  const Icon(Icons.calendar_today),
                  const SizedBox(width: 20),
                  Text( fecha == fechaHoy
                  ? 'Fecha de invitación'
                  : fecha,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      
    );
  }
}
