ENTRY(program)

SECTIONS
{
    .text 0x08048000 + SIZEOF_HEADERS :
    {
        *(.text)
        *(.rodata)
    }
    
    /DISCARD/ :
    {
        *(*)
    }
}