void setup() {
  // Inicializa el puerto serie a 115200 baudios
  Serial.begin(115200);
  delay(1000);
  Serial.println("Sistema iniciado correctamente.");
}

void loop() {
  // Imprime el mensaje solicitado en el monitor
  Serial.println("Loop ejecutado de forma correcta.");
  
  // Pausa obligatoria de 2000 milisegundos (2 segundos)
  delay(2000);
}
