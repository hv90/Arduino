#include <NewPing.h>

NewPing sonar1(13,A3,200); // NewPing sonar(TRIGGER_PIN, ECHO_PIN, MAX_DISTANCE); 
NewPing sonar2(12,A5,120);
int sBorda1;
int sBorda2;


//int valSonar1=0;
//int valSonar2=0;
int MR1 = 5;//motor direito
int ML1 = 6;//motor esquerdo

void setup() {
  Serial.begin(9600);
  pinMode(ML1, OUTPUT);
  pinMode(MR1, OUTPUT);
}

void loop() {
  //valSonar1=sonar1.ping_cm();
  //valSonar2=sonar2.ping_cm();
  Serial.println("sonar1:");
  Serial.print(sonar1.ping_cm());
  Serial.println(" ");
  //Serial.println("sonar2:");
  //Serial.print(sonar2.ping_cm());
  //Serial.println(" ");
 
  
 
  analogWrite(MR1, 0);
  //analogWrite(ML1, 0);

  sBorda1 = analogRead(A0);
  //sBorda2 = analogRead(A1);
  Serial.print("Sensor de borda1: ");
  Serial.print( sBorda1);
  Serial.println(" ");
  //Serial.print("Sensor de borda2: ");
  //Serial.print( sBorda2);
  //Serial.println(" ");

//  */
  //delay(250);
  
  delay(1000);

}
