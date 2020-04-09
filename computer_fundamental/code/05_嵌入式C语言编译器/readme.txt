.o 打包成 .a

gcc -c func.c -o func.o
ar crs libfunc.a func.o