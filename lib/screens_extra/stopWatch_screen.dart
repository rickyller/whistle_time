import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:lottie/lottie.dart';

import '../colors.dart';

class StopwatchScreen extends StatefulWidget {
  final PageController pageController;

  StopwatchScreen({required this.pageController});

  @override
  _StopwatchScreenState createState() => _StopwatchScreenState();
}

class _StopwatchScreenState extends State<StopwatchScreen>
    with TickerProviderStateMixin {
  final StopWatchTimer _stopWatchTimer = StopWatchTimer();
  final StopWatchTimer _miniStopWatchTimer = StopWatchTimer(); // Mini cronómetro para tiempo perdido
  late AnimationController _animationController; // Controlador de animación para Lottie

  // Controladores para la pulsación de cada ícono
  late AnimationController _leftArrowController;
  late AnimationController _playPauseController;
  late AnimationController _resetController;
  late AnimationController _rightArrowController;
  late AnimationController _miniPlayPauseController; // Controlador para el botón de play/pause del mini-cronómetro

  bool isRunning = false;
  bool isMiniRunning = false; // Control para el mini-cronómetro
  bool isRecording = false; // Control para la animación de grabación
  int team1Score = 1;
  int team2Score = 0;

  @override
  void initState() {
    super.initState();
    // Inicializamos el controlador de la animación para Lottie
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    // Inicializamos los controladores para cada ícono
    _leftArrowController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
    );
    _playPauseController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
    );
    _resetController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
    );
    _rightArrowController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
    );
    _miniPlayPauseController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _leftArrowController.dispose();
    _playPauseController.dispose();
    _resetController.dispose();
    _rightArrowController.dispose();
    _miniPlayPauseController.dispose();
    _stopWatchTimer.dispose();
    _miniStopWatchTimer.dispose(); // Dispose del mini-cronómetro
    super.dispose();
  }

  void toggleRecording() {
    setState(() {
      isRecording = !isRecording; // Alternar grabación
      if (isRecording) {
        _animationController.repeat(min: 0.2, max: 0.5);
      } else {
        _animationController.repeat(min: 0.0, max: 0.0);
      }
    });
  }

  // Controla la pulsación para un ícono específico
  void _onTapDown(AnimationController controller) {
    controller.forward();
  }

  void _onTapUp(AnimationController controller) {
    controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Marcador en la parte superior
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                '$team1Score - $team2Score',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Cronómetro en el centro
            StreamBuilder<int>(
              stream: _stopWatchTimer.rawTime,
              initialData: 0,
              builder: (context, snapshot) {
                final value = snapshot.data ?? 0;
                final displayTime = StopWatchTimer.getDisplayTime(
                  value,
                  hours: true,
                  minute: true,
                  second: true,
                  milliSecond: false,
                );
                return Center(
                  child: Text(
                    displayTime,
                    style: TextStyle(
                      fontSize: 30, // Reducimos ligeramente el tamaño
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                      fontFamily: 'brave', // Aquí aplicas la fuente Brave
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 8), // Espaciado entre el cronómetro y los botones

            // Botones de control y flechas de navegación con animación de pulsación
            Expanded(
              flex: 2, // Aumentamos flex para dar más espacio
              child: Stack(
                children: [
                  // Flecha izquierda
                  Positioned(
                    left: -15, // Coloca la flecha en el extremo izquierdo
                    top: -10, // Ajustamos la posición de las flechas
                    child: GestureDetector(
                      onTapDown: (_) => _onTapDown(_leftArrowController),
                      onTapUp: (_) => _onTapUp(_leftArrowController),
                      onTap: () {
                        if (widget.pageController.hasClients &&
                            widget.pageController.page != 0) {
                          widget.pageController.previousPage(
                            duration: Duration(milliseconds: 200),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      child: ScaleTransition(
                        scale: Tween(begin: 1.0, end: 0.9).animate(_leftArrowController),
                        child: Container(
                          width: 45, // Reducimos ligeramente el tamaño
                          height: 45,
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.arrow_left,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Flecha derecha
                  Positioned(
                    right: -15, // Coloca la flecha en el extremo derecho
                    top: -10, // Ajustamos la posición de las flechas
                    child: GestureDetector(
                      onTapDown: (_) => _onTapDown(_rightArrowController),
                      onTapUp: (_) => _onTapUp(_rightArrowController),
                      onTap: () {
                        if (widget.pageController.hasClients &&
                            widget.pageController.page !=
                                widget.pageController.positions.first.maxScrollExtent) {
                          widget.pageController.nextPage(
                            duration: Duration(milliseconds: 200),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      child: ScaleTransition(
                        scale: Tween(begin: 1.0, end: 0.9).animate(_rightArrowController),
                        child: Container(
                          width: 45, // Reducimos ligeramente el tamaño
                          height: 45,
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.arrow_right,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Botones centrales (play/pause, reset y mini-cronómetro con botón)
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTapDown: (_) => _onTapDown(_playPauseController),
                          onTapUp: (_) => _onTapUp(_playPauseController),
                          onTap: () {
                            setState(() {
                              if (isRunning) {
                                _stopWatchTimer.onStopTimer();
                              } else {
                                _stopWatchTimer.onStartTimer();
                              }
                              isRunning = !isRunning;
                            });
                          },
                          child: ScaleTransition(
                            scale: Tween(begin: 1.0, end: 0.9).animate(_playPauseController),
                            child: Container(
                              width: 55, // Reducimos ligeramente el tamaño
                              height: 55,
                              alignment: Alignment.center,
                              child: Icon(
                                isRunning
                                    ? Icons.pause_circle_filled
                                    : Icons.play_circle_filled,
                                color: AppColors.teal,
                                size: 35,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 15), // Espacio entre los botones

                        // Botón de reset
                        GestureDetector(
                          onTapDown: (_) => _onTapDown(_resetController),
                          onTapUp: (_) => _onTapUp(_resetController),
                          onTap: () {
                            _stopWatchTimer.onResetTimer();
                            _miniStopWatchTimer.onResetTimer(); // Resetea el mini-cronómetro también
                          },
                          child: ScaleTransition(
                            scale: Tween(begin: 1.0, end: 0.9).animate(_resetController),
                            child: Container(
                              width: 55, // Reducimos ligeramente el tamaño
                              height: 55,
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.refresh,
                                color: Colors.white,
                                size: 35,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(width: 10), // Espacio entre reset y mini-cronómetro

                        // Colocamos el mini-cronómetro con su botón
                        Column(
                          mainAxisSize: MainAxisSize.min, // Evita desbordamientos
                          children: [
                            // Mini-cronómetro con ancho fijo
                            Container(
                              width: 60, // Fijamos el ancho para evitar que se mueva
                              child: StreamBuilder<int>(
                                stream: _miniStopWatchTimer.rawTime,
                                initialData: 0,
                                builder: (context, snapshot) {
                                  final value = snapshot.data ?? 0;
                                  final displayTime = StopWatchTimer.getDisplayTime(
                                    value,
                                    hours: false,
                                    minute: true,
                                    second: true,
                                    milliSecond: false,
                                  );
                                  return Text(
                                    displayTime,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14, // Reducimos el tamaño para evitar overflow
                                      color: AppColors.grey, // Color gris
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'brave',
                                    ),
                                  );
                                },
                              ),
                            ),

                            // Botón de inicio/pausa para el mini-cronómetro
                            GestureDetector(
                              onTapDown: (_) => _onTapDown(_miniPlayPauseController),
                              onTapUp: (_) => _onTapUp(_miniPlayPauseController),
                              onTap: () {
                                setState(() {
                                  if (isMiniRunning) {
                                    _miniStopWatchTimer.onStopTimer();
                                  } else {
                                    _miniStopWatchTimer.onStartTimer();
                                  }
                                  isMiniRunning = !isMiniRunning;
                                });
                              },
                              child: ScaleTransition(
                                scale: Tween(begin: 1.0, end: 0.9).animate(_miniPlayPauseController),
                                child: Container(
                                  width: 35, // Reducimos el tamaño
                                  height: 35,
                                  alignment: Alignment.center,
                                  child: Icon(
                                    isMiniRunning
                                        ? Icons.pause_circle_filled
                                        : Icons.play_circle_filled,
                                    color: AppColors.grey,
                                    size: 28,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Botón de micrófono Lottie en la parte inferior
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: toggleRecording,
              child: Center(
                child: Lottie.asset(
                  'assets/microphone_animation.json',
                  controller: _animationController, // Controlador de la animación
                  width: screenWidth * .30, // Ajustamos el tamaño
                  height: screenWidth * .30,
                ),
              ),
            ),
            SizedBox(height: 5), // Ajuste final de espaciado
          ],
        ),
      ),
    );
  }
}
