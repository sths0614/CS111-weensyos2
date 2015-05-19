
obj/schedos-3:     file format elf32-i386


Disassembly of section .text:

00400000 <start>:
}



static inline void sys_set_priority(int priority){
	asm volatile("int %0 \n"
  400000:	b8 06 00 00 00       	mov    $0x6,%eax
  400005:	cd 32                	int    $0x32
		  "a" (priority)		//set to the eax register
		: "cc", "memory");
}

static inline void sys_set_share(int share){
	asm volatile("int %0 \n"
  400007:	b0 01                	mov    $0x1,%al
  400009:	cd 33                	int    $0x33
  40000b:	31 d2                	xor    %edx,%edx
		  "a" (share)
		: "cc", "memory");
}

static inline void sys_print(int c){
	asm volatile("int %0 \n"
  40000d:	66 b8 33 09          	mov    $0x933,%ax
  400011:	cd 34                	int    $0x34
{
	sys_set_priority(PRIORITY);
	sys_set_share(SHARE);

	int i;
	for (i = 0; i < RUNCOUNT; i++) {
  400013:	42                   	inc    %edx
  400014:	81 fa 40 01 00 00    	cmp    $0x140,%edx
  40001a:	75 f5                	jne    400011 <start+0x11>
	// the kernel can look up that register value to read the argument.
	// Here, the status is loaded into register %eax.
	// You can load other registers with similar syntax; specifically:
	//	"a" = %eax, "b" = %ebx, "c" = %ecx, "d" = %edx,
	//	"S" = %esi, "D" = %edi.
	asm volatile("int %0\n"
  40001c:	31 c0                	xor    %eax,%eax
  40001e:	cd 31                	int    $0x31
  400020:	eb fe                	jmp    400020 <start+0x20>
