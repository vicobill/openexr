
include(CheckSymbolExists)
include(CheckIncludeFile)
include(CheckTypeSize)
include(CheckCSourceCompiles)
include(CheckVariableExists)
include(CheckFunctionExists)
include(CheckStructHasMember)
include(CheckLibraryExists)
include(CheckPrototypeDefinition)
include(CheckCSourceRuns)
include(CheckPrototypeDefinition)

check_include_file("arm/limits.h" HAVE_ARM_LIMITS_H)
check_include_file("arpa/inet.h" HAVE_ARPA_INET_H)
check_include_file("complex.h" HAVE_COMPLEX_H)
check_include_file("CL/cl.h" HAVE_CL_CL_H)
check_include_file("unistd.h" HAVE_UNISTD_H)
check_include_file("sys/types.h" HAVE_STS_TYPES_H)
check_include_file("sys/fcntl.h" HAVE_SYS_FCNTL_H)
check_include_file("dirent.h" HAVE_DIRENT_H)
check_include_file("dlfcn.h" HAVE_DLFCN_H)
check_include_file("errno.h" HAVE_ERRNO_H)
check_include_file("fcntl.h" HAVE_FCNTL_H)
check_include_file("float.h" HAVE_FLOAT_H)
check_include_file("sys/stat.h" HAVE_SYS_STAT_H)
check_include_file("inttypes.h" HAVE_INTTYPES_H)
check_include_file("lcms2.h" HAVE_LCMS2_H)
check_include_file("lcms2/lcms2.h" HAVE_LCMS2_LCMS2_H)
check_include_file("limits.h" HAVE_LIMITS_H)
check_include_file("locale.h" HAVE_LOCALE_H)
check_include_file("ndir.h" HAVE_NDIR_H)
check_include_file("netdb.h" HAVE_NETDB_H)
check_include_file("netinet/in.h" HAVE_NETINET_IN_H)
check_include_file("malloc.h" HAVE_MALLOC_H)
check_include_file("OS.h" HAVE_OS_H)
check_include_file("stdarg.h" HAVE_STDARG_H)
check_include_file("stdbool.h" HAVE_STDBOOL_H)
check_include_file("stddef.h" HAVE_STDDEF_H)
check_include_file("stdint.h" HAVE_STDINT_H)
check_include_file("stdio.h" HAVE_STDIO_H)
check_include_file("unistd.h" HAVE_UNISTD_H)
check_include_file("stdlib.h" HAVE_STDLIB_H)
check_include_file("process.h" HAVE_PROCESS_H)
check_include_file("strings.h" HAVE_STRINGS_H)
check_include_file("string.h" HAVE_STRING_H)
check_include_file("sys/dir.h" HAVE_SYS_DIR_H)
check_include_file("sys/ipc.h" HAVE_SYS_IPC_H)
check_include_file("sys/mman.h" HAVE_SYS_MMAN_H)
check_include_file("sys/param.h" HAVE_SYS_PARAM_H)
check_include_file("sys/resource.h" HAVE_SYS_RESOURCE_H)
check_include_file("sys/sendfile.h" HAVE_SYS_SENDFILE_H)
check_include_file("sys/socket.h" HAVE_SYS_SOCKET_H)
check_include_file("sys/stat.h" HAVE_SYS_STAT_H)
check_include_file("sys/syslimits.h" HAVE_SYS_SYSLIMITS_H)
check_include_file("sys/times.h" HAVE_SYS_TIMES_H)
check_include_file("sys/time.h" HAVE_SYS_TIME_H)
check_include_file("sys/types.h" HAVE_SYS_TYPES_H)
check_include_file("sys/uio.h" HAVE_SYS_UIO_H)
check_include_file("sys/wait.h" HAVE_SYS_WAIT_H)
check_include_file("sun_prefetch.h" HAVE_SUN_PREFETCH_H)
check_include_file("OpenCL/cl.h" HAVE_OPENCL_CL_H)
check_include_file("minix/config.h" HAVE_MINIX_CONFIG_H)
check_include_file("mach-o/dyld.h" HAVE_MACH_O_DYLD_H)
check_include_file("machine/param.h.h" HAVE_MACHINE_PARAM_H)
check_include_file("linux/unistd.h" HAVE_LINUX_UNISTD_H)
check_include_file("utime.h" HAVE_UTIME_H)
check_include_file("wchar.h" HAVE_WCHAR_H)
check_include_file("xlocale.h" HAVE_XLOCALE_H)
check_include_file("sys/timeb.h" HAVE_SYS_TIMEB_H)
check_include_file("pwd.h" HAVE_PWD_H)
check_include_file("poll.h" HAVE_POLL_H)
check_include_file("spawn.h" HAVE_SPAWN_H)
check_include_file("signal.h" HAVE_SIGNAL_H)
check_include_file("dirent.h" HAVE_DIRENT_H)
check_include_file("sys/select.h" HAVE_SYS_SELECT_H)
check_include_file("WinSock2.h" HAVE_WINSOCK2_H)
check_include_file("sys/utime.h" HAVE_SYS_UTIME_H)
check_include_file("err.h" HAVE_ERR_H)
check_include_file("vfork.h" HAVE_VFORK_H)
check_include_file("zlib.h" HAVE_ZLIB_H)
check_include_file("wctype.h" HAVE_WCTYPE_H)
check_include_file("crtdefs.h" HAVE_CRTDEFS_H)
check_include_file("sys/mkdev.h" HAVE_SYS_MKDEV_H)
check_include_file("sys/sysmacros.h" HAVE_SYS_SYSMACROS_H)




check_symbol_exists("acosh" "math.h" HAVE_ACOSH)
check_symbol_exists("aligned_malloc" "stdlib.h" HAVE_ALIGNED_MALLOC)
check_symbol_exists(asinh "math.h" HAVE_ASINH)
check_symbol_exists(atanh "math.h" HAVE_ATANH)
check_symbol_exists(atexit "stdlib.h" HAVE_ATEXIT)
check_symbol_exists(atoll "stdlib.h" HAVE_ATOLL)
check_symbol_exists(bool "stddef.h" HAVE_BOOL)
check_symbol_exists(cabs "complex.h" HAVE_CABS)
check_symbol_exists(carg "complex.h" HAVE_CARG)
check_symbol_exists(cimag "complex.h" HAVE_CIMAG)
check_symbol_exists(creal "complex.h" HAVE_CREAL)
check_symbol_exists(clock "time.h" HAVE_CLOCK)
check_symbol_exists(clock_getres "time.h" HAVE_CLOCK_GETRES)
check_symbol_exists(clock_gettime "time.h" HAVE_CLOCK_GETTIME)
check_symbol_exists(CLOCK_REALTIME "time.h" HAVE_CLOCK_REALTIME)
check_symbol_exists(ctime_r "time.h" HAVE_CTIME_R)
check_symbol_exists(tzname "time.h" HAVE_DECL_TZNAME)
check_symbol_exists(pread "unistd.h" HAVE_DECL_PREAD)
check_symbol_exists(pwrite "unistd.h" HAVE_DECL_PWRITE)
check_symbol_exists(strerror_r "string.h" HAVE_DECL_STRERROR_R)
check_symbol_exists(strlcpy "string.h" HAVE_DECL_STRLCPY)
check_symbol_exists(vsnprintf "stdio.h" HAVE_DECL_VSNPRINTF)
check_symbol_exists(directio "sys/types.h" HAVE_DIRECTIO)
check_symbol_exists(erf "math.h" HAVE_ERF)
check_symbol_exists(floor "math.h" HAVE_FLOOR)
check_symbol_exists(execvp "unistd.h" HAVE_EXECVP)
check_symbol_exists(fchmod "sys/stat.h" HAVE_FCHMOD)
check_symbol_exists(fork "unistd" HAVE_FORK)
check_symbol_exists(fseeko "stdio.h" HAVE_FSEEKO)
check_symbol_exists(ftime "sys/timeb.h" HAVE_FTIME)
check_symbol_exists(ftruncate "unistd.h" HAVE_FTRUNCATE)
check_symbol_exists(getcwd "unistd.h" HAVE_GETCWD )
check_symbol_exists(getc_unlocked "stdio.h" HAVE_GETC_UNLOCKED)
check_symbol_exists(getdtablesize "unistd.h" HAVE_GETDTABLESIZE)
check_symbol_exists(getentropy "unistd.h" HAVE_GETENTROPY)
check_symbol_exists(getexecname "stdlib.h" HAVE_GETEXECNAME)
check_symbol_exists(getpagesize "unistd.h" HAVE_GETPAGESIZE)
check_symbol_exists(getpid "unistd.h" HAVE_GETPID)
check_symbol_exists(getpwnam_r "pwd.h" HAVE_GETPWNAM_R)
check_symbol_exists(getrlimit "sys/resource.h" HAVE_GETRLIMIT)
check_symbol_exists(setrlimit "sys/resource.h" HAVE_SETRLIMIT)
check_symbol_exists(getrusage "sys/resource.h" HAVE_GETRUSAGE)
check_symbol_exists(gettimeofday "sys/time.h" HAVE_GETTIMEOFDAY)
check_symbol_exists(gmtime_r "time.h" HAVE_GMTIME_R)
check_symbol_exists(intmax_t "stdint.h" HAVE_INTMAX_T)
check_symbol_exists(intptr_t "stdint.h" HAVE_INTPTR_T)

check_symbol_exists(isnan "math.h" HAVE_ISNAN)
# 贝塞尔函数
check_symbol_exists(j0 "math.h" HAVE_J0)
check_symbol_exists(j1 "math.h" HAVE_J1)
check_symbol_exists(jn "math.h" HAVE_JN)
check_symbol_exists(mbstate_t "wchar.h" HAVE_MBSTATE_T)

check_symbol_exists(sendfile "linux/sendfile.h" HAVE_LINUX_SENDFILE)
check_symbol_exists(lltostr "stdlib.h" HAVE_LLTOSTR)
check_symbol_exists(localtime_r "time.h" HAVE_LOCALTIME_R)
check_symbol_exists(lstat "sys/stat.h" HAVE_LSTAT)
check_symbol_exists(memmove "string.h" HAVE_MEMMOVE)
check_symbol_exists(memset "string.h" HAVE_MEMSET)
check_symbol_exists(mkdir "sys/stat.h" HAVE_MKDIR)
check_symbol_exists(mkstemp "stdlib.h" HAVE_MKSTEMP)
check_symbol_exists(mkostemp "stdlib.h" HAVE_MKOSTEMP)
check_symbol_exists(mmap "sys/mman" HAVE_MMAP)
check_symbol_exists(munmap "sys/mman" HAVE_MUNMAP)
check_symbol_exists(nanosleep "time.h" HAVE_NANOSLEEP)
check_symbol_exists(newlocale "locale.h" HAVE_NEWLOCALE)
check_symbol_exists(pclose "stdio.h" HAVE_PCLOSE)
check_symbol_exists(poll "poll.h" HAVE_POLL)
check_symbol_exists(popen "stdio.h" HAVE_POPEN)
check_symbol_exists(posix_fadvise "fcntl.h" HAVE_POSIX_FADVISE)
check_symbol_exists(posix_fallocate "fcntl.h" HAVE_POSIX_FALLOCATE)
check_symbol_exists(posix_madvise "sys/mman.h" HAVE_POSIX_MADVISE)
check_symbol_exists(posix_memalign "stdlib.h" HAVE_POSIX_MEMALIGN)
check_symbol_exists(posix_spawnp "spawn.h" HAVE_POSIX_SPAWNP)
check_symbol_exists(pow "math.h" HAVE_POW)
check_symbol_exists(pread "unistd.h" HAVE_PREAD)
check_symbol_exists(putenv "stdlib.h" HAVE_PUTENV)
check_symbol_exists(pwrite "unistd.h" HAVE_PWRITE)
check_symbol_exists(qsort_r "stdlib.h" HAVE_QSORT_R)
check_symbol_exists(raise "signal.h" HAVE_RAISE)
check_symbol_exists(rand_r "stdlib.h" HAVE_RAND_R)
check_symbol_exists(readlink "unistd.h" HAVE_READLINK)
check_symbol_exists(realpath "stdlib.h" HAVE_REALPATH)
check_symbol_exists(realpath "limits.h" HAVE_REALPATH)
check_symbol_exists(seekdir "dirent.h" HAVE_SEEKDIR)
check_symbol_exists(select "sys/select.h" HAVE_SELECT)
check_symbol_exists(select "WinSock2.h" HAVE_SELECT)
check_symbol_exists(sendfile "sys/sendfile.h" HAVE_SENDFILE)
check_symbol_exists(setlocale "locale.h" HAVE_SETLOCALE)
check_symbol_exists(setvbuf "stdio.h" HAVE_SETVBUF)
check_symbol_exists(sigaction "signal.h" HAVE_SIGACTION)
check_symbol_exists(sigemptyset "signal.h" HAVE_SIGEMPTYSET)
check_symbol_exists(socket "sys/socket.h" HAVE_SOCKET)
check_symbol_exists(socket "WinSock2.h" HAVE_SOCKET)
check_symbol_exists(spawnvp "process.h" HAVE_SPAWNVP)
check_symbol_exists(sqrt "math.h" HAVE_SQRT)
check_symbol_exists(stat "sys/stat.h" HAVE_STAT)
check_symbol_exists(strcasecmp "strings.h" HAVE_STRCASECMP)
check_symbol_exists(strcasestr "string.h" HAVE_STRCASESTR)
check_symbol_exists(strchr "string.h" HAVE_STRCHR)
check_symbol_exists(strdup "string.h" HAVE_STRDUP)
check_symbol_exists(strerror "string.h" HAVE_STRERROR)
check_symbol_exists(strerror_r "string.h" HAVE_STRERROR_R)
check_symbol_exists(strlcat "string.h" HAVE_STRLCAT)
check_symbol_exists(strlcpy "string.h" HAVE_STRLCPY)
check_symbol_exists(strncasecmp "string.h" HAVE_STRNCASECMP)
check_symbol_exists(strpbrk "string.h" HAVE_STRPBRK)
check_symbol_exists(strrchr "string.h" HAVE_STRRCHR)
check_symbol_exists(strspn "string.h" HAVE_STRSPN)
check_symbol_exists(strstr "string.h" HAVE_STRSTR)
check_symbol_exists(strtod "stdlib.h" HAVE_STRTOD)
check_symbol_exists(strtod_l "stdlib.h" HAVE_STRTOD_L)
check_symbol_exists(strtol "stdlib.h" HAVE_STRTOL)
check_symbol_exists(strtoul "stdlib.h" HAVE_STRTOUL)
check_symbol_exists(symlink "unistd.h" HAVE_SYMLINK)
check_symbol_exists(sysconf "unistd.h" HAVE_SYSCONF)
check_symbol_exists(system "stdlib.h" HAVE_SYSTEM)
check_symbol_exists(telldir "dirent.h" HAVE_TELLDIR)
check_symbol_exists(tempnam "stdio.h" HAVE_TEMPNAM)
check_symbol_exists(times "sys/time.h" HAVE_TIMES)
check_symbol_exists(uintmax_t "stdint.h" HAVE_UINTMAX_T)
check_symbol_exists(uintptr_t "stdint.h" HAVE_UINTPTR_T)
check_symbol_exists(ulltostr "stdlib.h" HAVE_ULLTOSTR)
check_symbol_exists(uselocale "locale.h" HAVE_USELOCALE)
check_symbol_exists(usleep "unistd.h" HAVE_USLEEP)
check_symbol_exists(utime "utime.h" HAVE_UTIME)
if(NOT HAVE_UTIME AND HAVE_SYS_UTIME_H)
  check_symbol_exists(utime "sys/utime.h" HAVE_UTIME)
  if(WIN32) # win32下，#define utime _utime
    set(HAVE_UTIME 1)
  endif()
endif()
check_symbol_exists(utimensat "sys/stat.h" HAVE_UTIMENSAT)

check_symbol_exists(vfprintf "stdio.h" HAVE_VFPRINTF)
check_symbol_exists(vfprintf_l "stdarg.h" HAVE_VFPRINTF_L)
check_symbol_exists(vsnprintf "stdio.h" HAVE_VSNPRINTF)
check_symbol_exists(vsnprintf_l "stdarg.h" HAVE_VSNPRINTF_L)
check_symbol_exists(vsprintf "stdio.h" HAVE_VSPRINTF)
check_symbol_exists(waitpid "sys/wait.h" HAVE_WAITPID)
check_symbol_exists(_aligned_malloc "malloc.h" HAVE__ALIGNED_MALLOC)
check_symbol_exists(_Bool "" HAVE__BOOL)
check_symbol_exists(_exit "stdlib.h" HAVE__EXIT)
check_symbol_exists(_NSGetExecutablePath "" HAVE__NSGETEXECUTABLEPATH)
check_symbol_exists(_pclose "stdio.h" HAVE__PCLOSE)
check_symbol_exists(_popen "stdio.h" HAVE__POPEN)
check_symbol_exists(_wfopen "stdio.h" HAVE__WFOPEN)
check_symbol_exists(_wfopen "wchar.h" HAVE__WFOPEN)
check_symbol_exists(_wstat "sys/stat.h" HAVE__WSTAT)
check_symbol_exists(_wstat "errno.h" HAVE__WSTAT)
check_symbol_exists(_wstat "wchar.h" HAVE__WSTAT)
if(HAVE_SYS_TIME_H)
check_symbol_exists("struct tm" "sys/time.h" TM_IN_SYS_TIME)
endif()


check_symbol_exists(asctime_r "time.h" HAVE_ASCTIME_R)
check_symbol_exists(asprintf "stdio.h" HAVE_ASPRINTF)
check_symbol_exists(ctime_r "time.h" HAVE_CTIME_R)
check_symbol_exists(daylight "time.h" HAVE_DAYLIGHT)
check_symbol_exists(dprintf "stdio.h" HAVE_DPRINTF)
check_symbol_exists(fmtcheck "stdio.h" HAVE_FMTCHECK)
check_symbol_exists(getline "stdio.h" HAVE_GETLINE)
check_symbol_exists(getopt_long "getopt.h" HAVE_GETOPT_LONG)
check_symbol_exists(pid_t "unistd.h" HAVE_PID_T)
check_symbol_exists(strtof "stdlib.h" HAVE_STRTOF)
check_symbol_exists(TM_ISDST "time.h" HAVE_TM_ISDST)
check_symbol_exists(vfork "vfork.h" HAVE_VFORK)
check_symbol_exists(wcwidth "wchar.h" HAVE_WCWIDTH)
check_symbol_exists(mbrtowc "wchar.h" HAVE_MBRTOWC)
check_symbol_exists(makedev "sys/sysmacros.h" HAVE_MAKEDEV)



check_include_file("getopt.h" HAVE_GETOPT_H)
check_include_file("smtdlib.h" HAVE_STDLIB_H)

if (HAVE_DAYLIGHT)
  set(HAVE_DECL_DAYLIGHT 1)
endif()



check_type_size("double" SIZEOF_DOUBLE)
check_type_size("double_t" SIZEOF_DOUBLE_T)
check_type_size("float" SIZEOF_FLOAT)
check_type_size("float_t" SIZEOF_FLOAT_T)
check_type_size("long double" SIZEOF_LONG_DOUBLE)
check_type_size("size_t" SIZEOF_SIZE_T)
check_type_size("unsigned long long" SIZEOF_UNSIGNED_LONG_LONG)
check_type_size("void *" SIZEOF_VOID_P)
check_type_size("long long int" SIZEOF_LONG_LONG_INT)


check_struct_has_member("struct stat" st_rdev "sys/stat.h" HAVE_STRUCT_STAT_ST_RDEV)
check_struct_has_member("struct tm" tm_gmtoff "time.h" HAVE_STRUCT_TM_TM_GMTOFF)
if(NOT HAVE_STRUCT_TM_TM_GMTOFF AND HAVE_SYS_TIME_H)
  check_struct_has_member("struct tm" tm_gmtoff "sys/time.h" HAVE_STRUCT_TM_TM_GMTOFF)
endif()

check_struct_has_member("struct tm" tm_zone "time.h" HAVE_STRUCT_TM_TM_ZONE)
if(NOT HAVE_STRUCT_TM_TM_ZONE AND HAVE_SYS_TIME_H)
  check_struct_has_member("struct tm" tm_zone "sys/time.h" HAVE_STRUCT_TM_TM_ZONE)
endif()

#[[
check_library_exists(gnurx)
check_library_exists(pthread)
check_library_exists(z)

]]

check_c_source_compiles("
int main(){
  int a = 10;
  int* restrict pa = &a;
  return 0;
}
" HAVE_RESTRICT_KEYWORD)

check_c_source_compiles("
int main(){
  int a = 10;
  int* __restrict pa = &a;
  return 0;
}
" HAVE___RESTRICT_KEYWORD)

check_c_source_compiles("
int main(){
  int a = 10;
  int* __restrict__ pa = &a;
  return 0;
}
" HAVE___RESTRICT___KEYWORD)

check_variable_exists("tzname" HAVE_TZNAME)

if(NOT WIN32)
  set(HAVE_HUGEPAGES 1)
endif()

if(SIZEOF_LONG_LONG_INT)
  set(HAVE_LONG_LONG_INT 1)
endif()
if(SIZEOF_UNSIGNED_LONG_LONG)
  set(HAVE_UNSIGNED_LONG_LONG_INT 1)
endif()

check_struct_has_member("struct tm" tm_zone "time.h" HAVE_STRUCT_TM_TM_ZONE LANGUAGE C)
if (NOT HAVE_STRUCT_TM_TM_ZONE)
  check_struct_has_member("struct tm" tm_zone "sys/time.h" HAVE_STRUCT_TM_TM_ZONE LANGUAGE C)
endif()

if(HAVE_STRUCT_TM_TM_ZONE)
  set(HAVE_TM_ZOME 1)
endif()

check_c_source_compiles("
__atrribute__((visibility(\"default\")))
int sum(int a, int b){return a+b;}
int main() {
  return 0;
}
" HAVE___ATTRIBUTE__
)

check_c_source_compiles("
int main() {
  volatile int i = 10;
  return 0;
}
" HAVE_VOLATILE)


check_prototype_definition(strerror_t
"char *strerror_r(int errnum, char* buf, size_t buflen);"
"char*"
"string.h"
STRERROR_R_CHAR_P)

check_symbol_exists(gid_t "sys/types.h" HAVE_GID_T)
if (NOT HAVE_GID_T)
  set(GID_T "int")
endif()

check_symbol_exists(ssize_t "stddef.h" HAVE_SSIZE_T)
if(NOT HAVE_SSIZE_T)
  check_symbol_exists(ssize_t "sys/type.h" HAVE_SSIZE_T)
endif()
if (NOT HAVE_SSIZE_T)
  set(SSIZE_T "long long int")
else()
  set(SSIZE_T "ssize_t")
endif()



#[[ ====== ALIASES ====== ]]
if(HAVE_FORK)
set(HAVE_WORKING_FORK ${HAVE_FORK})
endif()
if(HAVE_VFORK)
set(HAVE_WORING_VFORK ${HAVE_VFORK})
endif()

# if(CMAKE_SIZEOF_VOID_P EQUAL 8)
#   set(_FILE_OFFSET_BITS 64) # 系统处理>2G文件
# else()
#   set(_FILE_OFFSET_BITS 32)
# endif()

if(HAVE_SYS_MKDEV_H)
  check_symbol_exists(major "sys/mkdev.h" MAJOR_IN_MKDEV)
elseif(HAVE_SYS_SYSMACROS_H)
  check_symbol_exists(major "sys/sysmacros.h" MAJOR_IN_SYSMACROS)
endif()


check_c_source_compiles(
"
void f()
{
    char x[ (char)0xff ]; /* x[-1] if signed */
}
"
CHAR_IS_UNSIGNED)

check_c_source_compiles(
"
void f()
{
    char x[ ((signed char)0xff) >> 1 ]; /* x[-1] if signed */
}
"
RIGHT_SHIFT_IS_UNSIGNED)

# Check if `double_t' exists
CHECK_C_SOURCE_COMPILES (
"
  #include <math.h>
  void main () {double_t d = 0;}
"
HAVE_DOUBLE_T)

# Check if `float_t' exists
CHECK_C_SOURCE_COMPILES (
"
  #include <math.h>
  void main () {float_t f = 0;}
"
HAVE_FLOAT_T)

# Check if `intmax_t' exists
CHECK_TYPE_SIZE (intmax_t INTMAX_T)
IF(HAVE_INTMAX_T) # it was TRUE and we need it to be 1
  SET(HAVE_INTMAX_T 1)
ENDIF()

# Check if `intptr_t' exists
CHECK_TYPE_SIZE (intptr_t INTPTR_T)
IF(HAVE_INTPTR_T ) # it was TRUE and we need it to be 1
  SET(HAVE_INTPTR_T 1)
ENDIF()
# Check if `uintmax_t' exists
CHECK_TYPE_SIZE(uintmax_t UINTMAX_T)
IF(HAVE_UINTMAX_T) # it was TRUE and we need it to be 1
  SET(HAVE_UINTMAX_T 1)
ENDIF()

# Check if `uintptr_t' exists
CHECK_TYPE_SIZE(uintptr_t UINTPTR_T)
IF(HAVE_UINTPTR_T) # it was TRUE and we need it to be 1
  SET(HAVE_UINTPTR_T 1)
ENDIF()
# Check if `long double' exists
CHECK_TYPE_SIZE("long double" LONG_DOUBLE)
IF(HAVE_LONG_DOUBLE) # it was TRUE and we need it to be 1
  SET(HAVE_LONG_DOUBLE 1)
ENDIF()

# Check if `long double' have more precision than `double'
IF(HAVE_LONG_DOUBLE)
  CHECK_TYPE_SIZE(double DOUBLE)
  IF (${LONG_DOUBLE} GREATER ${DOUBLE})
    SET(HAVE_LONG_DOUBLE_WIDER 1)
  ENDIF()
ENDIF()

# Check `double' size
CHECK_TYPE_SIZE(double SIZEOF_DOUBLE)

# Check if `long long int' exists
CHECK_TYPE_SIZE("long long int" LONG_LONG_INT)
IF(HAVE_LONG_LONG_INT) # it was TRUE and we need it to be 1
  SET(HAVE_LONG_LONG_INT 1)
ENDIF()
# Check if `unsigned long long int' exists
CHECK_TYPE_SIZE("unsigned long long int" UNSIGNED_LONG_LONG_INT)
IF(HAVE_UNSIGNED_LONG_LONG_INT) # it was TRUE and we need it to be 1
  SET(HAVE_UNSIGNED_LONG_LONG_INT 1)
ENDIF()
# Check if `namespace' exists
CHECK_CXX_SOURCE_COMPILES (
  "namespace test {} void main() {using namespace ::test;}"
  HAVE_NAMESPACES)

# Check if `std::' exists
CHECK_CXX_SOURCE_COMPILES (
"
  #include <iostream>
  void main() {std::istream& is = std::cin;}
"
HAVE_NAMESPACE_STD)

# Check if POSIX threads library, header and symbols exists
CHECK_INCLUDE_FILE(pthread.h HAVE_PTHREAD_H)
IF(HAVE_PTHREAD_H)
  CHECK_LIBRARY_EXISTS(pthread pthread_create "" HAVE_PTHREAD)
  CHECK_SYMBOL_EXISTS(PTHREAD_PRIO_INHERIT pthread.h HAVE_PTHREAD_PRIO_INHERIT)
ENDIF()

# Check supported X11 extensions
FIND_PACKAGE(X11)
IF(X11_Xshape_FOUND)
  SET(HAVE_SHAPE 1)
ENDIF()
IF(X11_XShm_FOUND)
  SET(HAVE_SHARED_MEMORY 1)
ENDIF()

# Check if <stdbool.h> exists and conforms to C99
CHECK_C_SOURCE_COMPILES (
"
  #include <stdbool.h>
  void main() {bool b = __bool_true_false_are_defined;}
"
HAVE_STDBOOL_H)

# Check if compiler supports ISO C++ standard library
CHECK_CXX_SOURCE_COMPILES (
"
  #include <map>
  #include <iomanip>
  #include <cmath>
  #ifdef HAVE_NAMESPACES
    using namespace std;
  #endif

  void main() {}
"
HAVE_STD_LIBS)

# # Check if `#' stringizing operator is supported
# CHECK_C_SOURCE_RUNS(
# "
#   #define x(y) #y
#   int main() { char c[] = \"c\"; char* p = x(c); return (c[0] != p[0]) || (c[1] != p[1]); }
# "
# HAVE_STRINGIZE)

# Check if `fork' works
IF(HAVE_FORK)
  CHECK_CXX_SOURCE_RUNS(
  "
    #ifdef HAVE_SYS_TYPES_H
	  #include <sys/types.h>
	#endif
	#ifdef HAVE_UNISTD_H
	  #include <unistd.h>
	#endif
    int main() { if (fork() < 0) return(1); return(0); }
  "
  HAVE_WORKING_FORK)
ENDIF()

# Check if `vfork' works
IF(HAVE_VFORK)
  CHECK_CXX_SOURCE_RUNS(
  "
    #ifdef HAVE_SYS_TYPES_H
	  #include <sys/types.h>
	#endif
	#ifdef HAVE_UNISTD_H
	  #include <unistd.h>
	#endif
	#ifdef HAVE_VFORK_H
	  #include <vfork.h>
	#endif
    int main() { if (vfork() < 0) return(1); return(0); }
  "
  HAVE_WORKING_VFORK)
ENDIF()

# Check if `_Bool' exists
CHECK_TYPE_SIZE(_Bool _BOOL)
IF(HAVE__BOOL) # it was TRUE and we need it to be 1
  SET(HAVE__BOOL 1)
ENDIF()

# Check if `__attribute__' exists
CHECK_C_SOURCE_COMPILES(
"
  #include <stdlib.h>
  static void foo(void) __attribute__ ((unused));
  void main() { }
"
HAVE___ATTRIBUTE__)

# Check return type of signal handlers
CHECK_C_SOURCE_COMPILES(
"
  #include <signal.h>
  #ifdef signal
    #undef signal
  #endif
  #ifdef __cplusplus
  extern \"C\" void (*signal (int, void (*)(int)))(int);
  #else
  void (*signal ()) ();
  #endif
  void main() {}
"
SIGNAL_RETURN_TYPE_IS_VOID)
IF(SIGNAL_RETURN_TYPE_IS_VOID)
  SET(RETSIGTYPE void)
ELSE(SIGNAL_RETURN_TYPE_IS_VOID)
  SET(RETSIGTYPE int)
ENDIF(SIGNAL_RETURN_TYPE_IS_VOID)

# Check `double_t' size
IF(HAVE_DOUBLE_T)
  CHECK_TYPE_SIZE(double_t SIZEOF_DOUBLE_T)
ENDIF()

# Check `float' size
CHECK_TYPE_SIZE(float SIZEOF_FLOAT)

# Check `float_t' size
IF(HAVE_FLOAT_T)
  CHECK_TYPE_SIZE(float_t SIZEOF_FLOAT_T)
ENDIF()

# Check `long double' size
IF(HAVE_LONG_DOUBLE)
  CHECK_TYPE_SIZE("long double" SIZEOF_LONG_DOUBLE)
ENDIF()

# Check `off_t' size
CHECK_TYPE_SIZE(off_t SIZEOF_OFF_T)

# Check `signed int' size
CHECK_TYPE_SIZE("signed int" SIZEOF_SIGNED_INT)

# Check `signed long' size
CHECK_TYPE_SIZE("signed long" SIZEOF_SIGNED_LONG)

# Check `signed long long' size
CHECK_TYPE_SIZE("signed long long" SIZEOF_SIGNED_LONG_LONG)

# Check `signed short' size
CHECK_TYPE_SIZE("signed short" SIZEOF_SIGNED_SHORT)

# Check `size_t' size
CHECK_TYPE_SIZE("size_t" SIZEOF_SIZE_T)

# Check `ssize_t' size
CHECK_TYPE_SIZE("ssize_t" SIZEOF_SSIZE_T)

# Check `unsigned int' size
CHECK_TYPE_SIZE("unsigned int" SIZEOF_UNSIGNED_INT)

# Check `unsigned int*' size
CHECK_TYPE_SIZE("unsigned int*" SIZEOF_UNSIGNED_INTP)

# Check `unsigned long' size
CHECK_TYPE_SIZE("unsigned long" SIZEOF_UNSIGNED_LONG)

# Check `unsigned long long' size
CHECK_TYPE_SIZE("unsigned long long" SIZEOF_UNSIGNED_LONG_LONG)

# Check `unsigned short' size
CHECK_TYPE_SIZE("unsigned short" SIZEOF_UNSIGNED_SHORT)

# Check strerror_r returns `char *'
CHECK_CXX_SOURCE_COMPILES(
"
  void main()
  {
    char buf[100];
    char x = *strerror_r(0, buf, sizeof buf);
    char *p = strerror_r(0, buf, sizeof buf);
  }
"
STRERROR_R_CHAR_P)

# Check POSIX threads libraries and header files exists
FIND_PACKAGE(Threads)
IF(CMAKE_USE_PTHREADS_INIT)
  SET(THREAD_SUPPORT TRUE)
  SET(CMAKE_THREAD_PREFER_PTHREAD TRUE)
  SET(THREADS_PREFER_PTHREAD_FLAG TRUE)
ENDIF()

# Check if we can safely include both <sys/time.h> and <time.h>
CHECK_CXX_SOURCE_COMPILES(
"
  #include <sys/time.h>
  #include <time.h>
  void main(void){}
"
TIME_WITH_SYS_TIME)

# Check for compiler `__func__' compatibility
CHECK_C_SOURCE_COMPILES("void main() {char *function_name = __func__;}" HAVE___FUNC__)
CHECK_C_SOURCE_COMPILES("void main() {char *function_name = __FUNCTION__;}" HAVE___FUNCTION__)

IF(HAVE___FUNC__)
  SET(__func__ __func__)
ELSEIF(HAVE___FUNCTION__)
  SET(__func__ __FUNCTION__)
ELSE()
  SET(__func__ "")
ENDIF()
# Check if `const' is supported by compiler
CHECK_C_SOURCE_COMPILES("void main() {const char *s = \"Test\";}" HAVE_CONST)
# Only set const to empty if it doesn't exist otherwise magick++ will not compile
IF(NOT HAVE_CONST)
  SET(const " ")
ENDIF()

# Check if <sys/types.h> doesn't define `gid_t'
IF(HAVE_SYS_TYPES_H)
  CHECK_SYMBOL_EXISTS(gid_t sys/types.h HAVE_GID_T)
  IF(NOT HAVE_GID_T)
    SET(gid_t int)
  ENDIF()
ENDIF()

# Check for the compiler inline compatible instruction
CHECK_C_SOURCE_COMPILES(
  "static inline int test (void) {return 0;}\nint main (void) {return test();}"
  HAVE_INLINE)

CHECK_C_SOURCE_COMPILES (
  "static __inline int test (void) {return 0;}\nint main (void) {return test();}"
  HAVE___INLINE)

CHECK_C_SOURCE_COMPILES (
  "static __inline__ int test (void) {return 0;}\nint main (void) {return test();}"
  HAVE___INLINE__)

IF(HAVE_INLINE)
	SET(inline inline)
ELSEIF(HAVE___INLINE)
	SET(inline __inline)
ELSEIF(HAVE___INLINE__)
	SET(inline __inline__)
ELSE()
	SET(inline "")
ENDIF()
# Check for the compiler restrict compatible instruction
CHECK_C_SOURCE_COMPILES(
  "int test (void *restrict x);\nint main (void) {return 0;}"
  HAVE_RESTRICT)

CHECK_C_SOURCE_COMPILES(
"typedef struct abc *d;\nint test (d __restrict x);\nint main (void) {return 0;}"
  HAVE___RESTRICT)

IF(HAVE___RESTRICT)
  SET(restrict __restrict)
ELSEIF(NOT HAVE_RESTRICT)
  SET(restrict " ")
ENDIF()

# Check if <sys/types.h> doesn't define `ssize_t'
IF(HAVE_SYS_TYPES_H)
  IF(SIZEOF_SSIZE_T)
    SET(HAVE_SSIZE_T 1)
  ELSE()
    CHECK_SYMBOL_EXISTS(ssize_t sys/types.h HAVE_SSIZE_T)
    IF(NOT HAVE_SSIZE_T)
      SET(ssize_t int)
	  # if we do this let's also do this
	  CHECK_TYPE_SIZE(int SIZEOF_INT)
	  SET(SIZEOF_SSIZE_T ${SIZEOF_INT})
	ENDIF()
  ENDIF()
ENDIF()

# Check if <sys/types.h> doesn't define `uid_t'
IF(HAVE_SYS_TYPES_H)
  CHECK_SYMBOL_EXISTS(uid_t sys/types.h HAVE_UID_T)
  IF(NOT HAVE_UID_T)
    SET(uid_t int)
  ENDIF()
ENDIF()

# Check if `vfork' is not working and define it as `fork'
IF(NOT HAVE_WORKING_VFORK)
  SET(vfork fork)
ENDIF()

# Check if `volatile' works
CHECK_CXX_SOURCE_COMPILES(
"
void main() { volatile int i = 1; }
"
HAVE_VOLATILE)

IF(HAVE_VOLATILE)
  SET(volatile volatile)
ELSE()
  SET(volatile "")
ENDIF()
