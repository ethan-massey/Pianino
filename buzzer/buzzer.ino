
char val;
int ledPin = 13; // Set the pin to digital I/O 13


const int buzzerPin = 9;    // connect the buzzer to pin 9
const int songLength = 30;  // sets the number of notes of the song


void setup() 
{
  Serial.begin(9600);
  pinMode(buzzerPin, OUTPUT);  // sets the  buzzer pin as an OUTPUT
}


void loop() 
{
  if(Serial.available()) { 
     val = Serial.read(); // read it and store it in val

     if(val == ';'){
      noTone(buzzerPin);
     }else{
      tone(buzzerPin, frequency(val));
     }
    

  }

    

   
   //delay(5); // Wait 10 milliseconds for next reading

}

int frequency(char note) 
{
  int i;
  const int numNotes = 25;  // number of notes we're storing
  char names[numNotes] = { 
    'c', '0', 'd', '1', 'e', 'f', '2', 'g', '3', 'a', '4', 'b',
    'C', '5', 'D', '6', 'E', 'F', '7', 'G', '8', 'A', '9', 'B', '.'   };
  int frequencies[numNotes] = {
    262, 277, 294, 311, 330, 349, 370, 392, 415, 440, 466, 494,
    523, 554, 587, 622, 660, 698, 740, 784, 830, 880, 932, 988, 1047    };

  // Now we'll search through the letters in the array, and if
  // we find it, we'll return the frequency for that note.

  for (i = 0; i < numNotes; i++)  // Step through the notes
  {
    if (names[i] == note)         // Is this the one?
    {
      return(frequencies[i]);     // Yes! Return the frequency and exit function.
    }
  }
  return(0);  // We looked through everything and didn't find it,
  // but we still need to return a value, so return 0.
}
