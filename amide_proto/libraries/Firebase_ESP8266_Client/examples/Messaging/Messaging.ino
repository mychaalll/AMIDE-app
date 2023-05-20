/**
 * Created by K. Suwatchai (Mobizt)
 *
 * Email: k_suwatchai@hotmail.com
 *
 * Github: https://github.com/mobizt/Firebase-ESP8266
 *
 * Copyright (c) 2023 mobizt
 *
 */

// This example shows how to send Firebase Cloud Messaging.

// Library allows your ESP device to interact with FCM server through FCM Server
// protocols.
// https://firebase.google.com/docs/cloud-messaging/server#choose

// This means your device now is not a FCM app client and unable to get the
// notification messages.

// The device registration tokens used in this example were taken from the FCM
// mobile app (Android or iOS)
// or web app that athenticated to your project.

// For FCM client app quick start
// https://github.com/firebase/quickstart-android/tree/master/messaging
// https://github.com/firebase/quickstart-ios
// https://github.com/firebase/quickstart-js

#include <Arduino.h>
#if defined(ESP32)
#include <WiFi.h>
#include <FirebaseESP32.h>
#elif defined(ESP8266)
#include <ESP8266WiFi.h>
#include <FirebaseESP8266.h>
#elif defined(ARDUINO_RASPBERRY_PI_PICO_W)
#include <WiFi.h>
#include <FirebaseESP8266.h>
#endif

#define WIFI_SSID "WIFI_AP"
#define WIFI_PASSWORD "WIFI_PASSWORD"

#define FIREBASE_FCM_SERVER_KEY "FIREBASE_PROJECT_CLOUD_MESSAGING_SERVER_KEY"
#define FIREBASE_FCM_DEVICE_TOKEN_1 "RECIPIENT_DEVICE_TOKEN"
#define FIREBASE_FCM_DEVICE_TOKEN_2 "ANOTHER_RECIPIENT_DEVICE_TOKEN"

// Define Firebase Data object
FirebaseData fbdo;

unsigned long lastTime = 0;

int count = 0;

#if defined(ARDUINO_RASPBERRY_PI_PICO_W)
WiFiMulti multi;
#endif

void sendMessage();

void setup()
{

    Serial.begin(115200);

#if defined(ARDUINO_RASPBERRY_PI_PICO_W)
    multi.addAP(WIFI_SSID, WIFI_PASSWORD);
    multi.run();
#else
    WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
#endif

    Serial.print("Connecting to Wi-Fi");
    unsigned long ms = millis();
    while (WiFi.status() != WL_CONNECTED)
    {
        Serial.print(".");
        delay(300);
#if defined(ARDUINO_RASPBERRY_PI_PICO_W)
        if (millis() - ms > 10000)
            break;
#endif
    }
    Serial.println();
    Serial.print("Connected with IP: ");
    Serial.println(WiFi.localIP());
    Serial.println();

    Serial.printf("Firebase Client v%s\n\n", FIREBASE_CLIENT_VERSION);

    Firebase.reconnectWiFi(true);

    // The WiFi credentials are required for Pico W
    // due to it does not have reconnect feature.
#if defined(ARDUINO_RASPBERRY_PI_PICO_W)
    WiFiCreds.clearAP();
    WiFiCreds.addAP(WIFI_SSID, WIFI_PASSWORD);
#endif

    fbdo.fcm.begin(FIREBASE_FCM_SERVER_KEY);

    fbdo.fcm.addDeviceToken(FIREBASE_FCM_DEVICE_TOKEN_1);

    fbdo.fcm.addDeviceToken(FIREBASE_FCM_DEVICE_TOKEN_2);

    fbdo.fcm.setPriority("high");

    fbdo.fcm.setTimeToLive(1000);

    sendMessage();
}

void loop()
{
    if (millis() - lastTime > 60 * 1000)
    {
        lastTime = millis();
        sendMessage();
    }
}

void sendMessage()
{

    fbdo.fcm.setNotifyMessage("Notification", "Hello World! " + String(count));

    FirebaseJson msg;
    msg.add("myData", count);

    fbdo.fcm.setDataMessage(msg.raw());

    // Firebase.broadcastMessage(fbdo)
    // Firebase.sendTopic(fbdo)
    Serial.printf("Send message... %s\n", Firebase.sendMessage(fbdo, 0) ? "ok" : fbdo.errorReason().c_str());

    if (fbdo.httpCode() == FIREBASE_ERROR_HTTP_CODE_OK)
        Serial.println(fbdo.fcm.getSendResult());

    Serial.println();

    count++;
}
