import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return const MyHomePage();
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    PageOne(),
    MyStepper(),
    PageThree(),
    FivetPage(),
    PageFour(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Tutorial Flutter'),
          backgroundColor: Color.fromARGB(255, 188, 218, 243),
        ),
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Página 1',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Página 2',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'Página 3',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.scale),
              label: 'Página 4',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.mail),
              label: 'Página 5',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Color.fromARGB(255, 22, 240, 131),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

class PageOne extends StatelessWidget {
  const PageOne({Key? key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey, // Color de fondo para la página 1
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/flutter.jpg',
              width: 250,
              height: 200,
            ),
            const SizedBox(height: 20),
            const Text(
              'Flutter',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Color.fromARGB(255, 20, 92, 71),
                decoration: TextDecoration.underline,
                decorationColor: Colors.red,
                decorationStyle: TextDecorationStyle.dotted,
              ),
            ),
            const Text(
              'Tecnología Multiplataforma',
              style: TextStyle(fontSize: 20.0),
            ),
            Container(
              margin: const EdgeInsets.all(20.0),
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              child: const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris aliquet justo nec eleifend interdum. Fusce posuere mi sed ligula interdum vulputate. Integer ut augue vitae enim luctus finibus.',
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyStepper extends StatefulWidget {
  const MyStepper({Key? key});

  @override
  _MyStepperState createState() => _MyStepperState();
}

class _MyStepperState extends State<MyStepper> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Proceso de Programación'),
      ),
      body: Stepper(
        type: StepperType.vertical,
        currentStep: _currentStep,
        onStepContinue: () {
          setState(() {
            if (_currentStep < 2) {
              _currentStep++;
            }
          });
        },
        onStepCancel: () {
          setState(() {
            if (_currentStep > 0) {
              _currentStep--;
            }
          });
        },
        steps: <Step>[
          Step(
            title: const Text('Planificación'),
            content: const Column(
              children: <Widget>[
                Text('Establecer objetivos'),
                Text('Diseñar la arquitectura'),
                Text('Planificar la implementación'),
              ],
            ),
            isActive: _currentStep >= 0,
          ),
          Step(
            title: Text('Codificación'),
            content: Column(
              children: <Widget>[
                Text('Escribir código limpio y modular'),
                Text('Realizar pruebas unitarias'),
                Text('Integrar funcionalidades paso a paso'),
              ],
            ),
            isActive: _currentStep >= 1,
          ),
          Step(
            title: Text('Depuración'),
            content: Column(
              children: <Widget>[
                Text('Identificar y corregir errores'),
                Text('Optimizar el rendimiento'),
                Text('Realizar pruebas de integración'),
              ],
            ),
            isActive: _currentStep >= 2,
          ),
        ],
      ),
    );
  }
}

class PageThree extends StatelessWidget {
  const PageThree({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejemplo de Formulario Simple'),
      ),
      body: Container(
        color: const Color.fromARGB(255, 156, 236, 228), // Color de fondo para la página 3
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Nombre',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa tu nombre';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Correo Electrónico',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa tu correo electrónico';
                    }
                    return null;
                  },
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Text('Enviar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PageFour extends StatelessWidget {
  const PageFour({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Curriculum'),
      ),
      body: Container(
        color: Color.fromARGB(255, 241, 218, 146), // Color de fondo para la página 4
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Nombre',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa tu nombre';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Correo Electrónico',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa tu correo electrónico';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Educación',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa tu historial educativo';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Experiencia Laboral',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa tu experiencia laboral';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Habilidades',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa tus habilidades';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Aquí iría la lógica para enviar el curriculum
                    },
                    child: Text('Enviar Curriculum'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FivetPage extends StatelessWidget {
  const FivetPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Desarrollo de Software'),
      ),
      body: Container(
        color: Color.fromARGB(255, 137, 230, 137), // Color de fondo para la página 5
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'El desarrollo de software es el proceso de crear programas de computadora '
                  'para realizar tareas específicas. Implica diseñar, codificar, probar y '
                  'mantener el software.',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
               Image.network(
                'data:image/png;base64,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', // Enlace de Internet para la imagen
                
                width: 250,
                height: 200,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'El desarrollo de software implica varias etapas, incluyendo:',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ),
              _buildListItem('1. Requisitos y análisis.'),
              _buildListItem('2. Diseño del software.'),
              _buildListItem('3. Implementación y codificación.'),
              _buildListItem('4. Pruebas de software.'),
              _buildListItem('5. Mantenimiento del software.'),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Aquí hay una imagen que representa el ciclo de vida del desarrollo de software:',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              Image.network(
                'https://i0.wp.com/www.sergestec.com/wp-content/uploads/2022/01/ciclo_de_vida_software.jpg?ssl=1' ,               
                width: 250,
                height: 200,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 16.0),
      ),
    );
  }
}
