import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  // Se han corregido los nombres de las propiedades para que coincidan con los parámetros del constructor.
  final String idClientes;
  final String nombre;
  final String edad;
  final String correo_electronico;
  final String telefono;
  final String direccion;
  final String formaPago;

  Details({
    super.key,
    required this.idClientes,
    required this.nombre,
    required this.edad,
    required this.correo_electronico,
    required this.telefono,
    required this.direccion,
    required this.formaPago,
  });

  // Función auxiliar para crear un ListTile para cada detalle del cliente
  Widget _buildDetailTile(String title, String value, IconData icon) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Icon(icon, color: Colors.deepPurple.shade300),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
        ),
        subtitle: Text(value, style: const TextStyle(fontSize: 16.0)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(146, 22, 70, 55),
        centerTitle: true,
        title: const Text("Detalles del Cliente"), // Título más descriptivo
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context); // Regresar a la pantalla anterior
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ), // Icono blanco para contraste
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(
          16.0,
        ), // Aumentar el padding para mejor espaciado
        child: ListView(
          children: [
            // Mostrar todos los detalles del cliente usando la función auxiliar
            _buildDetailTile("ID Cliente", idClientes, Icons.badge),
            _buildDetailTile("Nombre", nombre, Icons.person),
            _buildDetailTile("Edad", edad, Icons.cake),
            _buildDetailTile(
              "Correo Electrónico",
              correo_electronico,
              Icons.email,
            ),
            _buildDetailTile("Teléfono", telefono, Icons.phone),
            _buildDetailTile("Dirección", direccion, Icons.location_on),
            _buildDetailTile("Forma de Pago", formaPago, Icons.payment),
          ],
        ),
      ),
    );
  }
}
