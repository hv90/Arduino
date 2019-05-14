
  int ldr = A0;
  int led = 11;
  int in;
  int out;
  int limit = 600;
  
void setup() {
  pinMode(ldr, INPUT);
  pinMode(led, OUTPUT);
}

void loop() {
  in = analogRead(ldr);
  out = map(in, 0, 1023, 255, 0);
  analogWrite(led, out);
}
