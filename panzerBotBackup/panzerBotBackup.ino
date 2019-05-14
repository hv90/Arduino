#include <NewPing.h>
#define COR 9
#define CM 30

//O alcance do sonar podia ser maior que 120 cm,
//mas presume-se como razoável uma distância máxima de 120cm 

NewPing sonar1(13,A3,120); // NewPing sonar(TRIGGER_PIN, ECHO_PIN, MAX_DISTANCE); 
NewPing sonar2(12,A5,120);

int valSonar1=0;//Valores encontrados pelo sonar 
int valSonar2=0;
int erroSonar=0;
int achou =0;

//Pinagem dos motores
int MR1= 5;//MR é motor direito(Right)
//int MR2= 9;
int ML1= 6;//ML é motor esquerdo(Left)
//int ML2 =10; 

//Sensores de borda
int sBordaL=-17;//valor aleatório para facilitar a checagem do funcionamento do sensor de borda esquerdo(Left)
int sBordaR=-17;//valor aleatório para facilitar a checagem do funcionamento do sensor de borda direito(Right)

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
void setup()
{

 // Serial.begin(9600);
  
  //motores
  pinMode(ML1, OUTPUT);// estabelece pinos de saída até 5v para os motores
  //pinMode(ML2, OUTPUT);
  pinMode(MR1, OUTPUT);
  //pinMode(MR2, OUTPUT);
 // Serial.println("dentro do setup, 3 segundos aguardando");delay(3000); 
  delay(3000);//aguardando a partida começar

  
  robotstop();          //parar o robô
}

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

void robotstop()
{
    analogWrite(MR1,128);
    //analogWrite(MR2,0); 
    analogWrite(ML1,128);
    //analogWrite(ML2,0); 
}

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

//busca o oponente
void busca()
{
  Serial.println("inicalizando busca, entrando no while achou)");delay(3000);
  achou=0;
  while (achou==0)
  {//giro para a esquerda
    
    Serial.println("achou =0, roda direita para por causa do giro à esquerda)");delay(3000);
    analogWrite(MR1,128);
    //analogWrite(MR2,0); 
    analogWrite(ML1,190);
    //analogWrite(ML2,100);

    Serial.println("lê o sonar");delay(3000);
    valSonar1=sonar1.ping_cm(); 
    valSonar2=sonar2.ping_cm(); 
    delay(500);//verifica o que está diretamente à frente, sem fazer o robô andar muito

    Serial.println("sonar1: ");
    Serial.println(valSonar1);
    Serial.println("sonar2: ");
    Serial.println(valSonar2);
    delay(3000);

  Serial.println("checa os valores do sonar para tomar uma decisão");delay(3000);
   //checa os valores do sonar para tomar uma decisão
   if ((valSonar1<CM)||(valSonar2<CM))
    {
       Serial.println("pelo menos um dos sonares < CM");delay(3000);
       
       
    Serial.println("robo para e achou=1");delay(3000);
    robotstop();
    delay(10);
    achou=1;
    }

   // Serial.println("checa os valores do sensor de borda para tomar uma decisão");delay(3000);
    //checa os valores do sensor de borda para tomar uma decisão
   sBordaL=digitalRead(A4);
   sBordaR=digitalRead(A5);  

/*
   Serial.println("sBordaL: ");
    Serial.println(sBordaL);
    Serial.println("sBordaR: ");
    Serial.println(sBordaR);
    delay(3000);
 */  
   if ((sBordaL>=COR)||(sBordaR>=COR))
   {//Checa se há cor branca detectada
    //Serial.println("branco detectado, robo para ");delay(3000);
      robotstop();
      delay(10);
      achou=1;
    }
  }
}//fim da função busca

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

void luta() //Quando encontra o oponente (achou =1)
{
  Serial.println("função luta, lendo valores dos sonares");delay(3000);
  valSonar1=sonar1.ping_cm(); //Revisa o sinal do oponente
  valSonar2=sonar2.ping_cm(); 

  Serial.println("sonar1: ");
    Serial.println(valSonar1);
    Serial.println("sonar2: ");
    Serial.println(valSonar2);
    delay(3000);
  
  delay(500);//tempo razoável considerando as variações produzidas pelos sonares
  if ((valSonar1<CM)||(valSonar2<CM))
  {     Serial.println("se os sonares são menor que 50, ajusta a direção do robo");delay(3000);
        erroSonar=valSonar1-valSonar2;
        Serial.println("correcao do erroSonar: ");delay(3000);
        Serial.println(erroSonar);delay(3000);
        if (erroSonar<0)
        {
          Serial.println("erro <0, motor esquerdo tem mais tensão");delay(3000);
        analogWrite(MR1,220);//acelera rodas dianteiras
        //analogWrite(MR2,0); 
        analogWrite(ML1,220-erroSonar);//acelera para a direita
        //analogWrite(ML2,0); 
        delay(500);
        }
        else
        {
          Serial.println("erro >0, motor direito tem mais tensão");delay(3000);
        analogWrite(MR1,220+erroSonar);//acelera para a esquerda
        //analogWrite(MR2,0); 
        analogWrite(ML1,220);//acelera roda dianteira
        //analogWrite(ML2,0);
        delay(500); 
         }
        delay(10);
        achou=1;  
     }
  else 
    {
         achou=0; 
    }
}//fim da função luta


/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

void sensor_chao_preto()
{
  sBordaL=analogRead(A0);//branco a partir de 7 //branco a partir de 13
  sBordaR=analogRead(A1);//branco a partir de 7 //branco a partir de 13
   
  //esquema de decisões, 1=verdadeiro, 0=falso
  //sonar1 |  sonar2
  //preto  |  preto
  // 1     |    1  
  // 0     |    0
  // 0     |    1
  // 1     |    0

  
  if ((sBordaL<COR)&&(sBordaR<COR))//tudo preto: caso 1,1
  {//ok, pode buscar oponente / atacar oponente
      if (achou==0)//faz a rotina de busca
      { 
        Serial.println("tudo preto, inicializando busca");delay(3000);
        
        busca();
      }
      else//se achou faz a rotina de luta
      {
        Serial.println("tudo preto, e encontrei algo,inicializando luta (valores altos no pwm) ");delay(3000);
        
        luta();
      }
    }
   else if ((sBordaL>=COR)&&(sBordaR>=COR))//TUDO BRANCO
   {

    Serial.println("tudo branco, inicializando recuar(valor zero pwm)");delay(3000);
    
    analogWrite(MR1,0);
    //analogWrite(MR2,250);//acelera rodas traseiras 
    analogWrite(ML1,0);
    //analogWrite(ML2,250);//acelera rodas traseiras
    delay(500);//executa a ação por meio segundo

    Serial.println("robo para");delay(3000);
    robotstop();//robô para
   }
   else if (sBordaL>=COR)//esquerdo=BRANCA, vire à direita
   {
    Serial.println("parcial branco, inicializando recuar(valor zero pwm)");delay(3000);
    analogWrite(MR1,0);
    //analogWrite(MR2,250); //marcha ré
    analogWrite(ML1,0);
    //analogWrite(ML2,250);//marcha ré
    delay(300);
    Serial.println("parcial branco, inicializando giro(valor zero pwm esquerdo )");delay(3000);
    analogWrite(MR1,128);//para o robo
    //analogWrite(MR2,250);//ré na direita 
    analogWrite(ML1,0);//acelera a dianteira esquerda
    //analogWrite(ML2,0);
    delay(200);

    
    Serial.println("robo para)");delay(3000);
    robotstop();
   }
   if (sBordaR>=COR) //vire à esquerda
   {

    Serial.println("parcial branco, inicializando recuar(valor zero pwm)");delay(3000);
    analogWrite(MR1,0);
   // analogWrite(MR2,250); //ré
    analogWrite(ML1,0);
    //analogWrite(ML2,250);//ré
    delay(300);

    Serial.println("parcial branco, inicializando giro(valor zero pwm direito)");delay(3000);
    analogWrite(MR1,0);//acelera a dianteira direita
    //analogWrite(MR2,0); 
    analogWrite(ML1,128);
    //analogWrite(ML2,250);//ré à esquerda
    delay(200);

    Serial.println("robo para");delay(3000);
    robotstop();
   }
}//fim da função sensor_chao_preto()


/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

void loop() 
{
sensor_chao_preto();
}



