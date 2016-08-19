#include <ArduinoPebbleSerial.h>

// MLX sensor setup
#include <Wire.h>
#include <MLX90614.h>
MLX90614 mlx = MLX90614(MLX90614_I2CDEFAULTADDR);      // *** must be only one device on bus ***
uint16_t to1, ta;
//

// Pebble SmartStrap setup
static const uint16_t SUPPORTED_SERVICES[] = {0x0000};
static const uint8_t NUM_SERVICES = 1;
static uint8_t pebble_buffer[GET_PAYLOAD_BUFFER_SIZE(64)];
//

void setup() {
  // General init
  Serial.begin(115200);
  mlx.begin();  
  const uint8_t PEBBLE_PIN = 2;

  ArduinoPebbleSerial::begin_software(PEBBLE_PIN, pebble_buffer, sizeof(pebble_buffer), Baud57600,
                                      SUPPORTED_SERVICES, NUM_SERVICES);
}

void loop() {
  // Let the ArduinoPebbleSerial code do its processing
  size_t length;
  uint16_t service_id;
  uint16_t attribute_id;
  RequestType type;
  if (ArduinoPebbleSerial::feed(&service_id, &attribute_id, &length, &type)) {
    if ((service_id == 0) && (attribute_id == 0)) {
      // we have a raw data frame to process
      if (type == RequestTypeRead) {
        // send a response to the Pebble - reuse the same buffer for the response
        memcpy(pebble_buffer, &to1, 2);
        memcpy(pebble_buffer+2, &ta, 2);
        ArduinoPebbleSerial::write(true, pebble_buffer, 4);
      } else if (type == RequestTypeWrite) {
        Serial.print("Got raw data write: ");
        Serial.println((uint8_t)pebble_buffer[0], DEC);
      } else {
      
      }
    }
  }

  //read temperature:
  to1 = mlx.read16(MLX90614_TOBJ1);
  ta = mlx.read16(MLX90614_TA);
  Serial.println(to1);
  //

  static bool is_connected = false;
  if (ArduinoPebbleSerial::is_connected()) {
    if (!is_connected) {
      Serial.println("Connected to the smartstrap!");
      is_connected = true;
    }
    static uint32_t last_notify = 0;
    if (last_notify == 0) {
      last_notify = millis();
    }

    if (millis() - last_notify  > 200) {
      Serial.println("Sending notification for 0x0,0x0");
      ArduinoPebbleSerial::notify(0x0, 0x0);
      last_notify = millis();
    }
  } else {
    if (is_connected) {
      Serial.println("Disconnected from the smartstrap!");
      is_connected = false;
    }
  }
}
