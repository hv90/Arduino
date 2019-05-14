int pin = 9;
int i = 0;
void setup() {
  // put your setup code here, to run once:
  pinMode(pin, OUTPUT);
}

void loop() {
  if(i==255){
    i=0;}
  // put your main code here, to run repeatedly:
  analogWrite(pin,126);
  i++;
}
