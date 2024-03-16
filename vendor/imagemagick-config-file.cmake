
option(MAGICKCORE_EXCLUDE_DEPRECATED "exclude deprecated methods in MagickCore API" ON)
option(WITH_FFTW "with FFTW" OFF)


set(MAGICKCORE_AUTOTRACE_DELEGATE ${WITH_AUTOTRACE})
set(MAGICKCORE_BZLIB_DELEGATE ${WITH_BZIP2})
set(MAGICKCORE_CAIRO_DELEGATE ${WITH_CAIRO})
set(MAGICKCORE_DJVU_DELEGATE ${WITH_DJVU})
set(MAGICKCORE_DMR_DELEGATE ${WITH_DMR})
set(MAGICKCORE_FFTW_DELEGATE ${WITH_FFTW})
set(MAGICKCORE_FLIF_DELEGATE ${WITH_FLIF})
set(MAGICKCORE_FONTCONFIG_DELEGATE ${WITH_FONTCONFIG})
set(MAGICKCORE_FPX_DELEGATE ${WITH_FLASHPIX})
set(MAGICKCORE_FREETYPE_DELEGATE ${WITH_FREETYPE})
set(MAGICKCORE_GS_DELEGATE ${WITH_GHOSTSCRIPT})
set(MAGICKCORE_GVC_DELEGATE ${WITH_GVC})
set(MAGICKCORE_HAVE_ACOSH ${HAVE_ACOSH})
set(MAGICKCORE_HAVE_ALIGNED_MALLOC ${HAVE_ALIGNED_MALLOC})
set(MAGICKCORE_HAVE_ARM_LIMITS_H ${HAVE_ARM_LIMITS_H})
set(MAGICKCORE_HAVE_ARPA_INET_H ${HAVE_ARPA_INET_H})
set(MAGICKCORE_HAVE_ASINH ${HAVE_ASINH})
set(MAGICKCORE_HAVE_ATANH ${HAVE_ATANH})
set(MAGICKCORE_HAVE_ATEXIT ${HAVE_ATEXIT})
set(MAGICKCORE_HAVE_ATOLL ${HAVE_ATOLL})
set(MAGICKCORE_HAVE_BOOL ${HAVE_BOOL})
set(MAGICKCORE_HAVE_CABS ${HAVE_CABS})
set(MAGICKCORE_HAVE_CARG ${HAVE_CARG})
set(MAGICKCORE_HAVE_CIMAG ${HAVE_CIMAG})

#[[ Define to 1 if you have the `clock' function. #]]
set( MAGICKCORE_HAVE_CLOCK ${HAVE_CLOCK})

#[[ Define to 1 if you have the `clock_getres' function. #]]
set( MAGICKCORE_HAVE_CLOCK_GETRES ${HAVE_CLOCK_GETRES})

#[[ Define to 1 if you have the `clock_gettime' function. #]]
set( MAGICKCORE_HAVE_CLOCK_GETTIME ${HAVE_CLOCK_GETTIME})

#[[ Define to 1 if clock_gettime supports CLOCK_REALTIME. #]]
set( MAGICKCORE_HAVE_CLOCK_REALTIME ${HAVE_CLOCK_REALTIME})

#[[ Define to 1 if you have the <CL/cl.h> header file. #]]
set( MAGICKCORE_HAVE_CL_CL_H ${HAVE_CL_CL_H})

#[[ Define to 1 if you have the <complex.h> header file. #]]
set( MAGICKCORE_HAVE_COMPLEX_H ${HAVE_COMPLEX_H})

#[[ Define to 1 if you have the `creal' function. #]]
set( MAGICKCORE_HAVE_CREAL ${HAVE_CREAL})

#[[ Define to 1 if you have the `ctime_r' function. #]]
set( MAGICKCORE_HAVE_CTIME_R ${HAVE_CTIME_R})

#[[ Define to 1 if you have the declaration of `pread', and to 0 if you don't.
   #]]
set( MAGICKCORE_HAVE_DECL_PREAD ${HAVE_PREAD})
#[[ Define to 1 if you have the declaration of `pwrite', and to 0 if you don't.
   #]]
set( MAGICKCORE_HAVE_DECL_PWRITE ${HAVE_PWRITE})

#[[ Define to 1 if you have the declaration of `strerror_r', and to 0 if you
   don't. #]]
set( MAGICKCORE_HAVE_DECL_STRERROR_R ${HAVE_STRERROR_R})


#[[ Define to 1 if you have the declaration of `strlcpy', and to 0 if you
   don't. #]]
set( MAGICKCORE_HAVE_DECL_STRLCPY ${HAVE_STRLCPY})

#[[ Define to 1 if you have the declaration of `tzname', and to 0 if you don't.
   #]]
set( MAGICKCORE_HAVE_DECL_TZNAME ${HAVE_TZNAME})

#[[ Define to 1 if you have the declaration of `vsnprintf', and to 0 if you
   don't. #]]
set( MAGICKCORE_HAVE_DECL_VSNPRINTF ${HAVE_VSNPRINTF})


#[[ Define to 1 if you have the `directio' function. #]]
set( MAGICKCORE_HAVE_DIRECTIO ${HAVE_DIRECTIO})

#[[ Define to 1 if you have the <dirent.h> header file, and it defines `DIR'.
   #]]
set( MAGICKCORE_HAVE_DIRENT_H ${HAVE_DIRENT_H})

#[[ Define to 1 if you have the <dlfcn.h> header file. #]]
set( MAGICKCORE_HAVE_DLFCN_H ${HAVE_DLFCN_H})

#[[ Define to 1 if you have the `erf' function. #]]
set( MAGICKCORE_HAVE_ERF ${HAVE_ERF})

#[[ Define to 1 if you have the <errno.h> header file. #]]
set( MAGICKCORE_HAVE_ERRNO_H ${HAVE_ERRNO_H})

#[[ Define to 1 if you have the `execvp' function. #]]
set( MAGICKCORE_HAVE_EXECVP ${HAVE_EXECVP})

#[[ Define to 1 if you have the `fchmod' function. #]]
set( MAGICKCORE_HAVE_FCHMOD ${HAVE_FCHMOD})

#[[ Define to 1 if you have the <fcntl.h> header file. #]]
set( MAGICKCORE_HAVE_FCNTL_H ${HAVE_FCNTL_H})

#[[ Define to 1 if you have the <float.h> header file. #]]
set( MAGICKCORE_HAVE_FLOAT_H ${HAVE_FLOAT_H})

#[[ Define to 1 if you have the `floor' function. #]]
set( MAGICKCORE_HAVE_FLOOR ${HAVE_FLOOR})

#[[ Define to 1 if you have the `fork' function. #]]
set( MAGICKCORE_HAVE_FORK ${HAVE_FORK})

#[[ Define to 1 if fseeko (and presumably ftello) exists and is declared. #]]
set( MAGICKCORE_HAVE_FSEEKO ${HAVE_FSEEKO})

#[[ Define to 1 if you have the `ftime' function. #]]
set( MAGICKCORE_HAVE_FTIME ${HAVE_FTIME})

#[[ Define to 1 if you have the `ftruncate' function. #]]
set( MAGICKCORE_HAVE_FTRUNCATE ${HAVE_FTRUNCATE})

#[[ Define to 1 if you have the `getcwd' function. #]]
set( MAGICKCORE_HAVE_GETCWD ${HAVE_GETCWD})

#[[ Define to 1 if you have the `getc_unlocked' function. #]]
set( MAGICKCORE_HAVE_GETC_UNLOCKED ${HAVE_GETC_UNLOCKED})

#[[ Define to 1 if you have the `getdtablesize' function. #]]
set( MAGICKCORE_HAVE_GETDTABLESIZE ${HAVE_GETDTABLESIZE})

#[[ Define to 1 if you have the `getentropy' function. #]]
set( MAGICKCORE_HAVE_GETENTROPY ${HAVE_GETENTROPY})

#[[ Define to 1 if you have the `getexecname' function. #]]
set( MAGICKCORE_HAVE_GETEXECNAME ${HAVE_GETEXECNAME})

#[[ Define to 1 if you have the `getpagesize' function. #]]
set( MAGICKCORE_HAVE_GETPAGESIZE ${HAVE_GETPAGESIZE})

#[[ Define to 1 if you have the `getpid' function. #]]
set( MAGICKCORE_HAVE_GETPID ${HAVE_GETPID})

#[[ Define to 1 if you have the `getpwnam_r' function. #]]
set( MAGICKCORE_HAVE_GETPWNAM_R ${HAVE_GETPWNAM_R})

#[[ Define to 1 if you have the `getrlimit' function. #]]
set( MAGICKCORE_HAVE_GETRLIMIT ${HAVE_GETRLIMIT})

#[[ Define to 1 if you have the `getrusage' function. #]]
set( MAGICKCORE_HAVE_GETRUSAGE ${HAVE_GETRUSAGE})

#[[ Define to 1 if you have the `gettimeofday' function. #]]
set( MAGICKCORE_HAVE_GETTIMEOFDAY ${HAVE_GETTIMEOFDAY})

#[[ Define to 1 if you have the `gmtime_r' function. #]]
set( MAGICKCORE_HAVE_GMTIME_R ${HAVE_GMTIME_R})

#[[ [Compile with hugepage support] #]]
set( MAGICKCORE_HAVE_HUGEPAGES ${HAVE_HUGEPAGES})

#[[ Define to 1 if the system has the type `intmax_t'. #]]
set( MAGICKCORE_HAVE_INTMAX_T ${HAVE_INTMAX_T})

#[[ Define to 1 if the system has the type `intptr_t'. #]]
set( MAGICKCORE_HAVE_INTPTR_T ${HAVE_INTPTR_T})

#[[ Define to 1 if you have the <inttypes.h> header file. #]]
set( MAGICKCORE_HAVE_INTTYPES_H ${HAVE_INTTYPES_H})

#[[ Define to 1 if you have the `isnan' function. #]]
set( MAGICKCORE_HAVE_ISNAN ${HAVE_ISNAN})

#[[ Define to 1 if you have the `j0' function. #]]
set( MAGICKCORE_HAVE_J0 ${HAVE_J0})

#[[ Define to 1 if you have the `j1' function. #]]
set( MAGICKCORE_HAVE_J1 ${HAVE_J1})

#[[ Define if you have jemalloc memory allocation library #]]
set( MAGICKCORE_HAVE_JEMALLOC ${WITH_JEMALLOC})

#[[ Define if you have the <lcms2.h> header file. #]]
set( MAGICKCORE_HAVE_LCMS2_H ${HAVE_LCMS2_H})

#[[ Define if you have the <lcms2/lcms2.h> header file. #]]
set( MAGICKCORE_HAVE_LCMS2_LCMS2_H ${HAVE_LCMS2_LCMS2_H})

#[[ Define to 1 if you have the `gcov' library (-lgcov). #]]
# set( MAGICKCORE_HAVE_LIBGCOV

#[[ Define to 1 if you have the <limits.h> header file. #]]
set( MAGICKCORE_HAVE_LIMITS_H ${HAVE_LIMITS_H})

#[[ Define if you have Linux-compatible sendfile() #]]
set( MAGICKCORE_HAVE_LINUX_SENDFILE ${HAVE_LINUX_SENDFILE})

#[[ Define to 1 if you have the <linux/unistd.h> header file. #]]
set( MAGICKCORE_HAVE_LINUX_UNISTD_H ${HAVE_LINUX_UNISTD_H})

#[[ Define to 1 if you have the `lltostr' function. #]]
set( MAGICKCORE_HAVE_LLTOSTR ${HAVE_LLTOSTR})

#[[ Define to 1 if you have the <locale.h> header file. #]]
set( MAGICKCORE_HAVE_LOCALE_H ${HAVE_LOCALE_H})

#[[ Define to 1 if you have the `localtime_r' function. #]]
set( MAGICKCORE_HAVE_LOCALTIME_R ${HAVE_LOCALTIME_R})

#[[ Define to 1 if the system has the type `long long int'. #]]
set( MAGICKCORE_HAVE_LONG_LONG_INT ${HAVE_LONG_LONG_INT})

#[[ Define to 1 if you have the `lstat' function. #]]
set( MAGICKCORE_HAVE_LSTAT ${HAVE_LSTAT})

#[[ Define to 1 if you have the <machine/param.h> header file. #]]
set( MAGICKCORE_HAVE_MACHINE_PARAM_H ${HAVE_MACHINE_PARAM_H})

#[[ Define to 1 if you have the <mach-o/dyld.h> header file. #]]
set( MAGICKCORE_HAVE_MACH_O_DYLD_H ${HAVE_MACH_O_DYLD_H})

#[[ Define to 1 if you have the <malloc.h> header file. #]]
set( MAGICKCORE_HAVE_MALLOC_H ${HAVE_MALLOC_H})

#[[ Define to 1 if <wchar.h> declares mbstate_t. #]]
set( MAGICKCORE_HAVE_MBSTATE_T ${HAVE_MBSTATE_T})

#[[ Define to 1 if you have the `memmove' function. #]]
set( MAGICKCORE_HAVE_MEMMOVE ${HAVE_MEMMOVE})

#[[ Define to 1 if you have the `memset' function. #]]
set( MAGICKCORE_HAVE_MEMSET ${HAVE_MEMSET})

#[[ Define to 1 if you have the <minix/config.h> header file. #]]
set( MAGICKCORE_HAVE_MINIX_CONFIG_H ${HAVE_MINIX_CONFIG_H})

#[[ Define to 1 if you have the `mkdir' function. #]]
set( MAGICKCORE_HAVE_MKDIR ${HAVE_MKDIR})

#[[ Define to 1 if you have the `mkstemp' function. #]]
set( MAGICKCORE_HAVE_MKSTEMP ${HAVE_MKSTEMP})

#[[ Define to 1 if you have a working `mmap' system call. #]]
set( MAGICKCORE_HAVE_MMAP ${HAVE_MMAP})

#[[ Define if you have the mtmalloc memory allocation library #]]
set( MAGICKCORE_HAVE_MTMALLOC ${WITH_MTMALLOC})

#[[ Define to 1 if you have the `munmap' function. #]]
set( MAGICKCORE_HAVE_MUNMAP ${HAVE_MUNMAP})

#[[ define if the compiler implements namespaces #]]
set( MAGICKCORE_HAVE_NAMESPACES ${HAVE_NAMESPACES})

#[[ Define if g++ supports namespace std. #]]
set( MAGICKCORE_HAVE_NAMESPACE_STD ${HAVE_NAMESPACE_STD})

#[[ Define to 1 if you have the `nanosleep' function. #]]
set( MAGICKCORE_HAVE_NANOSLEEP ${HAVE_NANOSLEEP})

#[[ Define to 1 if you have the <ndir.h> header file, and it defines `DIR'. #]]
set( MAGICKCORE_HAVE_NDIR_H ${HAVE_NDIR_H})

#[[ Define to 1 if you have the <netdb.h> header file. #]]
set( MAGICKCORE_HAVE_NETDB_H ${HAVE_NETDB_H})

#[[ Define to 1 if you have the <netinet/in.h> header file. #]]
set( MAGICKCORE_HAVE_NETINET_IN_H ${HAVE_NETINET_IN_H})

#[[ Define to 1 if you have the `newlocale' function. #]]
set( MAGICKCORE_HAVE_NEWLOCALE ${HAVE_NEWLOCALE})

#[[ Define to 1 if you have the <OpenCL/cl.h> header file. #]]
set( MAGICKCORE_HAVE_OPENCL_CL_H  ${HAVE_OPENCL_CL_H})

#[[ Define to 1 if you have the <OS.h> header file. #]]
set( MAGICKCORE_HAVE_OS_H  ${HAVE_OS_H})

#[[ Define to 1 if you have the `pclose' function. #]]
set( MAGICKCORE_HAVE_PCLOSE ${HAVE_PCLOSE})

#[[ Define to 1 if you have the `poll' function. #]]
set( MAGICKCORE_HAVE_POLL ${HAVE_POLL})

#[[ Define to 1 if you have the `popen' function. #]]
set( MAGICKCORE_HAVE_POPEN ${HAVE_POPEN})

#[[ Define to 1 if you have the `posix_fadvise' function. #]]
set( MAGICKCORE_HAVE_POSIX_FADVISE ${HAVE_POSIX_FADVISE})

#[[ Define to 1 if you have the `posix_fallocate' function. #]]
set( MAGICKCORE_HAVE_POSIX_FALLOCATE ${HAVE_POSIX_FALLOCATE})

#[[ Define to 1 if you have the `posix_madvise' function. #]]
set( MAGICKCORE_HAVE_POSIX_MADVISE ${HAVE_POSIX_MADVISE})

#[[ Define to 1 if you have the `posix_memalign' function. #]]
set( MAGICKCORE_HAVE_POSIX_MEMALIGN ${HAVE_POSIX_MEMALIGN})

#[[ Define to 1 if you have the `posix_spawnp' function. #]]
set( MAGICKCORE_HAVE_POSIX_SPAWNP ${HAVE_POSIX_SPAWNP})

#[[ Define to 1 if you have the `pow' function. #]]
set( MAGICKCORE_HAVE_POW ${HAVE_POW})

#[[ Define to 1 if you have the `pread' function. #]]
set( MAGICKCORE_HAVE_PREAD ${HAVE_PREAD})

#[[ Define to 1 if you have the <process.h> header file. #]]
set( MAGICKCORE_HAVE_PROCESS_H ${HAVE_PROCESS_H})

#[[ Define if you have POSIX threads libraries and header files. #]]
set( MAGICKCORE_HAVE_PTHREAD ${HAVE_PTHREAD})

#[[ Have PTHREAD_PRIO_INHERIT. #]]
# set( MAGICKCORE_HAVE_PTHREAD_PRIO_INHERIT

#[[ Define to 1 if you have the `putenv' function. #]]
set( MAGICKCORE_HAVE_PUTENV ${HAVE_PUTENV})

#[[ Define to 1 if you have the `pwrite' function. #]]
set( MAGICKCORE_HAVE_PWRITE ${HAVE_PWRITE})

#[[ Define to 1 if you have the `qsort_r' function. #]]
set( MAGICKCORE_HAVE_QSORT_R ${HAVE_QSORT_R})

#[[ Define to 1 if you have the `raise' function. #]]
set( MAGICKCORE_HAVE_RAISE ${HAVE_RAISE})

#[[ Define to 1 if you have the `rand_r' function. #]]
set( MAGICKCORE_HAVE_RAND_R ${HAVE_RAND_R})

#[[ Define to 1 if you have the `readlink' function. #]]
set( MAGICKCORE_HAVE_READLINK ${HAVE_READLINK})

#[[ Define to 1 if you have the `realpath' function. #]]
set( MAGICKCORE_HAVE_REALPATH ${HAVE_REALPATH})

#[[ Define to 1 if you have the `seekdir' function. #]]
set( MAGICKCORE_HAVE_SEEKDIR ${HAVE_SEEKDIR})

#[[ Define to 1 if you have the `select' function. #]]
set( MAGICKCORE_HAVE_SELECT ${HAVE_SELECT})

#[[ Define to 1 if you have the `sendfile' function. #]]
set( MAGICKCORE_HAVE_SENDFILE ${HAVE_SENDFILE})

#[[ Define to 1 if you have the `setlocale' function. #]]
set( MAGICKCORE_HAVE_SETLOCALE ${HAVE_SETLOCALE})

#[[ Define to 1 if you have the `setvbuf' function. #]]
set( MAGICKCORE_HAVE_SETVBUF ${HAVE_SETVBUF})

#[[ X11 server supports shape extension #]]
# set( MAGICKCORE_HAVE_SHAPE

#[[ X11 server supports shared memory extension #]]
# set( MAGICKCORE_HAVE_SHARED_MEMORY

#[[ Define to 1 if you have the `sigaction' function. #]]
set( MAGICKCORE_HAVE_SIGACTION ${HAVE_SIGACTION})

#[[ Define to 1 if you have the `sigemptyset' function. #]]
set( MAGICKCORE_HAVE_SIGEMPTYSET ${HAVE_SIGEMPTYSET})

#[[ Define to 1 if you have the `socket' function. #]]
set( MAGICKCORE_HAVE_SOCKET ${HAVE_SOCKET})

#[[ Define to 1 if you have the `spawnvp' function. #]]
set( MAGICKCORE_HAVE_SPAWNVP ${HAVE_SPAWNVP})

#[[ Define to 1 if you have the `sqrt' function. #]]
set( MAGICKCORE_HAVE_SQRT ${HAVE_SQRT})

#[[ Define to 1 if you have the `stat' function. #]]
set( MAGICKCORE_HAVE_STAT ${HAVE_STAT})

#[[ Define to 1 if you have the <stdarg.h> header file. #]]
set( MAGICKCORE_HAVE_STDARG_H ${HAVE_STDARG_H})

#[[ Define to 1 if stdbool.h conforms to C99. #]]
set( MAGICKCORE_HAVE_STDBOOL_H ${HAVE_STDBOOL_H})

#[[ Define to 1 if you have the <stddef.h> header file. #]]
set( MAGICKCORE_HAVE_STDDEF_H ${HAVE_STDDEF_H})

#[[ Define to 1 if you have the <stdint.h> header file. #]]
set( MAGICKCORE_HAVE_STDINT_H ${HAVE_STDINT_H})

#[[ Define to 1 if you have the <stdio.h> header file. #]]
set( MAGICKCORE_HAVE_STDIO_H ${HAVE_STDIO_H})

#[[ Define to 1 if you have the <stdlib.h> header file. #]]
set( MAGICKCORE_HAVE_STDLIB_H ${HAVE_STDLIB_H})

#[[ Define to 1 if you have the `strcasecmp' function. #]]
set( MAGICKCORE_HAVE_STRCASECMP ${HAVE_STRCASECMP})

#[[ Define to 1 if you have the `strcasestr' function. #]]
set( MAGICKCORE_HAVE_STRCASESTR ${HAVE_STRCASESTR})

#[[ Define to 1 if you have the `strchr' function. #]]
set( MAGICKCORE_HAVE_STRCHR ${HAVE_STRCHR})

#[[ Define to 1 if you have the `strcspn' function. #]]
set( MAGICKCORE_HAVE_STRCSPN ${HAVE_STRCSPN})

#[[ Define to 1 if you have the `strdup' function. #]]
set( MAGICKCORE_HAVE_STRDUP ${HAVE_STRDUP})

#[[ Define to 1 if you have the `strerror' function. #]]
set( MAGICKCORE_HAVE_STRERROR ${HAVE_STRERROR})

#[[ Define if you have `strerror_r'. #]]
set( MAGICKCORE_HAVE_STRERROR_R ${HAVE_STRERROR_R})

#[[ Define to 1 if cpp supports the ANSI # stringizing operator. #]]
set( MAGICKCORE_HAVE_STRINGIZE ${HAVE_STRINGIZE})

#[[ Define to 1 if you have the <strings.h> header file. #]]
set( MAGICKCORE_HAVE_STRINGS_H ${HAVE_STRINGS_H})

#[[ Define to 1 if you have the <string.h> header file. #]]
set( MAGICKCORE_HAVE_STRING_H ${HAVE_STRING_H})

#[[ Define to 1 if you have the `strlcat' function. #]]
set( MAGICKCORE_HAVE_STRLCAT ${HAVE_STRLCAT})

#[[ Define to 1 if you have the `strlcpy' function. #]]
set( MAGICKCORE_HAVE_STRLCPY ${HAVE_STRLCPY})

#[[ Define to 1 if you have the `strncasecmp' function. #]]
set( MAGICKCORE_HAVE_STRNCASECMP ${HAVE_STRNCASECMP})

#[[ Define to 1 if you have the `strpbrk' function. #]]
set( MAGICKCORE_HAVE_STRPBRK ${HAVE_STRPBRK})

#[[ Define to 1 if you have the `strrchr' function. #]]
set( MAGICKCORE_HAVE_STRRCHR ${HAVE_STRRCHR})

#[[ Define to 1 if you have the `strspn' function. #]]
set( MAGICKCORE_HAVE_STRSPN ${HAVE_STRSPN})

#[[ Define to 1 if you have the `strstr' function. #]]
set( MAGICKCORE_HAVE_STRSTR ${HAVE_STRSTR})

#[[ Define to 1 if you have the `strtod' function. #]]
set( MAGICKCORE_HAVE_STRTOD ${HAVE_STRTOD})

#[[ Define to 1 if you have the `strtod_l' function. #]]
set( MAGICKCORE_HAVE_STRTOD_L ${HAVE_STRTOD_L})

#[[ Define to 1 if you have the `strtol' function. #]]
set( MAGICKCORE_HAVE_STRTOL ${HAVE_STRTOL})

#[[ Define to 1 if you have the `strtoul' function. #]]
set( MAGICKCORE_HAVE_STRTOUL ${HAVE_STRTOUL})

#[[ Define to 1 if `tm_zone' is a member of `struct tm'. #]]
set( MAGICKCORE_HAVE_STRUCT_TM_TM_ZONE ${HAVE_STRUCT_TM_TM_ZONE})

#[[ Define to 1 if you have the <sun_prefetch.h> header file. #]]
set( MAGICKCORE_HAVE_SUN_PREFETCH_H ${HAVE_SUN_PREFETCH_H})

#[[ Define to 1 if you have the `symlink' function. #]]
set( MAGICKCORE_HAVE_SYMLINK ${HAVE_SYMLINK})

#[[ Define to 1 if you have the `sysconf' function. #]]
set( MAGICKCORE_HAVE_SYSCONF ${HAVE_SYSCONF})

#[[ Define to 1 if you have the `system' function. #]]
set( MAGICKCORE_HAVE_SYSTEM ${HAVE_SYSTEM})

#[[ Define to 1 if you have the <sys/dir.h> header file, and it defines `DIR'.
   #]]
set( MAGICKCORE_HAVE_SYS_DIR_H ${HAVE_SYS_DIR_H})

#[[ Define to 1 if you have the <sys/ipc.h> header file. #]]
set( MAGICKCORE_HAVE_SYS_IPC_H ${HAVE_SYS_IPC_H})

#[[ Define to 1 if you have the <sys/mman.h> header file. #]]
set( MAGICKCORE_HAVE_SYS_MMAN_H ${HAVE_SYS_MMAN_H})

#[[ Define to 1 if you have the <sys/ndir.h> header file, and it defines `DIR'.
   #]]
set( MAGICKCORE_HAVE_SYS_NDIR_H ${HAVE_SYS_NDIR_H})

#[[ Define to 1 if you have the <sys/param.h> header file. #]]
set( MAGICKCORE_HAVE_SYS_PARAM_H ${HAVE_SYS_PARAM_H})

#[[ Define to 1 if you have the <sys/resource.h> header file. #]]
set( MAGICKCORE_HAVE_SYS_RESOURCE_H ${HAVE_SYS_RESOURCE_H})

#[[ Define to 1 if you have the <sys/sendfile.h> header file. #]]
set( MAGICKCORE_HAVE_SYS_SENDFILE_H ${HAVE_SYS_SENDFILE_H})

#[[ Define to 1 if you have the <sys/socket.h> header file. #]]
set( MAGICKCORE_HAVE_SYS_SOCKET_H ${HAVE_SYS_SOCKET_H})

#[[ Define to 1 if you have the <sys/stat.h> header file. #]]
set( MAGICKCORE_HAVE_SYS_STAT_H ${HAVE_SYS_STAT_H})

#[[ Define to 1 if you have the <sys/syslimits.h> header file. #]]
set( MAGICKCORE_HAVE_SYS_SYSLIMITS_H ${HAVE_SYS_SYSLIMITS_H})

#[[ Define to 1 if you have the <sys/times.h> header file. #]]
set( MAGICKCORE_HAVE_SYS_TIMES_H ${HAVE_SYS_TIMES_H})

#[[ Define to 1 if you have the <sys/time.h> header file. #]]
set( MAGICKCORE_HAVE_SYS_TIME_H ${HAVE_SYS_TIME_H})

#[[ Define to 1 if you have the <sys/types.h> header file. #]]
set( MAGICKCORE_HAVE_SYS_TYPES_H ${HAVE_SYS_TYPES_H})

#[[ Define to 1 if you have the <sys/uio.h> header file. #]]
set( MAGICKCORE_HAVE_SYS_UIO_H ${HAVE_SYS_UIO_H})

#[[ Define to 1 if you have the <sys/wait.h> header file. #]]
set( MAGICKCORE_HAVE_SYS_WAIT_H ${HAVE_SYS_WAIT_H})

#[[ Define if you have the tcmalloc memory allocation library #]]
set( MAGICKCORE_HAVE_TCMALLOC ${WITH_TCMALLOC})

#[[ Define to 1 if you have the `telldir' function. #]]
set( MAGICKCORE_HAVE_TELLDIR ${HAVE_TELLDIR})

#[[ Define to 1 if you have the `tempnam' function. #]]
set( MAGICKCORE_HAVE_TEMPNAM ${HAVE_TEMPNAM})

#[[ Define to 1 if you have the `times' function. #]]
set( MAGICKCORE_HAVE_TIMES ${HAVE_TIMES})

#[[ Define to 1 if your `struct tm' has `tm_zone'. Deprecated, use
   `HAVE_STRUCT_TM_TM_ZONE' instead. #]]
set( MAGICKCORE_HAVE_TM_ZONE ${HAVE_TM_ZONE})

#[[ Define to 1 if you don't have `tm_zone' but do have the external array
   `tzname'. #]]
set( MAGICKCORE_HAVE_TZNAME ${HAVE_TZNAME})

#[[ Define to 1 if the system has the type `uintmax_t'. #]]
set( MAGICKCORE_HAVE_UINTMAX_T ${HAVE_UINTMAX_T})

#[[ Define to 1 if the system has the type `uintptr_t'. #]]
set( MAGICKCORE_HAVE_UINTPTR_T ${HAVE_UINTPTR_T})

#[[ Define to 1 if you have the `ulltostr' function. #]]
set( MAGICKCORE_HAVE_ULLTOSTR ${HAVE_ULLTOSTR})

#[[ Define if you have umem memory allocation library #]]
set( MAGICKCORE_HAVE_UMEM ${WITH_UMEM})

#[[ Define to 1 if you have the <unistd.h> header file. #]]
set( MAGICKCORE_HAVE_UNISTD_H ${HAVE_UNISTD_H})

#[[ Define to 1 if the system has the type `unsigned long long int'. #]]
set( MAGICKCORE_HAVE_UNSIGNED_LONG_LONG_INT ${HAVE_UNSIGNED_LONG_LONG_INT})

#[[ Define to 1 if you have the `uselocale' function. #]]
set( MAGICKCORE_HAVE_USELOCALE ${HAVE_USELOCALE})

#[[ Define to 1 if you have the `usleep' function. #]]
set( MAGICKCORE_HAVE_USLEEP ${HAVE_USLEEP})

#[[ Define to 1 if you have the `utime' function. #]]
set( MAGICKCORE_HAVE_UTIME ${HAVE_UTIME})

#[[ Define to 1 if you have the `utimensat' function. #]]
set( MAGICKCORE_HAVE_UTIMENSAT ${HAVE_UTIMENSAT})

#[[ Define to 1 if you have the <utime.h> header file. #]]
set( MAGICKCORE_HAVE_UTIME_H ${HAVE_UTIME_H})

#[[ Define to 1 if you have the `vfprintf' function. #]]
set( MAGICKCORE_HAVE_VFPRINTF ${HAVE_VFPRINTF})

#[[ Define to 1 if you have the `vfprintf_l' function. #]]
set( MAGICKCORE_HAVE_VFPRINTF_L  ${HAVE_VFPRINTF_L})

#[[ Define to 1 if you have the `vsnprintf' function. #]]
set( MAGICKCORE_HAVE_VSNPRINTF ${HAVE_VSNPRINTF})

#[[ Define to 1 if you have the `vsnprintf_l' function. #]]
set( MAGICKCORE_HAVE_VSNPRINTF_L ${HAVE_VSNPRINTF_L})

#[[ Define to 1 if you have the `vsprintf' function. #]]
set( MAGICKCORE_HAVE_VSPRINTF ${HAVE_VSPRINTF})

#[[ Define to 1 if you have the `waitpid' function. #]]
set( MAGICKCORE_HAVE_WAITPID ${HAVE_WAITPID})

#[[ Define to 1 if you have the <wchar.h> header file. #]]
set( MAGICKCORE_HAVE_WCHAR_H ${HAVE_WCHAR_H})

#[[ Define to 1 if you have the <xlocale.h> header file. #]]
set( MAGICKCORE_HAVE_XLOCALE_H ${HAVE_XLOCALE_H})

#[[ Define to 1 if you have the `_aligned_malloc' function. #]]
set( MAGICKCORE_HAVE__ALIGNED_MALLOC ${HAVE__ALIGNED_MALLOC})

#[[ Define to 1 if the system has the type `_Bool'. #]]
set( MAGICKCORE_HAVE__BOOL ${HAVE__BOOL})

#[[ Define to 1 if you have the `_exit' function. #]]
set( MAGICKCORE_HAVE__EXIT ${HAVE__EXIT})

#[[ Define to 1 if you have the `_NSGetExecutablePath' function. #]]
set( MAGICKCORE_HAVE__NSGETEXECUTABLEPATH ${HAVE__NSGETEXECUTABLEPATH})

#[[ Define to 1 if you have the `_pclose' function. #]]
set( MAGICKCORE_HAVE__PCLOSE ${HAVE__PCLOSE})

#[[ Define to 1 if you have the `_popen' function. #]]
set( MAGICKCORE_HAVE__POPEN ${HAVE__POPEN})

#[[ Define to 1 if you have the `_wfopen' function. #]]
set( MAGICKCORE_HAVE__WFOPEN ${HAVE__WFOPEN})

#[[ Define to 1 if you have the `_wstat' function. #]]
set( MAGICKCORE_HAVE__WSTAT ${HAVE__WSTAT})

#[[ define if your compiler has __attribute__ #]]
set( MAGICKCORE_HAVE___ATTRIBUTE__ ${HAVE___ATTRIBUTE__})


#[[ Define if you have libheif library #]]
set( MAGICKCORE_HEIC_DELEGATE ${WITH_LIBHEIF})

#[[ Define if you have JBIG library #]]
set( MAGICKCORE_JBIG_DELEGATE ${WITH_JBIG})

#[[ Define if you have JPEG library #]]
set( MAGICKCORE_JPEG_DELEGATE ${WITH_JPEG})

#[[ Define if you have jpeg-xl library #]]
set( MAGICKCORE_JXL_DELEGATE ${WITH_JXL})

#[[ Define if you have LCMS library #]]
set( MAGICKCORE_LCMS_DELEGATE ${WITH_LCMS})

#[[ Define if you have OPENJP2 library #]]
set( MAGICKCORE_LIBOPENJP2_DELEGATE ${WITH_OPENJP2})

#[[ Define if you have LQR library #]]
set( MAGICKCORE_LQR_DELEGATE ${WITH_LQR})

#[[ Define if using libltdl to support dynamically loadable modules and OpenCL
   #]]
set( MAGICKCORE_LTDL_DELEGATE ${WITH_LTDL})

#[[ Native module suffix #]]
if(WIN32)
set( MAGICKCORE_LTDL_MODULE_EXT ".dll")
else()
set( MAGICKCORE_LTDL_MODULE_EXT ".so")
endif()


#[[ Define if you have LZMA library #]]
set( MAGICKCORE_LZMA_DELEGATE ${WITH_LZMA})

#[[ Define to prepend to default font search path. #]]
# set( MAGICKCORE_MAGICK_FONT_PATH

#[[ Target Host CPU #]]
set( MAGICKCORE_MAGICK_TARGET_CPU ${TARGET_CPU})

#[[ Target Host OS #]]
set( MAGICKCORE_MAGICK_TARGET_OS ${TARGET_OS})

#[[ Target Host Vendor #]]
set( MAGICKCORE_MAGICK_TARGET_VENDOR ${TARGET_VENDOR})

#[[ Module directory dirname #]]
# set( MAGICKCORE_MODULES_DIRNAME

#[[ Magick API method prefix #]]
# set( MAGICKCORE_NAMESPACE_PREFIX

#[[ Magick API method prefix tag #]]
# set( MAGICKCORE_NAMESPACE_PREFIX_TAG

#[[ Define to 1 if assertions should be disabled. #]]
# set( MAGICKCORE_NDEBUG

#[[ Define if you have OPENEXR library #]]
set( MAGICKCORE_OPENEXR_DELEGATE ${WITH_OPENEXR})

#[[ Define if you have PANGOCAIRO library #]]
set( MAGICKCORE_PANGOCAIRO_DELEGATE ${WITH_PANGOCAIRO})

#[[ enable pipes (|) in filenames #]]
# set( MAGICKCORE_PIPES_SUPPORT 

#[[ Define if you have PNG library #]]
set( MAGICKCORE_PNG_DELEGATE ${WITH_PNG})

#[[ Define to necessary symbol if this constant uses a non-standard name on
   your system. #]]
# set( MAGICKCORE_PTHREAD_CREATE_JOINABLE

#[[ Pixel cache memory threshold (defaults to available memory) #]]
# set( MAGICKCORE_PixelCacheThreshold


#[[ Define if you have RAQM library #]]
set( MAGICKCORE_RAQM_DELEGATE ${WITH_RAQM})

#[[ Define if you have LIBRAW library #]]
set( MAGICKCORE_RAW_R_DELEGATE ${WITH_RAW})

#[[ Define if you have RSVG library #]]
set( MAGICKCORE_RSVG_DELEGATE ${WITH_RSVG})

#[[ The size of `size_t', as computed by sizeof. #]]
set( MAGICKCORE_SIZEOF_SIZE_T ${SIZEOF_SIZE_T})

#[[ The size of `void *', as computed by sizeof. #]]
set( MAGICKCORE_SIZEOF_VOID_P ${SIZEOF_VOID_P})

#[[ Define to 1 if the `S_IS*' macros in <sys/stat.h> do not work properly. #]]
# set( MAGICKCORE_STAT_MACROS_BROKEN

#[[ Define to 1 if strerror_r returns char *. #]]
set( MAGICKCORE_STRERROR_R_CHAR_P ${STRERROR_R_CHAR_P})

#[[ Define if you have POSIX threads libraries and header files. #]]
set( MAGICKCORE_THREAD_SUPPORT ${HAVE_PTHREAD})

#[[ Define if you have TIFF library #]]
set( MAGICKCORE_TIFF_DELEGATE ${WITH_TIFF})

#[[ Define to 1 if your <sys/time.h> declares `struct tm'. #]]
set( MAGICKCORE_TM_IN_SYS_TIME ${HAVE_SYS_TIME_H})

#[[ Define if you have WEBPMUX library #]]
set( MAGICKCORE_WEBPMUX_DELEGATE ${WITH_WEBPMUX})

#[[ Define if you have WEBP library #]]
set( MAGICKCORE_WEBP_DELEGATE ${WITH_WEBP})

#[[ Define to use the Windows GDI32 library #]]
set( MAGICKCORE_WINGDI32_DELEGATE ${HAVE_WINGDI32})

#[[ Define if using the dmalloc debugging malloc package #]]
set( MAGICKCORE_WITH_DMALLOC ${WITH_DMALLOC})

#[[ Define if you have WMF library #]]
set( MAGICKCORE_WMF_DELEGATE ${WITH_WMF})

#[[ Define if you have X11 library #]]
# set( MAGICKCORE_X11_DELEGATE

#[[ Define if you have XML library #]]
set( MAGICKCORE_XML_DELEGATE ${WITH_XML})

#[[ Build self-contained, embeddable, zero-configuration ImageMagick #]]
# set( MAGICKCORE_ZERO_CONFIGURATION_SUPPORT 

#[[ Define if you have ZIP library #]]
set( MAGICKCORE_ZIP_DELEGATE ${WITH_ZIP})

#[[ Define if you have ZLIB library #]]
set( MAGICKCORE_ZLIB_DELEGATE ${WITH_ZLIB})

#[[ Define if you have ZSTD library #]]
set( MAGICKCORE_ZSTD_DELEGATE ${WITH_ZSTD})

#[[ Number of bits in a file offset, on hosts where this is settable. #]]
# set( MAGICKCORE__FILE_OFFSET_BITS

#[[ enable run-time bounds-checking #]]
# set( MAGICKCORE__FORTIFY_SOURCE

#[[ Define to 1 to make fseeko visible on some hosts (e.g. glibc 2.2). #]]
# set( MAGICKCORE__LARGEFILE_SOURCE

#[[ Define for large files, on AIX-style hosts. #]]
# set( MAGICKCORE__LARGE_FILES

#[[ Define for Solaris 2.5.1 so the uint32_t typedef from <sys/synch.h>,
   <pthread.h>, or <semaphore.h> is not used. If the typedef were allowed, the
   #define below would cause a syntax error. #]]
# set( MAGICKCORE__UINT32_T

#[[ Define for Solaris 2.5.1 so the uint64_t typedef from <sys/synch.h>,
   <pthread.h>, or <semaphore.h> is not used. If the typedef were allowed, the
   #define below would cause a syntax error. #]]
# set( MAGICKCORE__UINT64_T

#[[ Define for Solaris 2.5.1 so the uint8_t typedef from <sys/synch.h>,
   <pthread.h>, or <semaphore.h> is not used. If the typedef were allowed, the
   #define below would cause a syntax error. #]]
# set( MAGICKCORE__UINT8_T

#[[ Define to appropriate substitute if compiler does not have __func__ #]]
# set( MAGICKCORE___func__

#[[ Define to empty if `const' does not conform to ANSI C. #]]
# set( MAGICKCORE_const

#[[ Define to `int' if <sys/types.h> doesn't define. #]]
set( MAGICKCORE_gid_t ${GID_T})

#[[ Define to the type of a signed integer type of width exactly 16 bits if
   such a type exists and the standard includes do not define it. #]]
# set( MAGICKCORE_int16_t

#[[ Define to the type of a signed integer type of width exactly 32 bits if
   such a type exists and the standard includes do not define it. #]]
# set( MAGICKCORE_int32_t

#[[ Define to the type of a signed integer type of width exactly 64 bits if
   such a type exists and the standard includes do not define it. #]]
# set( MAGICKCORE_int64_t

#[[ Define to the type of a signed integer type of width exactly 8 bits if such
   a type exists and the standard includes do not define it. #]]
# set( MAGICKCORE_int8_t

#[[ Define to the widest signed integer type if <stdint.h> and <inttypes.h> do
   not define. #]]
# set( MAGICKCORE_intmax_t

#[[ Define to the type of a signed integer type wide enough to hold a pointer,
   if such a type exists, and if the system does not define it. #]]
# set( MAGICKCORE_intptr_t

#[[ Define to a type if <wchar.h> does not define. #]]
# set( MAGICKCORE_mbstate_t

#[[ Define to `int' if <sys/types.h> does not define. #]]
# set( MAGICKCORE_mode_t

#[[ Define to `long int' if <sys/types.h> does not define. #]]
# set( MAGICKCORE_off_t

#[[ Define as a signed integer type capable of holding a process identifier. #]]
# set( MAGICKCORE_pid_t

#[[ Define to the equivalent of the C99 'restrict' keyword, or to
   nothing if this is not supported.  Do not define if restrict is
   supported only directly.  #]]
set( _magickcore_restrict ${_magickcore_restrict})

#[[ Define to `unsigned int' if <sys/types.h> does not define. #]]
# set( MAGICKCORE_size_t

#[[ Define to `int' if <sys/types.h> does not define. #]]
set( MAGICKCORE_ssize_t ${SSIZE_T})

#[[ Define to `int' if <sys/types.h> doesn't define. #]]
# set( MAGICKCORE_uid_t

#[[ Define to the type of an unsigned integer type of width exactly 16 bits if
   such a type exists and the standard includes do not define it. #]]
# set( MAGICKCORE_uint16_t

#[[ Define to the type of an unsigned integer type of width exactly 32 bits if
   such a type exists and the standard includes do not define it. #]]
# set( MAGICKCORE_uint32_t

#[[ Define to the type of an unsigned integer type of width exactly 64 bits if
   such a type exists and the standard includes do not define it. #]]
# set( MAGICKCORE_uint64_t

#[[ Define to the type of an unsigned integer type of width exactly 8 bits if
   such a type exists and the standard includes do not define it. #]]
# set( MAGICKCORE_uint8_t

#[[ Define to the widest unsigned integer type if <stdint.h> and <inttypes.h>
   do not define. #]]
# set( MAGICKCORE_uintmax_t

#[[ Define to the type of an unsigned integer type wide enough to hold a
   pointer, if such a type exists, and if the system does not define it. #]]
# set( MAGICKCORE_uintptr_t

#[[ Define to empty if the keyword `volatile' does not work. Warning: valid
   code using `volatile' can become incorrect without. Disable with care. #]]
set( MAGICKCORE_volatile ${HAVE_VOLATILE})
 
configure_file(
  ${CMAKE_CURRENT_SOURCE_DIR}/ImageMagick-7/MagickCore/magick-baseconfig.h.in
  ${CMAKE_CURRENT_SOURCE_DIR}/ImageMagick-7/MagickCore/magick-baseconfig.h
  @ONLY
)
