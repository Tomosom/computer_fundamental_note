SECTIONS
{
    .text 0x08048400:
    {
        *(.text)
    }
    
    . = 0x01000000;
    
    s1 = .;
    
    . += 4;
    
    s2 = .;
    
    .data 0x0804a800:
    {
        *(.data)
    }
    
    .bss :
    {
        *(.bss)
    }
}