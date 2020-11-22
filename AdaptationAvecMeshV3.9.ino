/* Ce programme est la version 9 du système de lumière avec les memoires gérées en EEPROM.
 Communication avec Processing OK pour Ecriture EEPROM

 NOUVEAU ICI : Montées Exponentielles

 A améliorer :  - Cryptage de la commande direct (Preview ou boussole)
                  - Flash Envoi/ Reception

*/


////////////// MODE MANUEL ////////////

#include <EEPROM.h>
#include "fonctionsAuto.h"

String ID = "";          // Module GINO

////// DéCLA PINS ///////

const int led[4] = {    //// Patch R V B W
  6, 9, 11, 10
};
//const int resist = 4;     // Résistance de tirage pour éviter la mise en veille en sous consommation.
const int multiBouton = A1; // Entrée analogique de sélection de telecommande
const int bouton = 2 ;      // Bouton d'interruption (entrée) de telecommande
const int drum = A2;        // Entree Piezzo

////// DéCLA VARIABLES /////

/// Commande
int valTelec = 0;
byte fx = 0;
byte memFx = 0;
volatile boolean interupt = 0;
boolean comSerie = 0;

/// Lumière
unsigned int lumiereActuelle[4];
int lumiereCible[4];
int retenu[4];
int flashInt = 0;
boolean flashBool = 0;
const int seuil = 850;
unsigned long int tictac=0;
const unsigned int latenceTap = 300;

/// Mémoire EEPROM
String valeur;   // pour lecture de saisi menu
const int nbrFx = 20;      // Nbre d'effets total
byte adressFx[nbrFx];      // Adresse de l'effet
byte info[nbrFx];          // Contenu de l'octet Info de l'effet

/////////////////////////

void setup() {

  // Initialisation, mise à 0
  for (int i = 0; i < 4; i++) {
    pinMode(led[i], OUTPUT);
    digitalWrite(led[i], LOW);
  }
  // Vérification des 4 couleurs
  for (int i = 0; i < 4; i++) {
    digitalWrite(led[i], HIGH);
    delay(500);
    digitalWrite(led[i], LOW);
  }

  pinMode(bouton, INPUT_PULLUP);
  attachInterrupt (0, routineInterruption, FALLING);

  initAdr();

  // Initialisation du MeshBee pour communication sans fil
  Serial.begin(115200);
  delay(30);
  Serial.println("+++");
  delay(30);
  Serial.println("atdt");
  delay(30);

}

///////////////////////

void loop() {

  if (comSerie == 1) {
    entreeSerie();
    comSerie = 0;
  }
  if (interupt == 1) {
    interruption();
  }

  if (fx < 20) {
    fxParEEPROM(fx);
  }
  else {
    memoireFlash();
  }
}

/////////////////////////////////

void routineInterruption ()  {

  interupt = 1; // booleen pour break du fade
}

/////////////////////////////////////

void memoireFlash() {

  switch (fx) {

    case 20 :            // Mode Batteur
      if (flashBool ==  true ) {
        Serial.println("DOCTTUTF");
        Serial.println(flashInt);     
        fxParEEPROM(19);
        flashBool = false;
        flashInt=0;
      }
      fxParEEPROM(memFx);
      break;

    default :
      cible(0, 0, 0, 0);
      fade(10);
      break;
  }
}
/////////////////////////////////////////////////////

void interruption() {
  if ((valTelec >= 100) && (valTelec < 300)) {
    memFx = fx;
    fx = EEPROM[EEPROM.length() - 7];
    valTelec = 0;
    Serial.print("DOCTTUTP");
    Serial.println(fx);
    delay(5);
  }
  else if ((valTelec >= 300) && (valTelec < 550)) {
    memFx = fx;
    fx = EEPROM[EEPROM.length() - 6];
    valTelec = 0;
    Serial.print("DOCTTUTP");
    Serial.println(fx);
    delay(5);
  }
  else if ((valTelec >= 550) && (valTelec < 800)) {
    memFx = fx;
    fx = EEPROM[EEPROM.length() - 5];
    valTelec = 0;
    Serial.print("DOCTTUTP");
    Serial.println(fx);
    delay(5);
  }
  else if (valTelec >= 800) {
    memFx = fx;
    fx = EEPROM[EEPROM.length() - 4];
    valTelec = 0;
    Serial.print("DOCTTUTP");
    Serial.println(fx);
    delay(5);
  }
  else {
    Serial.print("+++");
    delay(2);
    Serial.println("ATRS");
    delay(200);
    Serial.println("ATDT");
    delay(50);
    Serial.print(ID);
    Serial.println(" OK !");
  }
  interupt = 0;
}

////////////////////////////////

void fxParEEPROM(byte FX) {

  byte nbEtape = EEPROM[adressFx[FX]];
  for (byte i = 0; i < nbEtape; i++) {
    cible(EEPROM[adressFx[FX] + 1 + 6 * i], EEPROM[adressFx[FX] + 2 + 6 * i], EEPROM[adressFx[FX] + 3 + 6 * i], EEPROM[adressFx[FX] + 4 + 6 * i]);
    int fad;
    EEPROM.get(i * 6 + adressFx[FX] + 5, fad);
    fade(fad);
  }
}

///////////////////////////////

void fade(int temps) {
  if (temps == 0)temps = 1;
  for (int j = 0; j < temps; j++) {         // Début de la boucle du tps

    // Les Interuptions possible à chaque boucle de tps //

    if (Serial.available()) {
      comSerie = 1;
      break;
    }
    if (interupt == 1) {
      break;
    }
    if (fx == 20 && ID == "GER" ) {
      flashInt = analogRead(drum);
      
      
      if (flashInt > seuil&& millis()-tictac> latenceTap) {
        flashBool = true;
       tictac = millis();
        break;
      }
    }

    if (analogRead(multiBouton) > 100) {      // Lecture telecommande
      valTelec = analogRead(multiBouton);
    }

    // Le FADE pour de vrai //
    for (int i = 0; i < 4; i++) {
      int difference = lumiereCible[i] - lumiereActuelle[i];
      int grad = difference / (temps - j);
      long int reste = 100 * difference / (temps - j) % 100;
      retenu[i] = retenu[i] + reste;
      if (retenu[i] >= 100) {
        grad++;
        retenu[i] = retenu[i] - 100;
      }
      if (retenu[i] <= -100) {
        grad--;
        retenu[i] = retenu[i] + 100;
      }
      lumiereActuelle[i] = lumiereActuelle[i] + grad;
      analogWrite(led[i], fonctionExp(lumiereActuelle[i]));
      //  Serial.println(grad[i]);
    }
    delay(1);       // Important delay car défini le tps d'une boucle j
  }
  for (int i = 0; i < 4; i++) {
    retenu[i] = 0;
  }
}

//////////////////////////////////
void cible(int a, int b, int c, int d) {

  lumiereCible[0] = a;
  lumiereCible[1] = b;
  lumiereCible[2] = c;
  lumiereCible[3] = d;
}

///////////////////////////////
void entreeSerie() {

  String textEntrant = "";
  delay(10);
  for (int i = 0; i < 4; i++) {
    byte com = Serial.read();
    textEntrant += char(com);
  }
  if (textEntrant != "DOCT") {
    viderBuffer();
    return;
  }

  textEntrant = "";
  for (int i = 0; i < 3; i++) {
    byte com = Serial.read();
    textEntrant += char(com);
  }
  if (textEntrant != ID && textEntrant != "TUT") {
    viderBuffer();
    return;
  }
  char com = Serial.read();

  switch (com) {

    case 'P':
      memFx = fx;
      textEntrant = "";
      while (Serial.available()) {
        char in = Serial.read();
        textEntrant += in;
      }
      fx = byte(textEntrant.toInt());
      Serial.print(ID);
      Serial.print(" - Prog ");
      Serial.println(fx);
      viderBuffer();
      break;

    case 'S':
      ecritureEEPROM();      // Décode entête, procède au décalage d'EEPROM si besoin, puis écrit
      Serial.print(ID);
      Serial.println(" - Ecriture OK");
      viderBuffer();
      break;

    case 'I':                 // demande d'info EEPROM
      textEntrant = "";
      if (Serial.available()) {
        textEntrant = Serial.readStringUntil(10);
        int fxE = textEntrant.toInt();
        envoiEEPROM(byte(fxE), adressFx[fxE], ID);  // Envoi étape par étape l'EEPROM de l'effet demandé
        viderBuffer();
      }
      break;

    case 'Y':                           // ------------> Chgt ID
      textEntrant = "";
      delay(2);
      for (int i = 0; i < 3; i++) {     // Lecture nouvel ID
        char com = Serial.read();
        textEntrant += com;
        delay(2);
      }
      Serial.print(ID);
      Serial.print(" changement d'Id : ");
      Serial.println(textEntrant);
      chgtId(textEntrant);
      textEntrant = "";
      viderBuffer();
      initAdr();
      break;

    case 'T':       // Telecommande Import
      chgtTelec();
      Serial.print(ID);
      Serial.println(" - Ecriture Télécommande OK");
      viderBuffer();
      break;

    case 'R':  // Lecture des infos Telecommandes
      Serial.print("Télécommande ");
      Serial.print(ID);
      Serial.println(" :");
      lectBoutTelec();
      viderBuffer();
      break;

    case 'F':
      memFx = fx;
      fx = 19;
      fxParEEPROM(fx);
      fx = memFx;
      break;

    default :
      Serial.println("DEFAUT");
      viderBuffer();
      break;

  }
}


//////////////////////////////////////////////
void ecritureEEPROM() {

  String lect = "";
  if (Serial.available()) {
    lect = Serial.readStringUntil(10);
  }

  int fxW = lect.toInt();
  lect = lect.substring(lect.indexOf(".") + 1);
  info[fxW] = lect.toInt();

  if (info[fxW] != EEPROM[adressFx[fxW]]) {           // Cas ou la longueur n'est pas la même
    if (fxW != nbrFx - 1 ) {                         //et qu'il ne s'agit pas du dernier effet, procéder au décalage.

      //////   DECALAGE

      if (info[fxW] >  EEPROM[adressFx[fxW]]) {
        byte dif = (info[fxW] - EEPROM[adressFx[fxW]]) * 6 ;
        for (int i = adressFx[nbrFx - 1]  + 6 * info[nbrFx - 1] ; i > adressFx[fxW] ; i--) { // Condition
          EEPROM.update( i + dif , EEPROM[i]);
          delay(1);
        }
      }
      else if (info[fxW] <  EEPROM[adressFx[fxW]]) {
        byte dif = EEPROM[adressFx[fxW]] - info[fxW];
        //Serial.println(dif);
        for (int i = 1 + adressFx[fxW]; i + (dif * 6) < EEPROM.length() ; i++) {
          EEPROM.update( i , EEPROM[i + (dif * 6)]);
          delay(1);
        }
      }
    }

    EEPROM[adressFx[fxW]] = info[fxW];                // Ecriture de la nouvelle info
    initAdr();                                   // Mise a jour des nouvelles adresses d'effet
  }


  //// FIN de DECALAGE
  //// Debut de Boucle : Attente Reception paquet d'étape / Décodage / Ecriture

  for (int etp = 0; etp < info[fxW]; etp++) {

debutBoucle :
    //Serial.print("Attente de l'etape ");
    //Serial.println(etp);

    while (!Serial.available()) {
      delay(1);
    }

    char in = 0;
    while (in != 'y') {
      in = Serial.read();
    }

    lect = Serial.readStringUntil(10);
    //  Serial.println(lect);

    int b = lect.toInt();
    if (fxW != b) {
      // Serial.println("condition Fx non valide");
      goto debutBoucle; // Si mauvais n°FX, STop
    }
    lect = lect.substring(lect.indexOf(".") + 1); // Coupe fx
    b = lect.toInt();
    if (etp != b) {
      //Serial.println("Condition etape non valide");
      goto debutBoucle; // Si mauvais n°Etape, STOP
    }
    int valeurAInscrire[5];
    for (int i = 0; i < 5; i++) {   // Boucle de récupération des valeurs
      lect = lect.substring(lect.indexOf(".") + 1); // coupe etape ou valeur Préced
      valeurAInscrire[i] = lect.toInt();
    }
    for (int i = 0; i < 4; i++) {   // Boucle d'écriture EEPROM Couleur
      byte valCoul = valeurAInscrire[i];
      EEPROM.update(adressFx[fxW] + 1 + i + 6 * etp, valCoul);
    }
    EEPROM.put(adressFx[fxW] + 5 + 6 * etp, valeurAInscrire[4]); // Ecriture Fade
  }
}




//////////////////////////////////////////////
String initId() {
  String idCh = "";
  for (int i = 0; i < 3; i++) {
    idCh += char(EEPROM[EEPROM.length() - 3 + i]);
  }
  return idCh;
}

////////////////////////////////////////////
void initAdr() {

  adressFx[0] = 0;
  for (int i = 1; i < nbrFx; i++) {
    adressFx[i] = adressFx[i - 1] + (6 * EEPROM[adressFx[i - 1]]) + 1;
  }

  for (int i = 0; i < nbrFx; i++) {
    info[i] = int(EEPROM[adressFx[i]]);
  }

  // Update Id
  ID = initId();

}

////////////////////////////////////////////

int fonctionExp(unsigned int transit){


unsigned int fct=0;

if (transit < 4){
  fct=transit;
  }

else{
fct = transit * transit;
fct = map(fct, 0, 65025,3, 255);
}


return fct;
}
