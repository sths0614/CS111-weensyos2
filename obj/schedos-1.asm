
obj/schedos-1:     file format elf32-i386


Disassembly of section .text:

00200000 <start>:
}



static inline void sys_set_priority(int priority){
	asm volatile("int %0 \n"
  200000:	b8 05 00 00 00       	mov    $0x5,%eax
  200005:	cd 32                	int    $0x32
		  "a" (priority)		//set to the eax register
		: "cc", "memory");
}

static inline void sys_set_share(int share){
	asm volatile("int %0 \n"
  200007:	b0 01                	mov    $0x1,%al
  200009:	cd 33                	int    $0x33
  20000b:	31 d2                	xor    %edx,%edx
		  "a" (share)
		: "cc", "memory");
}

static inline void sys_print(int c){
	asm volatile("int %0 \n"
  20000d:	66 b8 31 0c          	mov    $0xc31,%ax
  200011:	cd 34                	int    $0x34
{
	sys_set_priority(PRIORITY);
	sys_set_share(SHARE);

	int i;
	for (i = 0; i < RUNCOUNT; i++) {
  200013:	42                   	inc    %edx
  200014:	81 fa 40 01 00 00    	cmp    $0x140,%edx
  20001a:	75 f5                	jne    200011 <start+0x11>
	// the kernel can look up that register value to read the argument.
	// Here, the status is loaded into register %eax.
	// You can load other registers with similar syntax; specifically:
	//	"a" = %eax, "b" = %ebx, "c" = %ecx, "d" = %edx,
	//	"S" = %esi, "D" = %edi.
	asm volatile("int %0\n"
  20001c:	31 c0                	xor    %eax,%eax
  20001e:	cd 31                	int    $0x31
  200020:	eb fe                	jmp    200020 <start+0x20>
