
/**
* Research Project Health Monitoring With integrated IOT
* Author: Ecaldre, Esurena, Pajunar, Tiamzon
* Date: April 24, 2023
*
* INSTRUCTIONS:
* - Clone the Repository
* - Open the *.ino file
* - Install libriries
* - - - - Click on Sketch -> Include Libraries -> Manage Libraries
* - - - - Firebase ESP8266 Client by Mobizt
* - - - - MAX30100lib by OXullo Intersecans
* - - - - WiFiManager by tzapu
*
*/

// Include Necessary Libraries
#include <FirebaseESP8266.h>
#include <WiFiManager.h> // Manage Wifi
#include "MAX30100_PulseOximeter.h" // Heart Rate and SPO2 Sensor

// Display Report of BPM and SpO2 every 1 second
#define REPORTING_PERIOD_MS 1000

MAX30100 sensor;
PulseOximeter pox;
uint32_t tsLastReport = 0;
FirebaseData fbdo;
FirebaseConfig config;

// Firebase Constants from Project Settings
#define FB_PROJECT_ID "amide-thesis" // Firebase Proejct ID
#define FB_APP_ID "1:508133188397:web:2c3b1dffa13f15ba6869a4" // Firebase App ID


// String paths to key
const String path_temp = "/temp";
const String path_bp = "/blood_pressure";
const String path_heart = "/blood_pressure";
const String path_spo2 = "/spo2";

const int int_pin = D0;
volatile int int_count = 0;

// Interrupt Handler
void handleInterrupt() {
  int_count++;
}

// WiFi Setup
void connectWiFi() {
  // Creates an intance of WiFi Connection Management
  WiFiManager manage_wifi; 

  // Manage Wifi
  manage_wifi.autoConnect("ESP_AP", "ESP8266wemos");
  
  // Display Connections
  Serial.println("WiFi Connection Established");
}

// void writeToFirebase(String path, String data) {
//   if (Firebase.RTDB.setString(fbdo, path, data)) {
//     Serial.println("Write Succeeded!");
//   } else {
//     Serial.println("An Error has occured");
//     Serial.println(fbdo.errorReason());
//   }
// }

void beatDetected() {
  Serial.println("Beat...");
}

void setup() {
  // Firebase Configurations
  config.host = "amide-thesis.firebaseapp.com"; // Configuration Hostname / Domain
  config.api_key = "AIzaSyDuf6YfYifUCjvBSbCi1cNLV_zE6L4XY7k"; // Configuration API KEY
  config.database_url = "https://amide-thesis-default-rtdb.firebaseio.com/"; // Configuration DB URL

  Serial.begin(115200);
  connectWiFi(); // Establish WiFi Connection

  Firebase.begin(&config); // Initialize Firebase

  sensor.begin(); // Initialize Sensor

  attachInterrupt(digitalPinToInterrupt(int_pin), handleInterrupt, RISING);

  // Check if Sensor if Initialized and can be read
  if(!pox.begin(PULSEOXIMETER_DEBUGGINGMODE_PULSEDETECT)){
    Serial.println("Failed to Initialize the PulseOximeter");
    for(;;);
  } else {
    Serial.println("Success!!!");
  }
  // Configs for Sensor
  pox.setIRLedCurrent(MAX30100_LED_CURR_7_6MA);
  pox.setOnBeatDetectedCallback(&beatDetected);
}

void loop() {
  // Initialize Variables
  float heart_rate;
  uint8_t spo2;

  // Update Pulse Oximeter
  pox.update();
  // Compare Runtime to give Output every REPORTING PERIOD
  if (millis() - tsLastReport > REPORTING_PERIOD_MS) {
    heart_rate = pox.getHeartRate();
    spo2 = pox.getSpO2();


    // Write to Database
    
    
    // Serial Output
    Serial.println("BPM: " + String(heart_rate)); // Heart Rate
    Serial.println("SpO2: " +String(spo2)); // SPO2
    tsLastReport = millis();
  }


}
