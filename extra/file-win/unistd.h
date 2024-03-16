#ifndef _UNISTD_H
#define _UNISTD_H 1

/* This file intended to serve as a drop-in replacement for
 *  unistd.h on Windows.
 *  Please add functionality as neeeded.
 *  Original file from: http://stackoverflow.com/a/826027
 */

#include <stdlib.h>
#if HAVE_IO_H
#include <io.h>
#endif
// #include <getopt.h> /* getopt at: https://gist.github.com/bikerm16/1b75e2dd20d839dcea58 */
#if HAVE_PROCESS_H
#include <process.h> /* for getpid() and the exec..() family */
#endif
#if HAVE_DIRECT_H
#include <direct.h>  /* for _getcwd() and _chdir() */
#endif

#define srandom srand
#define random rand

/* Values for the second argument to access.
   These may be OR'd together.  */
#define R_OK 4    /* Test for read permission.  */
#define W_OK 2    /* Test for write permission.  */
#define X_OK R_OK /* execute permission - unsupported in Windows, \
                     use R_OK instead. */
#define F_OK 0    /* Test for existence.  */

#define access _access
#define dup2 _dup2
#define execve _execve
#define ftruncate _chsize
#define unlink _unlink
#define fileno _fileno
#define getcwd _getcwd
#define chdir _chdir
#define isatty _isatty
#define lseek _lseek
#define pipe(fds) _pipe(fds, 1024, _O_BINARY)
/* read, write, and close are NOT being #defined here,
 * because while there are file handle specific versions for Windows,
 * they probably don't work for sockets.
 * You need to look at your app and consider whether
 * to call e.g. closesocket().
 */

// #define ssize_t int

#define STDIN_FILENO 0
#define STDOUT_FILENO 1
#define STDERR_FILENO 2
/* should be in some equivalent to <sys/types.h> */
// typedef __int8            int8_t;
// typedef __int16           int16_t;
// typedef __int32           int32_t;
// typedef __int64           int64_t;
// typedef unsigned __int8   uint8_t;
// typedef unsigned __int16  uint16_t;
// typedef unsigned __int32  uint32_t;
// typedef unsigned __int64  uint64_t;

/* Block device */
#if !defined(S_IFBLK)
#define S_IFBLK 0
#endif

/* Pipe */
#if !defined(S_IFIFO)
#define S_IFIFO _S_IFIFO
#endif

typedef unsigned int mode_t;

#endif /* unistd.h  */
