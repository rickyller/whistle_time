import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:whisper_flutter_new/whisper_flutter_new.dart';

class VoiceNoteService {
  late Whisper _whisper;
  late Directory _cacheDir;

  VoiceNoteService() {
    _initializeWhisper();
  }

  Future<void> _initializeWhisper() async {
    _whisper = Whisper(
      model: WhisperModel.base,
      downloadHost: "https://huggingface.co/ggerganov/whisper.cpp/resolve/main",
    );
    _cacheDir = await getTemporaryDirectory(); // Carpeta de caché
  }

  // Grabar y guardar la nota de voz en caché
  Future<String> storeVoiceNote(File audioFile) async {
    try {
      String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
      String filePath = '${_cacheDir.path}/voice_note_$timestamp.wav';
      File storedFile = await audioFile.copy(filePath);  // Guarda en caché
      return storedFile.path;
    } catch (e) {
      print("Error al guardar la nota de voz: $e");
      throw Exception("Error al guardar la nota de voz");
    }
  }

  // Verifica si hay conexión a internet
  Future<bool> hasInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }

  // Realiza la transcripción de una nota de voz desde caché
  Future<String?> transcribeVoiceNote(String voiceNotePath) async {
    try {
      // Solo transcribe si hay conexión a internet
      if (await hasInternetConnection()) {
        WhisperTranscribeResponse response = await _whisper.transcribe(
          transcribeRequest: TranscribeRequest(
            audio: voiceNotePath,
            isTranslate: false,
            isNoTimestamps: true,
            splitOnWord: true,
          ),
        );
        return response.text;
      } else {
        print("No hay conexión a internet. Transcripción aplazada.");
        return null;
      }
    } catch (e) {
      print("Error al transcribir la nota de voz: $e");
      throw Exception("Error al transcribir la nota de voz");
    }
  }

  // Transcribir todas las notas almacenadas en caché cuando haya conexión
  Future<void> transcribeAllCachedNotes() async {
    List<FileSystemEntity> cachedFiles = _cacheDir.listSync();
    for (var file in cachedFiles) {
      if (file.path.endsWith('.wav')) {
        String? transcription = await transcribeVoiceNote(file.path);
        if (transcription != null) {
          print("Transcripción: $transcription");
          // Aquí puedes manejar la transcripción (guardarla, mostrarla, etc.)
        }
      }
    }
  }
}
