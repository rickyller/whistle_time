from openai import OpenAI

# Inicializa el cliente de OpenAI
client = OpenAI()

def transcribe(audio_file, prompt=""):
    # Transcribe el archivo de audio usando Whisper
    transcription = client.audio.transcriptions.create(
        model="whisper-1", 
        file=audio_file,  # Aquí pasamos el archivo abierto, no la cadena
        response_format="text",  # Obtenemos una cadena directamente
        language="es",  # Aseguramos que Whisper sepa que el audio está en español
        prompt=prompt
    )
    return transcription

def generate_corrected_transcript(temperature, system_prompt, audio_file_path):
    # Abre el archivo de audio
    with open(audio_file_path, "rb") as audio_file:
        # Realiza la transcripción del audio primero
        transcribed_text = transcribe(audio_file)
    
    # Utiliza el modelo GPT para corregir la transcripción
    response = client.chat.completions.create(
        model="gpt-4",  # Puedes usar "gpt-4" si tienes acceso
        temperature=0.1,
        messages=[
            {
                "role": "system",
                "content": system_prompt
            },
            {
                "role": "user",
                "content": transcribed_text  # Pasa la transcripción como contenido del usuario
            }
        ]
    )
    
    # Devuelve el texto corregido del primer mensaje, usando el atributo .content
    return response.choices[0].message.content

# Define el prompt del sistema para la corrección
system_prompt = """Eres un árbitro de fútbol y estás transcribiendo eventos en tiempo real durante un partido. 
  Tu tarea es identificar lo siguiente, en este orden:
  
  1. El tipo de evento (amonestación, expulsión, gol, sustitución, lesión, fuera de juego, penalti, etc.)
  2. El número del jugador involucrado en el evento.
  3. Detalles adicionales relacionados con el evento, como el tipo de falta o cualquier otra acción.

  Los tipos de eventos incluyen: gol, falta, tarjeta amarilla (amonestado), tarjeta roja (expulsado), fuera de juego, penalti, saque de banda, saque de esquina, tiro libre, y lesiones. 
  Los tipos de faltas incluyen: Patada, entrada, empujar, golpear, sujetar, obstruir, saltar encima.

  Las estructuras comunes que escucharás son las siguientes:
  - 'Tarjeta amarilla para el jugador número X por [tipo de falta]' (Ejemplo: 'Tarjeta amarilla para el jugador número 8 por patada temeraria')
  - 'Gol del jugador número X' (Ejemplo: 'Gol del jugador número 10')
  - 'Entra el jugador número X y sale el jugador número Y' (Ejemplo: 'Ingresa el jugador número 5 y sale el jugador número 6')

  Si detectas palabras que suenan similares al vocabulario arbitral (por ejemplo, 'Estado' en lugar de 'amonestado', 'golpeado' en lugar de 'golpear'), por favor, corrígelas automáticamente para ajustarlas al contexto correcto.
  Es importante que identifiques correctamente los eventos y los detalles, es decir, el evento preciso, el tipo de falta preciso, y el jugador involucrado.
  Debes escuchar y comparar con el vocabulario: Tipos de falta y eventos para hacer una transcripción precisa.
  Compara detenidamente para que compares el vocabulario y des la respuesta más precisa o aproximada posible. 
  """


corrected_text = generate_corrected_transcript(0, system_prompt, "audios/grabacion2.wav")

print(corrected_text)
