#include <EEPROM.h>


void envoiEEPROM(byte fxEnv, int adress, String idE) {
  // Sous forme : EEPR fx info OA (OD) e fx nInf r v b w f1 f2 OA (OD)
  String envoi = "EEPR";

  // envoi += idE;
  envoi += char(fxEnv);    // Voir si ça marche ou si je dois envoyer un char plutot que byte?
  char nbE = EEPROM.read(adress); //
  envoi += nbE;
  Serial.println(envoi);
  for (byte i = 0; i < nbE; i++) {   // Boucle de chgt d'étape
    envoi = "e";
    envoi += char(fxEnv);
    envoi += char(i);
    for (byte j = 0; j < 6; j++) {
      envoi += char(EEPROM.read(adress + 1 + j + 6 * i));
    }
    Serial.println(envoi);          // QUESTION : le byte OD (soit 10) peut il être confondu avec un byte de couleur 10 chez le recepteur ? OUI!
    delay(300);
  }
  Serial.println();
}

//////////////////////////////////////////////////////////////

void viderBuffer() {
  while (Serial.available()) {
    char c = Serial.read();
  }
}

/////////////////////////////////////////////////////////////

void chgtId(String newId) {

  for (int i = 0; i < 3; i++) {
    EEPROM.update(EEPROM.length() - 3 + i, newId.charAt(0));
    newId = newId.substring(1);
  }

}

////////////////

void chgtTelec() {

  String textEntrant = "";
  delay(10);
  for (int i = 0; i < 4; i++) {
    textEntrant = Serial.readStringUntil('.');
    char b = char(textEntrant.toInt());
    EEPROM.update(EEPROM.length() - 7 + i, b );
  }
}

/////////////

void lectBoutTelec() {

  for (int i = 0; i < 4; i++) {
    Serial.print(EEPROM[EEPROM.length() - 7 + i]);
    Serial.print('.');
  }
  Serial.println();
}
