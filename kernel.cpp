void printf(char* str)
{
    unsigned short* VideoMemory = (unsigned short*)0xb8000;

    for(int i = 0; str[i] != '\0'; i++)
        VideoMemory[i] = (VideoMemory[i] & 0xFF00) | str[i];
}

extern "C" void kernelMain(void* multiboot_struct, unsigned int magicNumber)
{
    printf("Hello World! --- http://www.AlgorithMan.de");

    while(1);
}