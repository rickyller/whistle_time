import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Para manejar la fecha
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:settings/colors.dart'; // Para el selector de color
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddMatchScreen extends StatefulWidget {
  @override
  _AddMatchScreenState createState() => _AddMatchScreenState();
}

class _AddMatchScreenState extends State<AddMatchScreen> {
  String _selectedRole = 'Árbitro'; // Valor predeterminado
  late DateTime _selectedDate; // Variable para la fecha seleccionada
  Color _localTeamColor = Colors.red; // Color predeterminado para equipo local
  Color _visitorTeamColor = Colors.teal; // Color predeterminado para equipo visitante

  @override
  void initState() {
    super.initState();
    // Inicializar _selectedDate redondeando la hora actual
    _selectedDate = _roundToNearestHalfHour(DateTime.now());
  }

  DateTime _roundToNearestHalfHour(DateTime dateTime) {
    int minute = dateTime.minute;

    if (minute >= 30) {
      // Redondea a la hora siguiente con 0 minutos
      return DateTime(dateTime.year, dateTime.month, dateTime.day, dateTime.hour + 1);
    } else {
      // Redondea a los 30 minutos
      return DateTime(dateTime.year, dateTime.month, dateTime.day, dateTime.hour, 30);
    }
  }


  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = _roundToNearestHalfHour(picked);
      });
    }
  }


  void _openLocalColorPicker() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Selecciona el color del equipo local'),
          content: SingleChildScrollView(
            child: BlockPicker(
              pickerColor: _localTeamColor,
              onColorChanged: (color) {
                setState(() {
                  _localTeamColor = color;
                });
              },
            ),
          ),
          actions: [
            TextButton(
              child: Text('Guardar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _openVisitorColorPicker() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Selecciona el color del equipo visitante'),
          content: SingleChildScrollView(
            child: BlockPicker(
              pickerColor: _visitorTeamColor,
              onColorChanged: (color) {
                setState(() {
                  _visitorTeamColor = color;
                });
              },
            ),
          ),
          actions: [
            TextButton(
              child: Text('Guardar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Añadir un partido", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.teal),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Acción para crear el partido
            },
            child: Text(
              "Crear",
              style: TextStyle(color: Colors.teal),
            ),
          ),
        ],
      ),
      body: Container(
        color: AppColors.black, // Fondo negro para toda la pantalla
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionContainer(
                "Datos del partido",
                Column(
                  children: [
                    _buildInputField("Competición", "Ej. Liga TDP"),
                    _buildInputField("Lugar", "Ej. Estadio 3 de marzo"),
                    _buildDateField(),
                    _buildDropdownField("Rol del miembro arbitral", _selectedRole),
                  ],
                ),
              ),
              SizedBox(height: 20),
              _buildSectionContainer(
                "Equipo Local",
                Column(
                  children: [
                    _buildInputField("Nombre del equipo", "Ej. Tecos"),
                    _buildInputField("Nombre abreviado", "Ej. TEC"),
                    _buildLocalTeamColorPickerIcon(), // Local team color picker
                  ],
                ),
              ),
              SizedBox(height: 20),
              _buildSectionContainer(
                "Equipo Visitante",
                Column(
                  children: [
                    _buildInputField("Nombre del equipo", "Ej. Nacional"),
                    _buildInputField("Nombre abreviado", "Ej. NAC"),
                    _buildVisitorTeamColorPickerIcon(), // Visitor team color picker
                  ],
                ),
              ),
              SizedBox(height: 20),
              _buildSectionContainer(
                "Formato del partido",
                _buildMatchFormatField(),
              ),
              _buildSectionContainer(
                "Miembros del equipo arbitral (Opcional)",
                _buildOptionalField(),
              ),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        child: Icon(Icons.save, color: Colors.white),
        onPressed: () {
          // Acción para guardar el partido
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  // Método para mostrar la fecha redondeada
  Widget _buildDateField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: () => _selectDate(context), // Llama al selector de fecha
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: "Fecha",
            filled: true,
            fillColor: Colors.grey[800], // Fondo gris oscuro para el campo de fecha
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey),
            ),
          ),
          child: Text(
            DateFormat('dd MMM yyyy, h:mm a').format(_selectedDate), // Formatea la fecha redondeada
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownField(String label, String currentValue) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<String>(
        value: currentValue,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: AppColors.darkGrey, // Fondo gris oscuro
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColors.grey), // Borde gris claro
          ),
        ),
        dropdownColor: AppColors.darkGrey, // Color del dropdown
        items: <String>['Árbitro', 'Árbitro asistente', 'Cuarto árbitro', 'Asesor']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: TextStyle(color: AppColors.white), // Texto en blanco para las opciones
            ),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            _selectedRole = newValue!; // Actualiza el rol seleccionado
          });
        },
      ),
    );
  }


  Widget _buildSectionContainer(String title, Widget child) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[900], // Fondo gris oscuro
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          child, // Contenido específico de cada sección
        ],
      ),
    );
  }

  Widget _buildInputField(String label, String hintText) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          hintText: hintText,
          filled: true,
          fillColor: Colors.black, // Fondo negro para los campos
          labelStyle: TextStyle(color: Colors.white), // Color blanco para el texto
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8), // Bordes redondeados
            borderSide: BorderSide(color: Colors.grey), // Borde gris claro
          ),
        ),
        style: TextStyle(color: Colors.white), // Texto en blanco dentro del campo
      ),
    );
  }

  Widget _buildLocalTeamColorPickerIcon() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          IconButton(
            icon: FaIcon(FontAwesomeIcons.shirt, color: _localTeamColor), // El icono toma el color del equipo local
            onPressed: _openLocalColorPicker,
          ),
          SizedBox(width: 10),
          Text(
            'Color de camiseta local',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildVisitorTeamColorPickerIcon() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          IconButton(
            icon: FaIcon(FontAwesomeIcons.shirt, color: _visitorTeamColor), // El icono toma el color del equipo visitante
            onPressed: _openVisitorColorPicker,
          ),
          SizedBox(width: 10),
          Text(
            'Color de camiseta visitante',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildMatchFormatField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: () {
          // Acción al tocar el formato del partido
        },
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: "Formato del partido",
            filled: true,
            fillColor: Colors.black, // Fondo negro
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("[League]", style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold)),
              Icon(Icons.keyboard_arrow_down, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionalField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: () {
          // Acción para mostrar más campos opcionales
        },
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: "Miembros del equipo arbitral",
            filled: true,
            fillColor: Colors.black,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Opcional", style: TextStyle(color: Colors.grey)),
              Icon(Icons.keyboard_arrow_down, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
