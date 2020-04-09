#include <stdio.h>

struct ST
{
    int x;
    int y;
    int z;
};

struct ST f(int x, int y, int z)
{
    struct ST st = {0};
    
    printf("f() : &st = %p\n", &st);
    
    st.x = x;
    st.y = y;
    st.z = z;
    
    return st;
}

void g()
{
    struct ST st = {0};
    
    printf("g() : &st = %p\n", &st);
    
    st = f(1, 2, 3);
    
    printf("g() : st.x = %d\n", st.x);
    printf("g() : st.y = %d\n", st.y);
    printf("g() : st.z = %d\n", st.z);
}

void h()
{
    struct ST st = f(4, 5, 6);
    
    printf("h() : &st = %p\n", &st);
    printf("h() : st.x = %d\n", st.x);
    printf("h() : st.y = %d\n", st.y);
    printf("h() : st.z = %d\n", st.z);
}

int main()
{
    h();
    g();
    
    return 0;
}