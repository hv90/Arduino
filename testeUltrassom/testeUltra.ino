#include <NewPing.h>

NewPing sonar1(13, A3,120);
NewPing sonar2(12, A5,120);
int valSonar1;
int valSonar2;
void setup() {
  Serial.begin(9600);

}

void loop() {
  valSonar1=sonar1.ping_cm();
  valSonar2=sonar2.ping_cm();
  Serial.print("sonar1: " );
  Serial.println(valSonar1);
  Serial.print("sonar2: ");
  Serial.println(valSonar2);
  delay(1000);
}
