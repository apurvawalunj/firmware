// vco control panel
// jack savage 24SEP2014

//prototypes
void SPI1_Init_Advanced(unsigned short master_slav, unsigned short data_sample, unsigned short clock_idle, unsigned short transmit_edge);
unsigned short SPI1_Read(unsigned short buffer);

main()
{
Spi1_Init_Advanced(_SPI_MASTER_TMR2, _SPI_DATA_SAMPLE_MIDDLE, _SPI_CLK_IDLE_LOW, _SPI_LOW_2_HIGH); // must setup tmr2=125kHz

}

// spi interrupt