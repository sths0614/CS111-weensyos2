
obj/schedos-2:     file format elf32-i386


Disassembly of section .text:

00300000 <start>:
}



static inline void sys_set_priority(int priority){
	asm volatile("int %0 \n"
  300000:	b8 01 00 00 00       	mov    $0x1,%eax
  300005:	cd 32                	int    $0x32
		  "a" (priority)		//set to the eax register
		: "cc", "memory");
}

static inline void sys_set_share(int share){
	asm volatile("int %0 \n"
  300007:	cd 33                	int    $0x33
  300009:	31 d2                	xor    %edx,%edx
		  "a" (share)
		: "cc", "memory");
}

static inline void sys_print(int c){
	asm volatile("int %0 \n"
  30000b:	66 b8 32 0a          	mov    $0xa32,%ax
  30000f:	cd 34                	int    $0x34
{
	sys_set_priority(PRIORITY);
	sys_set_share(SHARE);

	int i;
	for (i = 0; i < RUNCOUNT; i++) {
  300011:	42                   	inc    %edx
  300012:	81 fa 40 01 00 00    	cmp    $0x140,%edx
  300018:	75 f5                	jne    30000f <start+0xf>
	// the kernel can look up that register value to read the argument.
	// Here, the status is loaded into register %eax.
	// You can load other registers with similar syntax; specifically:
	//	"a" = %eax, "b" = %ebx, "c" = %ecx, "d" = %edx,
	//	"S" = %esi, "D" = %edi.
	asm volatile("int %0\n"
  30001a:	31 c0                	xor    %eax,%eax
  30001c:	cd 31                	int    $0x31
  30001e:	eb fe                	jmp    30001e <start+0x1e>
