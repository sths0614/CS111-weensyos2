#include "schedos-app.h"
#include "x86sync.h"

/*****************************************************************************
 * schedos-1
 *
 *   This tiny application prints red "1"s to the console.
 *   It yields the CPU to the kernel after each "1" using the sys_yield()
 *   system call.  This lets the kernel (schedos-kern.c) pick another
 *   application to run, if it wants.
 *
 *   The other schedos-* processes simply #include this file after defining
 *   PRINTCHAR appropriately.
 *
 *****************************************************************************/

#ifndef PRINTCHAR
#define PRINTCHAR	('1' | 0x0C00)
#endif

#ifndef PRIORITY
#define PRIORITY 5
#endif

#ifndef SHARE
#define SHARE 1
#endif

#ifndef SYNC_METHOD
#define SYNC_METHOD 1
#endif

void
start(void)
{
	sys_set_priority(PRIORITY);
	sys_set_share(SHARE);
	sys_get_ticket();

	int i;
	for (i = 0; i < RUNCOUNT; i++) {

		if(SYNC_METHOD == 1){
			// Write characters to the console, yielding after each one.
			// *cursorpos++ = PRINTCHAR;
			// sys_yield();
			while(atomic_swap(&lock, 1) != 0){ //will only return 0 when the lock is free
				continue;
			}
			*cursorpos++ = PRINTCHAR;
			atomic_swap(&lock, 0);
			sys_yield();
		}
		else if (SYNC_METHOD == 2){
			sys_print(PRINTCHAR);
		}
	}

	sys_exit(0);
}
