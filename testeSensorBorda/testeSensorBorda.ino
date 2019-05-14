int sBorda1;
int sBorda2;


void setup() {
  Serial.begin(9600);
  

}

void loop() {
  
  sBorda1 = analogRead(A0);
  sBorda2 = analogRead(A1);
  //Serial.print("Sensor de borda1: ");
  //Serial.print( sBorda1);
  //Serial.println(" ");
  Serial.print("Sensor de borda2: ");
  Serial.print( sBorda2);
  Serial.println(" ");
  delay(250);

}
