/******************************************************************************
 * INCLUDES
 *****************************************************************************/
#include <FS.h>
#include <EEPROM.h>
#include <Wire.h>
#include "ROM.h"

/******************************************************************************
 * DEFINITIONS
 *****************************************************************************/
#define MEASURE_DELAY 1000

#define Analog0    26
#define Analog1    25
#define Analog2    34
#define Analog3    39
#define Analog4    36
#define Analog5    4
#define Analog6    14
#define Analog7    32
#define Analog8    15
#define Analog9    33
#define Analog10   27
#define Analog11   12
#define Analog12   13


#define SMOKE_PIN 13
#define ETOH_PIN  4
#define ODOR_PIN  39
#define CO_PIN    32
#define NO2_PIN   14
#define VOC_PIN   15
#define H2_PIN    33
#define CH4_PIN   36

#define ASIC_DEV_ADDR       0x72
#define ASIC_BTLDR_REG_ADDR 0x40
#define ASIC_DMC_REG_ADDR 0x42
#define ASIC_SMOKE_REG_ADDR 0x42
#define ASIC_ETOH_REG_ADDR  0x42
#define ASIC_ODOR_REG_ADDR  0x42
#define ASIC_CO_REG_ADDR    0x42
#define ASIC_NO2_REG_ADDR   0x42
#define ASIC_NH3_REG_ADDR   0x42
#define ASIC_VOC_REG_ADDR   0x42
#define ASIC_H2S_REG_ADDR   0x42
#define ASIC_H2_REG_ADDR    0x42
#define ASIC_HCHO_REG_ADDR  0x42
#define ASIC_CH4_REG_ADDR   0x42

#define EEPROM_SIZE (4 * (DATA_SIZE + 5))

#define I2C_CLOCK_SPEED 100000

/******************************************************************************
 * GLOABAL VARIABLES
 *****************************************************************************/
int smoke = 0;
int etoh  = 0;
int odor  = 0;
int co    = 0;
int no2   = 0;
int nh3   = 0;
int voc   = 0;
int h2s   = 0;
int h2    = 0;
int hcho  = 0;
int ch4   = 0;
int analog11   = 0;
int analog12   = 0;

/******************************************************************************
 * FUNCTIONS
 *****************************************************************************/
    /******************************************************************************
     * @brief Function for sending data to the I2C bus
     * @param devAddr 
     * @param regAddr
     * @param data
     */
    void sendI2C_float(uint8_t devAddr, uint8_t regAddr, float data)
    {
      uint8_t i;
      uint8_t byteData;
      uint32_t longData;

      memcpy(&longData, &data, sizeof(float));

//      Serial.print("  ");
//      Serial.print(longData, HEX);
//      Serial.print("    ");

      for (i = 0; i < 4; i++)
      {
        byteData = longData >> (8 * i); // LSB
        Wire.beginTransmission(devAddr);
        Wire.write(regAddr);
        Wire.write(byteData);
        Wire.endTransmission();

//        Serial.print(byteData, HEX);
//        Serial.print(" ");
      }

//      Serial.println("");
    }

    /******************************************************************************
     * @brief Function for sending data to the I2C bus
     * @param devAddr 
     * @param regAddr
     * @param data
     */
    void sendI2C_32(uint8_t devAddr, uint8_t regAddr, uint32_t data)
    {
      uint8_t i;
      uint8_t byteData;

      Serial.print("  ");
      Serial.print(data, HEX);
      Serial.print("    ");

      for (i = 0; i < 4; i++)
      {
        byteData = data >> (8 * i); // LSB
        Wire.beginTransmission(devAddr);
        Wire.write(regAddr);
        Wire.write(byteData);
        Wire.endTransmission();

        Serial.print(byteData, HEX);
        Serial.print(" ");
      }

      Serial.println("");
    }

    /******************************************************************************
     * @brief Function for sending data to the I2C bus
     * @param devAddr 
     * @param regAddr
     * @param data
     */
    void sendI2C_8(uint8_t devAddr, uint8_t regAddr, uint8_t data)
    {
      uint8_t i;
    
      Wire.beginTransmission(devAddr);
      Wire.write(regAddr);
      Wire.write(data);
      Wire.endTransmission();

//      Serial.print("  ");
//      Serial.print(data, HEX);
//      Serial.println("");
    }

    /******************************************************************************
     * @brief Function to bootload the FPGA with MLP weights and biases
     */
    void bootloader()
    {
      int i;
      int address;
      float floatData[DATA_SIZE] = DATA;

      Serial.print("Data ");
      Serial.print(START, HEX);

      // Send START signal
      Serial.print("Data ");
      Serial.print(START, HEX);
      Serial.print(" is sending to address ");
      Serial.print(ASIC_DEV_ADDR, HEX);
      Serial.print(":");
      Serial.println(ASIC_BTLDR_REG_ADDR, HEX);
      sendI2C_32(ASIC_DEV_ADDR, ASIC_BTLDR_REG_ADDR, START);

      // Send LAYER_SIZES
      Serial.print("Data ");
      Serial.print(LAYER_SIZES, HEX);
      Serial.print(" is sending to address ");
      Serial.print(ASIC_DEV_ADDR, HEX);
      Serial.print(":");
      Serial.println(ASIC_BTLDR_REG_ADDR, HEX);
      sendI2C_32(ASIC_DEV_ADDR, ASIC_BTLDR_REG_ADDR, LAYER_SIZES);

      // Send WEIGHTS_SIZE
      Serial.print("Data ");
      Serial.print(WEIGHTS_SIZE, HEX);
      Serial.print(" is sending to address ");
      Serial.print(ASIC_DEV_ADDR, HEX);
      Serial.print(":");
      Serial.println(ASIC_BTLDR_REG_ADDR, HEX);
      sendI2C_32(ASIC_DEV_ADDR, ASIC_BTLDR_REG_ADDR, WEIGHTS_SIZE);

      // Send BIASES_SIZE
      Serial.print("Data ");
      Serial.print(BIASES_SIZE, HEX);
      Serial.print(" is sending to address ");
      Serial.print(ASIC_DEV_ADDR, HEX);
      Serial.print(":");
      Serial.println(ASIC_BTLDR_REG_ADDR, HEX);
      sendI2C_32(ASIC_DEV_ADDR, ASIC_BTLDR_REG_ADDR, BIASES_SIZE);
      
      // Send layer - weight - bias data
      for (i = 0; i < DATA_SIZE; i++) {
        float data = floatData[i];

        Serial.print("Data ");
        Serial.print(data);
        Serial.print(" is sending to address ");
        Serial.print(ASIC_DEV_ADDR, HEX);
        Serial.print(":");
        Serial.println(ASIC_BTLDR_REG_ADDR, HEX);

        sendI2C_float(ASIC_DEV_ADDR, ASIC_BTLDR_REG_ADDR, data);
      }

      // Send END signal
      Serial.print("Data ");
      Serial.print(END, HEX);
      Serial.print(" is sending to address ");
      Serial.print(ASIC_DEV_ADDR, HEX);
      Serial.print(":");
      Serial.println(ASIC_BTLDR_REG_ADDR, HEX);
      sendI2C_32(ASIC_DEV_ADDR, ASIC_BTLDR_REG_ADDR, END);


    }

    /******************************************************************************
     * @brief Function to write MLP weights and biases to Flash ROM
     */
    void WriteEEPROM() 
    {
      uint32_t i;
      uint32_t address = 0; 
      float floatData[DATA_SIZE] = DATA;

      EEPROM.begin(EEPROM_SIZE);

    //  EEPROM.put(address, START);
    //  address += sizeof(float);

      for (i = 0; i < DATA_SIZE; i++)
      {
        if (address + sizeof(float) > EEPROM_SIZE) {
          Serial.println("Not enough EEPROM space to write.");
          break;
        }

        EEPROM.put(address, floatData[i]);

        Serial.print("Written ");
        Serial.print(floatData[i]);
        Serial.print(" to address ");
        Serial.println(address);

        address += sizeof(float);
      }

    //  EEPROM.put(address, END);

      EEPROM.commit();
      EEPROM.end();

      Serial.println("All data written to EEPROM.\n");
    }

/******************************************************************************
 * SETUP
 *****************************************************************************/
void setup() {
  Serial.begin(115200);
  delay(1000);
  Serial.println("SMOKE; ETOH; ODOR; CO; NO2; NH3; VOC; H2S; H2; HCHO; CH4");
  
  Wire.setClock(I2C_CLOCK_SPEED);
  Wire.begin();

  if (!EEPROM.begin(EEPROM_SIZE)) {
    Serial.println("Failed to initialise EEPROM");
    while(1);
  }

  //WriteEEPROM();
  bootloader();
}

int repeat =0;
/******************************************************************************
 * LOOP
 *****************************************************************************/
void loop() {
  delay(MEASURE_DELAY);

 smoke = analogRead(SMOKE_PIN);
  etoh  = analogRead(ETOH_PIN);
  odor  = analogRead(ODOR_PIN);
  co    = analogRead(CO_PIN);
  no2   = analogRead(NO2_PIN);
  voc   = analogRead(VOC_PIN);
  h2    = analogRead(H2_PIN);
  ch4   = analogRead(CH4_PIN);

  Serial.print(smoke); Serial.print("; ");
  Serial.print(etoh);  Serial.print("; ");
  Serial.print(odor);  Serial.print("; ");
  Serial.print(co);    Serial.print("; ");
  Serial.print(no2);   Serial.print("; ");
  //Serial.print(nh3);   Serial.print("; ");
  Serial.print(voc);   Serial.print("; ");
  //Serial.print(h2s);   Serial.print("; ");
  Serial.print(h2);    Serial.print("; ");
  //Serial.print(hcho);  Serial.print("; ");
  Serial.println(ch4);   

//  smoke = 3.0f;
//  etoh  = 3.0f;
//  odor  = 3.0f;
//  co    = 3.0f;
//no2   = 3.0f;

/*  
  if (repeat==0){
    
    no2= 3.0f;
  }
  if (repeat==3){
    no2 = 2.0f;

  }
  repeat++;

  Serial.print(no2);
  if (repeat == 6) {
    repeat = 0 ;

  }
  
*/
  sendI2C_8(ASIC_DEV_ADDR, ASIC_DMC_REG_ADDR, 0x02);
  
  sendI2C_float(ASIC_DEV_ADDR, ASIC_SMOKE_REG_ADDR, smoke);
  sendI2C_float(ASIC_DEV_ADDR, ASIC_ETOH_REG_ADDR, etoh);
  sendI2C_float(ASIC_DEV_ADDR, ASIC_ODOR_REG_ADDR, odor);
  sendI2C_float(ASIC_DEV_ADDR, ASIC_CO_REG_ADDR, co);
  sendI2C_float(ASIC_DEV_ADDR, ASIC_NO2_REG_ADDR, no2);
  sendI2C_float(ASIC_DEV_ADDR, ASIC_VOC_REG_ADDR, voc);
  sendI2C_float(ASIC_DEV_ADDR, ASIC_H2_REG_ADDR, h2);
  sendI2C_float(ASIC_DEV_ADDR, ASIC_CH4_REG_ADDR, ch4);
//  sendI2C_float(ASIC_DEV_ADDR, ASIC_VOC_REG_ADDR, voc);
//  sendI2C_float(ASIC_DEV_ADDR, ASIC_H2S_REG_ADDR, h2s);
//  sendI2C_float(ASIC_DEV_ADDR, ASIC_H2_REG_ADDR, h2);
//  sendI2C_float(ASIC_DEV_ADDR, ASIC_HCHO_REG_ADDR, hcho);
//  sendI2C_float(ASIC_DEV_ADDR, ASIC_CH4_REG_ADDR, ch4);


}

