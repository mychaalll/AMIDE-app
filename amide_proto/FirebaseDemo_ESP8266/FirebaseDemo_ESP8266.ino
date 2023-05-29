#include <ESP8266WiFi.h> // board
#include <FirebaseArduino.h> // firebase
#include <Wire.h> 
#include "MAX30100_PulseOximeter.h" // pulse oximeter
#include <Adafruit_MLX90614.h> // temperature

// Set these to run example.
// initiating constants
#define FIREBASE_HOST "amide-thesis-default-rtdb.firebaseio.com" 
#define FIREBASE_AUTH "Vd4rKjpGMY4df9e8y7xMhSzVna1L4ROD4IYtNrQ4"
#define WIFI_SSID "PLDTHOMEFIBR50865"
#define WIFI_PASSWORD "Kojiro@rt1412"

#define REPORTING_PERIOD_MS 1000
#define DURATION_MS 5000

// PulseOximeter is the higher level interface to the sensor
// it offers:
//  * beat detection reporting
//  * heart rate calculation
//  * SpO2 (oxidation level) calculation

PulseOximeter pox;
uint32_t tsLastReport = 0;
unsigned long startTime;
Adafruit_MLX90614 mlx = Adafruit_MLX90614();

// Callback (registered below) fired when a pulse is detected
void onBeatDetected() {
  Serial.println("Beat!");
}


void setup() {
  Serial.begin(115200);

  // connect to wifi.
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD); // start wifi
  Serial.print("connecting");
  while (WiFi.status() != WL_CONNECTED) { // connecting
    Serial.print(".");
    delay(500);
  }
  Serial.println();
  Serial.print("connected: ");
  Serial.println(WiFi.localIP());
  
  Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH); // start firebase

  mlx.begin();

  // Serial.print("Initializing pulse oximeter..");

  // Initialize the PulseOximeter instance
  // Failures are generally due to an improper I2C wiring, missing power supply
  // or wrong target chip

  // if (!pox.begin()) {
  //   Serial.println("FAILED");
  //   for(;;);
  // } else {
  //   Serial.println("SUCCESS");
  // }

  // The default current for the IR LED is 50mA and it could be changed
  //   by uncommenting the following line. Check MAX30100_Registers.h for all the
  //   available options.
  // pox.setIRLedCurrent(MAX30100_LED_CURR_7_6MA);

  // Register a callback for the beat detection

  // pox.setOnBeatDetectedCallback(onBeatDetected);

  startTime = millis();
}

int n = 0;

void loop() {
  Serial.print("Ambient = "); 
  Serial.print(mlx.readAmbientTempC()); 
  Serial.print("*C\tObject = "); 
  Serial.print(mlx.readObjectTempC()); 
  Serial.println("*C");
  Serial.print("Ambient = "); 
  Serial.print(mlx.readAmbientTempF()); 
  Serial.print("*F\tObject = "); 
  Serial.print(mlx.readObjectTempF()); 
  Serial.println("*F");

  Serial.println();

  // set value of heart Rate
  Firebase.pushFloat("temperature", mlx.readObjectTempC());
  // handle error
  if (Firebase.failed()) {
    Serial.print("setting /number failed:");
      Serial.println(Firebase.error());  
      return;
  }
  delay(5000);
  // if (millis() - startTime >= DURATION_MS) {
  //   Serial.println("5 seconds have passed");
  //   while(1);
  // }
  
  // pox.update();

  // if (millis() - startTime >= DURATION_MS) {
  //   Serial.println("5 seconds have passed:");
  //   while(1);
  // }

  
  // if (millis() - tsLastReport > REPORTING_PERIOD_MS) {
  //   startTime = millis();
  //   Serial.print("Heart rate:");
  //   Serial.print(pox.getHeartRate());
  //   Serial.print("bpm / SpO2:");
  //   Serial.print(pox.getSpO2());
  //   Serial.println("%");

  
  //   tsLastReport = millis();
  // }

  // // set value of heart Rate
  // Firebase.pushFloat("heart_rate", pox.getHeartRate());
  // handle error
  // if (Firebase.failed()) {
  //   Serial.print("setting /number failed:");
  //     Serial.println(Firebase.error());  
  //     return;
  // }

  // // set value
  // Firebase.setFloat("number", 42.0);
  // // handle error
  // if (Firebase.failed()) {
  //     Serial.print("setting /number failed:");
  //     Serial.println(Firebase.error());  
  //     return;
  // }
  // delay(1000);
  
  // // update value
  // Firebase.setFloat("number", 43.0);
  // // handle error
  // if (Firebase.failed()) {
  //     Serial.print("setting /number failed:");
  //     Serial.println(Firebase.error());  
  //     return;
  // }
  // delay(1000);

  // // get value 
  // Serial.print("number: ");
  // Serial.println(Firebase.getFloat("number"));
  // delay(1000);

  // // remove value
  // Firebase.remove("number");
  // delay(1000);

  // // set string value
  // Firebase.setString("message", "hello world");
  // // handle error
  // if (Firebase.failed()) {
  //     Serial.print("setting /message failed:");
  //     Serial.println(Firebase.error());  
  //     return;
  // }
  // delay(1000);
  
  // // set bool value
  // Firebase.setBool("truth", false);
  // // handle error
  // if (Firebase.failed()) {
  //     Serial.print("setting /truth failed:");
  //     Serial.println(Firebase.error());  
  //     return;
  // }
  // delay(1000);

  // // append a new value to /logs
  // String name = Firebase.pushInt("logs", n++);
  // // handle error
  // if (Firebase.failed()) {
  //     Serial.print("pushing /logs failed:");
  //     Serial.println(Firebase.error());  
  //     return;
  // }
  // Serial.print("pushed: /logs/");
  // Serial.println(name);
  // delay(1000);
}
