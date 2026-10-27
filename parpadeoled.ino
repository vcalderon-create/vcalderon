// Definimos el pin del LED integrado (GPIO 2 en la mayoría de ESP32)
const int ledPin = 2;

void setup() {
  // Configura el pin del LED como salida
  pinMode(ledPin, OUTPUT);
}

void loop() {
  digitalWrite(ledPin, HIGH); // Enciende el LED
  delay(1000);                // Espera 1 segundo
  digitalWrite(ledPin, LOW);  // Apaga el LED
  delay(1000);                // Espera 1 segundo
}
