void startInternalClock()
{
pinMode(3, OUTPUT);
 TCCR2A = _BV(COM2B1) | _BV(WGM21) | _BV(WGM20);
 TCCR2B = _BV(WGM22) | _BV(CS20);
 OCR2A = 1;
}

int i = 19;
byte first_frame = 1;

void setup()
 {
   Serial.begin(1000000);  

 }
 
 void loop()
 {
  

 i=i+1; 
 if (i==20) {
            send_float(1);
            send_float(13);
            send_float(13);
            send_float(13);

            // i=i+1;
 } else if (i==220) {
            send_float(1);
            send_float(13);
            send_float(13);
            send_float(13);
            send_float(1);
            send_float(13);
            send_float(13);
            send_float(13);
            send_float(1);
            send_float(13);
            send_float(13);
            send_float(13);

            send_float(2);
            send_float(13);
            send_float(13);
            send_float(13);
            send_float(2);
            send_float(13);
            send_float(13);
            send_float(13);
            send_float(2);
            send_float(13);
            send_float(13);
            send_float(13);

            send_float(3);
            send_float(13);
            send_float(13);
            send_float(13);
            send_float(3);
            send_float(13);
            send_float(13);
            send_float(13);
            // i=i+1;
 } else if (i==420) {
            send_float(1);
            send_float(13);
            send_float(13);
            send_float(13);

            send_float(2);
            send_float(13);
            send_float(13);
            send_float(13);
 
            send_float(3);
            send_float(13);
            send_float(13);
            send_float(13);
 } else if (i==620) {
            send_float(1);
            send_float(13);
            send_float(13);
            send_float(13);

            send_float(2);
            send_float(13);
            send_float(13);
            send_float(13);
 
            send_float(3);
            send_float(13);
            send_float(13);
            send_float(13);
 } else if (i==820) {
            send_float(1);
            send_float(13);
            send_float(13);
            send_float(13);

            send_float(2);
            send_float(13);
            send_float(13);
            send_float(13);
 
            send_float(3);
            send_float(13);
            send_float(13);
            send_float(13);
 } else if (i==1020) {
            send_float(1);
            send_float(13);
            send_float(13);
            send_float(13);

            send_float(2);
            send_float(13);
            send_float(13);
            send_float(13);
 
            send_float(3);
            send_float(13);
            send_float(13);
            send_float(13);
 } else if (i==1220) {
            send_float(1);
            send_float(13);
            send_float(13);
            send_float(13);

            send_float(2);
            send_float(13);
            send_float(13);
            send_float(13);
 
            send_float(3);
            send_float(13);
            send_float(13);
            send_float(13);
             } else if (i==1420) {
            send_float(1);
            send_float(13);
            send_float(13);
            send_float(13);

            send_float(2);
            send_float(13);
            send_float(13);
            send_float(13);
 
            send_float(3);
            send_float(13);
            send_float(13);
            send_float(13);
             } else if (i==1620) {
            send_float(1);
            send_float(13);
            send_float(13);
            send_float(13);

            send_float(2);
            send_float(13);
            send_float(13);
            send_float(13);
 
            send_float(3);
            send_float(13);
            send_float(13);
            send_float(13);
             } else if (i==1820) {
            send_float(1);
            send_float(13);
            send_float(13);
            send_float(13);

            send_float(2);
            send_float(13);
            send_float(13);
            send_float(13);
 
            send_float(3);
            send_float(13);
            send_float(13);
            send_float(13);
             } else if (i==2020) {
            send_float(1);
            send_float(13);
            send_float(13);
            send_float(13);

            send_float(2);
            send_float(13);
            send_float(13);
            send_float(13);
 
            send_float(3);
            send_float(13);
            send_float(13);
            send_float(13);
             } else if (i==2220) {
            send_float(1);
            send_float(13);
            send_float(13);
            send_float(13);

            send_float(2);
            send_float(13);
            send_float(13);
            send_float(13);
 
            send_float(3);
            send_float(13);
            send_float(13);
            send_float(13);
             } else if (i==2420) {
            send_float(1);
            send_float(14);
            send_float(14);
            send_float(14);

            send_float(2);
            send_float(14);
            send_float(14);
            send_float(14);

            send_float(3);
            send_float(14);
            send_float(14);
            send_float(14);
            i=19;

//              } else if (i==) {
//             send_float(1);
//             send_float(13);
//             send_float(13);
//             send_float(13);
//              } else if (i==180) {
//             send_float(1);
//             send_float(13);
//             send_float(13);
//             send_float(13);
//              } else if (i==190) {
//             send_float(1);
//             send_float(13);
//             send_float(13);
//             send_float(13);
//              } else if (i==210) {
//             send_float(1);
//             send_float(13);
//             send_float(13);
//             send_float(13);
// } else if (i==230) {
//             send_float(1);
//             send_float(14);
//             send_float(14);
//             send_float(14);  
//             i=20;
 } else {
        
            delayMicroseconds(5);

            send_float(1);
            send_float(i);
            send_float(1000);
            send_float(27000);

            send_float(2);
            send_float(i);
            send_float(1000);
            send_float(27000);

            send_float(3);
            send_float(i);
            send_float(1000);
            send_float(27000);

};

};


void send_float (int arg) // can be float
{
  // get access to the float as a byte-array:
  byte * data = (byte *) &arg; 

  // write the data to the serial
  Serial.write (data, sizeof (arg));
}



