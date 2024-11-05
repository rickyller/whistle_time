from openai import OpenAI

# Inicializa el cliente de OpenAI
client = OpenAI()

# Abrir el archivo de audio
audio_file = open("audios/grabacion.wav", "rb")

# Realiza la transcripción
transcription = client.audio.transcriptions.create(
  model="whisper-1", 
  file=audio_file, 
  response_format="text",  # Recibimos una cadena directamente
  prompt="""Eres un árbitro de fútbol y estás transcribiendo eventos en tiempo real durante un partido. 
  Los eventos incluyen acciones como: gol, falta, tarjeta amarilla (amonestado), tarjeta roja (expulsado), fuera de juego, penalti, saque de banda, saque de esquina, tiro libre, y lesiones. 
  Los tipos de faltas incluyen: Patada, entrada, cargar, empujar, golpear, sujetar, obstruir, saltar encima.
  Las estructuras comunes que escucharás son las siguientes:

  - 'Tarjeta amarilla para el jugador número X por [tipo de falta]' (Ejemplo: 'Tarjeta amarilla para el jugador número 8 por patada temeraria')
  - 'Gol del jugador número X' (Ejemplo: 'Gol del jugador número 10')
  - 'Entra 5 y sale el 6' (Ejemplo: 'Ingresa el jugador número 5 y sale el jugador número 6')

  Si detectas palabras que suenan similares al vocabulario arbitral (por ejemplo, 'Estado' en lugar de 'amonestado', 'golpeado' en lugar de 'golpear'), por favor, corrígelas automáticamente para ajustarlas al contexto correcto."""
)


# Imprimir el resultado directamente (sin usar .text)
print(transcription)
