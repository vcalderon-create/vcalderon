#define BUTTON_PIN 13      // Pin GPIO13 conectado al botón
#define DEBOUNCE_TIME 50   // Tiempo de debounce en milisegundos

// Variables globales para la lógica de antirrebote
int lastSteadyState = LOW;
int lastFlickerableState = LOW;
int currentState;
unsigned long lastDebounceTime = 0;

// Variable global para contar las pulsaciones (Modificación requerida)
int contadorPulsaciones = 0;

void setup() {
  Serial.begin(9600);                  // Inicializa el monitor serie
  pinMode(BUTTON_PIN, INPUT_PULLUP);   // Configura el pin en modo Pull-up interno
}

// Función que gestiona el debounce y devuelve 'true' solo en el flanco de bajada
bool button() {
  currentState = digitalRead(BUTTON_PIN);
  
  if (currentState != lastFlickerableState) {
    lastDebounceTime = millis();
    lastFlickerableState = currentState;
  }
  
  if ((millis() - lastDebounceTime) > DEBOUNCE_TIME) {
    if (lastSteadyState != currentState) {
      lastSteadyState = currentState;
      // Retorna true si el estado final se estabiliza en LOW (botón presionado)
      return (currentState == LOW);
    }
  }
  return false;
}

void loop() {
  // Si la función detecta una pulsación real y filtrada
  if (button()) {
    contadorPulsaciones++; // Incrementa el contador
    Serial.print("Boton pulsado. Total de veces: ");
    Serial.println(contadorPulsaciones);
  }
}
