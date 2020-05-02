#ifndef __PRIMITIVE_H
#define __PRIMITIVE_H

typedef unsigned int u32_t;
typedef signed int s32_t;
typedef unsigned short u16_t;
typedef signed short s16_t;
typedef unsigned char u8_t;
typedef signed char s8_t;

// for memory management
typedef u32_t address_t;
typedef u32_t value_t;
typedef address_t msize_t;
// for size
typedef u32_t usize_t;
// for microsecond
typedef u32_t usecond_t;
// for macrosecond
typedef u32_t msecond_t;
// for key
typedef u32_t ukey_t;
// for statistic
typedef u32_t statistic_t;

typedef u8_t byte_t;

typedef u32_t magic_number_t;

typedef int bool;
enum {
    false,
    true
};

#define UNUSED(a) (void)(a)

#define null (void *)0

#define NAME_MAX_LENGTH     15
#define WAIT_FOREVER        0
#define DO_NOT_CARE         0

#endif

