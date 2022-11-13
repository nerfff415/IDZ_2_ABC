	.intel_syntax noprefix
	.text
	.globl	ToLower
	.type	ToLower, @function
ToLower:
	push	rbp                    # стандартный пролог
	mov	rbp, rsp
	mov	QWORD PTR -8[rbp], rdi     # *str
	jmp	.L2
.L4:
	mov	rax, QWORD PTR -8[rbp]     
	movzx	eax, BYTE PTR [rax]	   # if (*str >= 65 && *str <= 90)
	cmp	al, 64                     
	jle	.L3                        
	mov	rax, QWORD PTR -8[rbp]      
	movzx	eax, BYTE PTR [rax]    
	cmp	al, 90                     
	jg	.L3                        
	mov	rax, QWORD PTR -8[rbp]	   # *str = *str + 32;
	movzx	eax, BYTE PTR [rax]    
	add	eax, 32                    
	mov	edx, eax                   
	mov	rax, QWORD PTR -8[rbp]     
	mov	BYTE PTR [rax], dl         
.L3:
	add	QWORD PTR -8[rbp], 1       # str++;
.L2:
	mov	rax, QWORD PTR -8[rbp]
	movzx	eax, BYTE PTR [rax]
	test	al, al
	jne	.L4                        # while (*str != '\0')
	nop
	nop
	pop	rbp						   # стандартный эпилог
	ret
	.size	ToLower, .-ToLower
	.globl	fcount_vowels
	.type	fcount_vowels, @function
fcount_vowels:
	push	rbp 
	mov	rbp, rsp                   # стандартный пролог
	mov	QWORD PTR -40[rbp], rdi    # *str
	mov	DWORD PTR -44[rbp], esi    # n
	mov	DWORD PTR -18[rbp], 1769303905
	mov	WORD PTR -14[rbp], 31077   # char vowels[6] = {'a', 'o', 'u', 'i', 'e', 'y'};
	mov	DWORD PTR -4[rbp], 0	   # int count_vowels = 0;
	mov	DWORD PTR -8[rbp], 0
	jmp	.L6                        # for (int j = 0; j < n; j++)
.L10:
	mov	DWORD PTR -12[rbp], 0      # for (int i = 0; i < 6; i++)
	jmp	.L7
.L9:
	mov	eax, DWORD PTR -8[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -40[rbp]
	add	rax, rdx
	movzx	edx, BYTE PTR [rax]
	mov	eax, DWORD PTR -12[rbp]
	cdqe
	movzx	eax, BYTE PTR -18[rbp+rax]
	cmp	dl, al                     # if (str[j] == vowels[i])
	jne	.L8						   
	add	DWORD PTR -4[rbp], 1       # count_vowels++;
.L8:
	add	DWORD PTR -12[rbp], 1
.L7:
	cmp	DWORD PTR -12[rbp], 5
	jle	.L9
	add	DWORD PTR -8[rbp], 1
.L6:
	mov	eax, DWORD PTR -8[rbp]
	cmp	eax, DWORD PTR -44[rbp]
	jl	.L10
	mov	eax, DWORD PTR -4[rbp]     # return count_vowels;
	pop	rbp                        # стандартный эпилог
	ret
	.size	fcount_vowels, .-fcount_vowels
	.globl	fcount_consonants
	.type	fcount_consonants, @function
fcount_consonants:
	push	rbp
	mov	rbp, rsp
	mov	QWORD PTR -40[rbp], rdi    # *str
	mov	DWORD PTR -44[rbp], esi    # n
	movabs	rax, 7378149016366905201
	movabs	rdx, 7167613413037336679
	mov	QWORD PTR -32[rbp], rax    # char consonants[20] = {'q', 'w', 'r', 't', 'p', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'z', 'x', 'c', 'v', 'b', 'n', 'm'};
	mov	QWORD PTR -24[rbp], rdx
	mov	DWORD PTR -16[rbp], 1835950710 
	mov	DWORD PTR -4[rbp], 0       # int count_consonants = 0;
	mov	DWORD PTR -8[rbp], 0       # for (int j = 0; j < n; j++)
	jmp	.L13
.L17:
	mov	DWORD PTR -12[rbp], 0      # for (int i = 0; i < 20; i++)
	jmp	.L14
.L16:
	mov	eax, DWORD PTR -8[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -40[rbp]
	add	rax, rdx
	movzx	edx, BYTE PTR [rax]
	mov	eax, DWORD PTR -12[rbp]
	cdqe
	movzx	eax, BYTE PTR -32[rbp+rax]
	cmp	dl, al                     # if (str[j] == consonants[i])
	jne	.L15
	add	DWORD PTR -4[rbp], 1       # count_consonants++;
.L15:
	add	DWORD PTR -12[rbp], 1
.L14:
	cmp	DWORD PTR -12[rbp], 19
	jle	.L16
	add	DWORD PTR -8[rbp], 1
.L13:
	mov	eax, DWORD PTR -8[rbp]
	cmp	eax, DWORD PTR -44[rbp]
	jl	.L17
	mov	eax, DWORD PTR -4[rbp]    # return count_consonants;
	pop	rbp
	ret
	.size	fcount_consonants, .-fcount_consonants
	.section	.rodata
.LC0:
	.string	"\320\222\320\262\320\265\320\264\320\270\321\202\320\265 \321\201\321\202\321\200\320\276\320\272\321\203: " # Введите строку
	.align 8
.LC1:
	.string	"\320\232\320\276\320\273\320\270\321\207\320\265\321\201\321\202\320\262\320\276 \320\263\320\273\320\260\321\201\320\275\321\213\321\205 \320\261\321\203\320\272\320\262 \320\262 \321\201\321\202\321\200\320\276\320\272\320\265: %d \n" # "Количество гласных букв в строке: %d \n"
	.align 8
.LC2:
	.string	"\320\232\320\276\320\273\320\270\321\207\320\265\321\201\321\202\320\262\320\276 \321\201\320\276\320\263\320\273\320\260\321\201\320\275\321\213\321\205 \320\261\321\203\320\272\320\262 \320\262 \321\201\321\202\321\200\320\276\320\272\320\265: %d \n" # "Количество согласных букв в строке: %d \n"
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp                   # стандартный пролог
	mov	rbp, rsp 
	sub	rsp, 4096
	or	QWORD PTR [rsp], 0
	sub	rsp, 4096
	or	QWORD PTR [rsp], 0
	sub	rsp, 1824
	mov	DWORD PTR -4[rbp], 0
	lea	rdi, .LC0[rip]
	mov	eax, 0
	call	printf@PLT            # Введите строчку:
.L20:
	mov	rax, QWORD PTR stdin[rip]
	mov	rdi, rax
	call	fgetc@PLT             # fgets(stdin)
	mov	BYTE PTR -5[rbp], al      # tmp = fgets(stdin)
	mov	eax, DWORD PTR -4[rbp]
	lea	edx, 1[rax]
	mov	DWORD PTR -4[rbp], edx 
	cdqe
	movzx	edx, BYTE PTR -5[rbp]
	mov	BYTE PTR -10016[rbp+rax], dl # phrase[i++] = tmp;
	cmp	BYTE PTR -5[rbp], 10
	jne	.L20                      # do { ... } while(tmp != '!n');
	mov	eax, DWORD PTR -4[rbp]
	sub	eax, 1
	cdqe 
	mov	BYTE PTR -10016[rbp+rax], 0 # phrase[i - 1] = '\0';
	lea	rax, -10016[rbp]
	mov	rdi, rax                  # rdi - *str
	call	ToLower				  # ToLower(phrase);

	mov	eax, DWORD PTR -4[rbp]
	lea	edx, -1[rax]
	lea	rax, -10016[rbp]
	mov	esi, edx                  # esi - n
	mov	rdi, rax                  # rdi - *str
	call	fcount_vowels         # fcount_vowels(phrase, i - 1);

	mov	DWORD PTR -12[rbp], eax
	mov	eax, DWORD PTR -4[rbp]
	lea	edx, -1[rax]
	lea	rax, -10016[rbp]
	mov	esi, edx                  # esi - n
	mov	rdi, rax                  # rdi - *str
	call	fcount_consonants     # fcount_consonants(phrase, i - 1);

	mov	DWORD PTR -16[rbp], eax
	mov	eax, DWORD PTR -12[rbp]
	mov	esi, eax
	lea	rdi, .LC1[rip]
	mov	eax, 0
	call	printf@PLT            # printf("Количество гласных букв в строке: %d \n", tmp1);

	mov	eax, DWORD PTR -16[rbp]
	mov	esi, eax
	lea	rdi, .LC2[rip]
	mov	eax, 0 
	call	printf@PLT            # printf("Количество coгласных букв в строке: %d \n", tmp1);

	mov	eax, 0
	leave
	ret
