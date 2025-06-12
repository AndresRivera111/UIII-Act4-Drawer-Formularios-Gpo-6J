import 'package:flutter/material.dart';
import 'package:myapp/details.dart'; // Assuming this file exists and is correctly structured

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  // Global key for the form, used for validation
  final _formKey = GlobalKey<FormState>();

  final _idClientesController = TextEditingController();
  final _nombreController = TextEditingController();
  final _edadController = TextEditingController();
  final _correoElectronicoController = TextEditingController();
  final _telefonoController = TextEditingController();
  final _direccionController = TextEditingController();
  final _formaPagoController = TextEditingController();

  @override
  void dispose() {
    _idClientesController.dispose();
    _nombreController.dispose();
    _edadController.dispose();
    _correoElectronicoController.dispose();
    _telefonoController.dispose();
    _direccionController.dispose();
    _formaPagoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(146, 22, 70, 55),
        title: const Text("Clientes"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        // Wrap the ListView with a Form widget for validation
        child: Form(
          key: _formKey, // Assign the form key
          child: ListView(
            children: [
              MyTextField(
                myController: _idClientesController,
                fieldName: "ID Cliente", // More user-friendly label
                myIcon: Icons.perm_identity, // More relevant icon
                prefixIconColor: Colors.deepPurple.shade300,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese el ID del cliente';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15.0), // Consistent spacing
              MyTextField(
                myController: _nombreController,
                fieldName: "Nombre",
                myIcon: Icons.person, // More relevant icon
                prefixIconColor: Colors.deepPurple.shade300,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese el nombre';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15.0),
              MyTextField(
                myController: _edadController,
                fieldName: "Edad",
                myIcon: Icons.cake, // More relevant icon
                prefixIconColor: Colors.deepPurple.shade300,
                keyboardType: TextInputType.number, // Set keyboard to number
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese la edad';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Por favor, ingrese un número válido para la edad';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15.0),
              MyTextField(
                myController: _correoElectronicoController,
                fieldName: "Correo Electrónico", // More user-friendly label
                myIcon: Icons.email, // More relevant icon
                prefixIconColor: Colors.deepPurple.shade300,
                keyboardType:
                    TextInputType.emailAddress, // Set keyboard to email
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese el correo electrónico';
                  }
                  // Basic email format validation
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Por favor, ingrese un correo electrónico válido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15.0),
              MyTextField(
                myController: _telefonoController,
                fieldName: "Teléfono",
                myIcon: Icons.phone, // More relevant icon
                prefixIconColor: Colors.deepPurple.shade300,
                keyboardType: TextInputType.phone, // Set keyboard to phone
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese el teléfono';
                  }
                  // Basic phone number validation (digits only)
                  if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                    return 'Por favor, ingrese solo números para el teléfono';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15.0),
              MyTextField(
                myController: _direccionController,
                fieldName: "Dirección",
                myIcon: Icons.location_on, // More relevant icon
                prefixIconColor: Colors.deepPurple.shade300,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese la dirección';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15.0),
              MyTextField(
                myController: _formaPagoController,
                fieldName: "Forma de Pago",
                myIcon: Icons.payment, // More relevant icon
                prefixIconColor: Colors.deepPurple.shade300,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese la forma de pago';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 25.0), // Space before the button
              _buildSubmitButton(context), // Call the button function once
            ],
          ),
        ),
      ),
    );
  }

  // Renamed to be more descriptive and private
  OutlinedButton _buildSubmitButton(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50), // Make button full width
        side: BorderSide(
          color: Colors.deepPurple.shade300,
          width: 2,
        ), // Add border
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ), // Rounded corners
      ),
      onPressed: () {
        // Validate the form before navigating
        if (_formKey.currentState!.validate()) {
          // If the form is valid, display a snackbar and navigate
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Procesando datos...')));
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return Details(
                  idClientes: _idClientesController.text,
                  nombre: _nombreController.text,
                  edad: _edadController.text,
                  correo_electronico: _correoElectronicoController.text,
                  telefono: _telefonoController.text,
                  direccion: _direccionController.text,
                  formaPago: _formaPagoController.text,
                );
              },
            ),
          );
        }
      },
      child: Text(
        "Enviar Formulario".toUpperCase(),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.deepPurple,
          fontSize: 16,
        ),
      ),
    );
  }
}

// Custom Stateless Widget Class that helps re-usability
class MyTextField extends StatelessWidget {
  MyTextField({
    Key? key,
    required this.fieldName,
    required this.myController,
    this.myIcon = Icons.verified_user_outlined,
    this.prefixIconColor = Colors.blueAccent,
    this.keyboardType = TextInputType.text, // Default to text
    this.validator, // Add a validator function
  }) : super(key: key);

  final TextEditingController myController;
  final String fieldName;
  final IconData myIcon;
  final Color prefixIconColor;
  final TextInputType keyboardType; // New property for keyboard type
  final String? Function(String?)? validator; // New property for validator

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: myController,
      keyboardType: keyboardType, // Apply the keyboard type
      validator: validator, // Apply the validator
      decoration: InputDecoration(
        labelText: fieldName,
        prefixIcon: Icon(myIcon, color: prefixIconColor),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ), // Rounded corners for border
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade400,
          ), // Lighter border when not focused
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.deepPurple.shade300,
            width: 2,
          ), // Thicker border when focused
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        labelStyle: const TextStyle(color: Colors.deepPurple),
        floatingLabelStyle: TextStyle(
          color: Colors.deepPurple.shade500,
          fontSize: 18,
        ), // Style for floating label
        hintStyle: TextStyle(color: Colors.grey.shade500),
        errorStyle: const TextStyle(
          color: Colors.redAccent,
          fontSize: 13,
        ), // Style for error text
      ),
    );
  }
}
