void setup() {
  // Inicializa la comunicación serie a 115200 baudios
  Serial.begin(115200);
  delay(1000);
}

void loop() {
  // Obtiene la dirección MAC base del chip (Chip ID)
  uint64_t chipid = ESP.getEfuseMac();
  
  Serial.print("ESP32 Chip ID: ");
  // Imprime el ID en formato Hexadecimal de 64 bits
  Serial.printf("%04X%08X\n", (uint16_t)(chipid >> 32), (uint32_t)chipid);
  
  // Espera 5 segundos antes de volver a mostrarlo
  delay(5000);
}
