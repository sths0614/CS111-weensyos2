
obj/schedos-4:     file format elf32-i386


Disassembly of section .text:

00500000 <start>:
}



static inline void sys_set_priority(int priority){
	asm volatile("int %0 \n"
  500000:	b8 01 00 00 00       	mov    $0x1,%eax
  500005:	cd 32                	int    $0x32
		  "a" (priority)		//set to the eax register
		: "cc", "memory");
}

static inline void sys_set_share(int share){
	asm volatile("int %0 \n"
  500007:	b0 04                	mov    $0x4,%al
  500009:	cd 33                	int    $0x33
  50000b:	31 d2                	xor    %edx,%edx
		  "a" (share)
		: "cc", "memory");
}

static inline void sys_print(int c){
	asm volatile("int %0 \n"
  50000d:	66 b8 34 0e          	mov    $0xe34,%ax
  500011:	cd 34                	int    $0x34
{
	sys_set_priority(PRIORITY);
	sys_set_share(SHARE);

	int i;
	for (i = 0; i < RUNCOUNT; i++) {
  500013:	42                   	inc    %edx
  500014:	81 fa 40 01 00 00    	cmp    $0x140,%edx
  50001a:	75 f5                	jne    500011 <start+0x11>
	// the kernel can look up that register value to read the argument.
	// Here, the status is loaded into register %eax.
	// You can load other registers with similar syntax; specifically:
	//	"a" = %eax, "b" = %ebx, "c" = %ecx, "d" = %edx,
	//	"S" = %esi, "D" = %edi.
	asm volatile("int %0\n"
  50001c:	31 c0                	xor    %eax,%eax
  50001e:	cd 31                	int    $0x31
  500020:	eb fe                	jmp    500020 <start+0x20>
