#ifndef __ERROR_H
#define __ERROR_H

// since GLIB defines the error_t, to avoid conflicting we have to apply the
// macro __error_t_defined which is defined in GLIB to determine whether the
// error_t should be defined here or not
#ifndef __error_t_defined
typedef int error_t;
#define __error_t_defined
#endif

#define MODULE_BITS     15
#define ERROR_BITS      16

// if the ERROR_T_SIZE is 4 then the ERROR_MARK should be 0x80000000
// ERROR_MARK is used to make a number as a negative integer
#define ERROR_MARK      (1 << (MODULE_BITS + ERROR_BITS))

#define ERROR_BEGIN(_module_id) ((_module_id) << ERROR_BITS)

#define ERROR_T(_module_error) /*lint -e{648} */(ERROR_MARK | (_module_error))

#define MODULE_ERROR(_error_t) /*lint -e{778} */((_error_t) & ((1 << ERROR_BITS) - 1))
#define MODULE_ID(_error_t) /*lint -e{778,648} */(module_t)(((_error_t) & ~(ERROR_MARK)) >> ERROR_BITS)

#ifdef  __cplusplus
extern "C" {
#endif

const char *errstr (error_t _error);

#ifdef  __cplusplus
}
#endif

#endif

