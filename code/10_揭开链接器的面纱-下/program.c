
void print(const char* s, int l);
void exit(int code);

void program()
{
    print("D.T.Software\n", 13);
    exit(0);
    //exit(919);
}

void print(const char* s, int l)
{
    asm volatile (
        "movl $4, %%eax\n"
        "movl $1, %%ebx\n"
        "movl %0, %%ecx\n"
        "movl %1, %%edx\n"
        "int $0x80     \n"
        :
        : "r"(s), "r"(l)
        : "eax", "ebx", "ecx", "edx"
    );
}

void exit(int code)
{
    asm volatile (
        "movl $1, %%eax\n"
        "movl %0, %%ebx\n"
        "int $0x80     \n"
        :
        : "r"(code)
        : "eax", "ebx"
    );
}
