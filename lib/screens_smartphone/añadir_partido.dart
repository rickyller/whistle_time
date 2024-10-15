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

  Map<String, TextEditingController> _roleControllers = {};
  String _selectedLiga = 'Liga TDP'; // Valor predeterminado
  String _selectedPeriodos = '2 mitades'; // Valor predeterminado
  String _selectedPenaltis = "Sí"; // Valor predeterminado
  String _selectedRegistrarGoleadores = "Sí"; // Valor predeterminado
  String _selectedExpulsionesTemporales = "Sin expulsión temporal"; // Valor predeterminado
  bool _rememberConfiguration = false; // Valor inicial
  late TextEditingController _nombrePlantillaController;
  late TextEditingController _numeroJugadoresController;
  late TextEditingController _numeroSustitutosController;
  late TextEditingController _duracionMitadController;
  late TextEditingController _medioTiempoController;
  late TextEditingController _lugarController;
  late TextEditingController _equipoLocalController;
  late TextEditingController _equipoVisitanteController;
  late TextEditingController _equipoLocalAbreviadoController;
  late TextEditingController _equipoVisitanteAbreviadoController;
  late DateTime _selectedDate; // Variable para la fecha seleccionada
  Color _localTeamColor = Colors.red; // Color predeterminado para equipo local
  Color _visitorTeamColor = Colors.teal; // Color predeterminado para equipo visitante

  @override
  void initState() {
    super.initState();

    // Inicializamos controladores para cada rol
    _roleControllers = {
      'Árbitro': TextEditingController(),
      'Asistente 1': TextEditingController(),
      'Asistente 2': TextEditingController(),
      'Cuarto Árbitro': TextEditingController(),
      'Asesor': TextEditingController(),
    };
    // Controladores con valores iniciales porque son editables
    _numeroJugadoresController = TextEditingController(text: "11");
    _numeroSustitutosController = TextEditingController(text: "5");
    _duracionMitadController = TextEditingController(text: "45");
    _medioTiempoController = TextEditingController(text: "15");

    // Los campos con hint no requieren inicialización con un valor
    _nombrePlantillaController = TextEditingController(); // Hint visible cuando esté vacío
    _lugarController = TextEditingController(); // Hint visible cuando esté vacío
    _equipoLocalController = TextEditingController(); // Hint visible cuando esté vacío
    _equipoVisitanteController = TextEditingController(); // Hint visible cuando esté vacío
    _equipoLocalAbreviadoController = TextEditingController(); // Hint visible cuando esté vacío
    _equipoVisitanteAbreviadoController = TextEditingController(); // Hint visible cuando esté vacío

    // Inicializar _selectedDate redondeando la hora actual
    _selectedDate = _roundToNearestHalfHour(DateTime.now());
  }

  @override
  void dispose() {
    _nombrePlantillaController.dispose();
    _numeroJugadoresController.dispose();
    _numeroSustitutosController.dispose();
    _duracionMitadController.dispose();
    _medioTiempoController.dispose();
    super.dispose();
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


  Future<void> _selectDateAndTime(BuildContext context) async {
    // Seleccionar la fecha
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      // Seleccionar la hora
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(_selectedDate), // Hora inicial basada en la fecha seleccionada
      );

      if (pickedTime != null) {
        setState(() {
          // Combina la fecha seleccionada con la hora seleccionada
          _selectedDate = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
        });
      }
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
                    _buildDropdownFieldLiga("Liga o competición", _selectedLiga),
                    _buildInputField("Lugar", _lugarController, "Estadio 3 de Marzo"),
                    _buildDateField(),
                    _buildDropdownField(
                      label: "Rol del miembro arbitral",
                      currentValue: _selectedRole,
                      items: ['Árbitro', 'Árbitro asistente', 'Cuarto árbitro', 'Asesor'],
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedRole = newValue ?? 'Árbitro'; // Valor por defecto si newValue es null
                        });
                      },

                    )

                  ],
                ),
              ),
              SizedBox(height: 20),
              _buildSectionContainer(
                "Equipo Local",
                Column(
                  children: [
                    _buildInputField("Nombre del equipo", _equipoLocalController, "Tecos"),
                    _buildInputField("Nombre abreviado", _equipoLocalAbreviadoController, "TEC"),

                    _buildLocalTeamColorPickerIcon(), // Local team color picker
                  ],
                ),
              ),
              SizedBox(height: 20),
              _buildSectionContainer(
                "Equipo Visitante",
                Column(
                  children: [
                    _buildInputField("Nombre del equipo", _equipoVisitanteController, "Nacional"),
                    _buildInputField("Nombre abreviado", _equipoVisitanteAbreviadoController, "NAC"),

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
        onTap: () => _selectDateAndTime(context), // Llama al selector de fecha
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: "Fecha",
            filled: true,
            fillColor: Colors.black, // Fondo gris oscuro para el campo de fecha
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

  Widget _buildDropdownField({
    required String label,
    required String currentValue,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<String>(
        value: currentValue,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: AppColors.black, // Fondo gris oscuro
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColors.grey), // Borde gris claro
          ),
        ),
        dropdownColor: AppColors.black, // Color del dropdown
        items: items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: TextStyle(color: AppColors.white), // Texto en blanco para las opciones
            ),
          );
        }).toList(),
        onChanged: onChanged, // Pasar la función onChanged que se adapta según el caso
      ),
    );
  }


  Widget _buildDropdownFieldLiga(String label, String currentValue) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<String>(
        value: currentValue,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: AppColors.black, // Fondo gris oscuro
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColors.black), // Borde gris claro
          ),
        ),
        dropdownColor: AppColors.darkGrey, // Color del dropdown
        items: <String>['Liga TDP', 'Amateur', 'Sub 15', 'Sub 17', 'Sub 19', 'Sub 23' ]
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
            _selectedLiga = newValue!; // Actualiza el rol seleccionado
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

  Widget _buildInputField(String label, TextEditingController controller, String hintText) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label, // Etiqueta que aparecerá encima del campo
          hintText: hintText, // El hint que aparecerá dentro del campo
          filled: true,
          fillColor: Colors.black,
          labelStyle: TextStyle(color: Colors.white),
          hintStyle: TextStyle(color: Colors.grey), // Estilo para el hint (texto sugerido)
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
        style: TextStyle(color: Colors.white),
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
      child: ExpansionTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Formato del partido",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.teal,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.black,
        collapsedBackgroundColor: Colors.black,
        children: <Widget>[
          _buildInputField("N° de jugadores", _numeroJugadoresController, "11"),
          _buildInputField("N° de sustitutos", _numeroSustitutosController, "5"),
          _buildDropdownField(
            label: "Número de periodos",
            currentValue: _selectedPeriodos,
            items: ['1 periodo', '2 mitades', '3 tercios', '4 cuartos'],
            onChanged: (String? newValue) {
              setState(() {
                _selectedPeriodos = newValue!;
              });
            },
          ),
          _buildInputField("Duración de la mitad 1", _duracionMitadController, "45"),
          _buildInputField("Medio tiempo", _medioTiempoController, "15"),

          _buildDropdownField(
            label: "Penaltis",
            currentValue: _selectedPenaltis,
            items: ['No', 'Sí'],
            onChanged: (String? newValue) {
              setState(() {
                _selectedPenaltis = newValue!;
              });
            },
          ),
          _buildDropdownField(
            label: "Registrar goleadores",
            currentValue: _selectedRegistrarGoleadores,
            items: ['No', 'Sí'],
            onChanged: (String? newValue) {
              setState(() {
                _selectedRegistrarGoleadores = newValue!;
              });
            },
          ),
          _buildDropdownField(
            label: "Expulsiones temporales",
            currentValue: _selectedExpulsionesTemporales,
            items: ['Sin expulsión temporal', '5 minutos', '10 minutos'],
            onChanged: (String? newValue) {
              setState(() {
                _selectedExpulsionesTemporales = newValue!;
              });
            },
          ),
          // Añadimos el Checkbox para "Recordar configuración"
          CheckboxListTile(
            title: Text(
              "Recordar configuración",
              style: TextStyle(color: Colors.white),
            ),
            value: _rememberConfiguration,
            activeColor: Colors.teal,
            onChanged: (bool? value) {
              setState(() {
                _rememberConfiguration = value ?? false;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildOptionalField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Dropdown para seleccionar el rol
          DropdownButtonFormField<String>(
            value: _selectedRole, // El valor predeterminado es "Árbitro"
            decoration: InputDecoration(
              labelText: "Rol del miembro arbitral",
              filled: true,
              fillColor: Colors.black,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
            dropdownColor: Colors.black,
            items: ['Árbitro', 'Árbitro asistente', 'Cuarto árbitro', 'Asesor']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(color: Colors.white),
                ),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _selectedRole = newValue ?? 'Árbitro'; // Usar "Árbitro" como valor predeterminado
              });
            },
          ),

          SizedBox(height: 20),

          // Mostrar el campo de texto solo si se selecciona un rol
          if (_selectedRole != null && _selectedRole!.isNotEmpty)
            _buildInputField(
                "Nombre del $_selectedRole",
                _roleControllers[_selectedRole] ?? TextEditingController(), // Si es null, usa un controlador por defecto
                "Escribe el nombre del $_selectedRole"
            ),
        ],
      ),
    );
  }


}
