Include Irvine32.inc


.data
PlaySoundA PROTO, pszSound:PTR BYTE, hmod:DWORD, fdwSound:DWORD
wav_file BYTE "projectsound.wav", 0
bill DWORD 0
info BYTE '			*************************************************************************',0dh,0ah
	 BYTE '			**                                                                     **',0dh,0ah
	 BYTE '			**  ***--- WELCOME TO STH LUXURY CAR RENTAL: DRIVE YOUR DREAMS ---***  **',0dh,0ah
	 BYTE '			**                                                                     **',0dh,0ah
	 BYTE '			*************************************************************************',0dh,0ah,0

info1 BYTE '				**** CARS BRANDS AVAILABLE **** ',0dh,0ah
BYTE ' ',0dh,0ah
BYTE ' ',0dh,0ah
BYTE '					1. TOYOTA ',0dh,0ah
BYTE '					2. LAMBORGHINI ',0dh,0ah
BYTE '					3. BUGATTI ',0dh,0ah
BYTE '					4. FERRARI ',0dh,0ah
BYTE '					5. NISSAN ',0dh,0ah
BYTE '					6. EXIT ',0dh,0ah,0

info2 BYTE ' 1. WANT TO RENT MORE CARS ? ',0dh,0ah
BYTE ' 2. CREATE INVOICE ',0dh,0ah
BYTE ' Enter Your Choice: ' ,0dh,0ah,0

info3 BYTE ' 1. WITH DRIVER = Rs 500/HOUR ',0dh,0ah
BYTE ' 2. WITHOUT DRIVER = NO ADDITIONAL CHARGES ',0dh,0ah
BYTE ' 3. Exit ',0dh,0ah,0

arr3 DWORD 500

info4 BYTE '					1. SUPRA MK4 = Rs 32000/DAY ',0dh,0ah
      BYTE '					2. SUPRA GR = Rs 25000/DAY ',0dh,0ah
      BYTE '					3. GR YARIS = Rs 35000/DAY ',0dh,0ah
      BYTE '					4. 2000 GT = Rs 48000/DAY ',0dh,0ah
      BYTE '						5. Exit ',0dh,0ah,0
toyotaCars BYTE 0, 1, 2, 3,4			;DUMMY DATA
arr4 DWORD 32000,25000,35000,48000

info5 BYTE '					1. HURACAN = 30000/DAY',0dh,0ah
      BYTE '					2. AVENTADOR = 70000/DAY',0dh,0ah
      BYTE '					3. URUS = 50000/DAY',0dh,0ah
      BYTE '					4. VENENO = 100000/DAY',0dh,0ah
      BYTE '						5. Exit ',0dh,0ah,0

lamborginiCars BYTE 0, 100, 20, 5,30
arr5 DWORD 30000,70000,50000,100000

info6 BYTE '					1. CHIRON = 15000/DAY',0dh,0ah
      BYTE '					2. VEYRON = 18000/DAY',0dh,0ah
      BYTE '					3. CHIRON SUPER SPORT = 37000/DAY',0dh,0ah
      BYTE '					4. VEYRON GRAND SPORT = 9000/DAY',0dh,0ah
      BYTE '			            5. Exit ',0dh,0ah,0

bugattiCars BYTE 0, 100, 20, 5,30
arr6 DWORD 15000,18000,37000,9000

info7 BYTE '					1. F8 SPYDER = 35000/DAY',0dh,0ah
      BYTE '					2. 812 SUPER FAST = 65000/DAY',0dh,0ah
      BYTE '					3. ROMA = 85000/DAY',0dh,0ah
      BYTE '					4. LA FERRARI = 25000/DAY',0dh,0ah
      BYTE '						 5. Exit ',0dh,0ah,0

ferrariCars BYTE 0, 100, 20, 5,30
arr7 DWORD 35000,65000,85000,25000

info8 BYTE '					1. SUNNY = 45000/DAY',0dh,0ah
      BYTE '					2. GTR = 100000/DAY',0dh,0ah
      BYTE '					3. SKYLINE = 110000/DAY',0dh,0ah
      BYTE '					4. 350Z = 32000/DAY',0dh,0ah
      BYTE '						5. Exit ',0dh,0ah,0
nissanCars BYTE 0, 100, 20, 5,30
arr8 DWORD 45000,100000,110000,32000

choice BYTE "Enter Car Model: ",0

spaces BYTE ' ',0

choice2 BYTE "Enter Your Choice: ",0

errorMsg BYTE ' PLEASE FOLLOW INSTRUCTIONS CORRECTLY AND SELECT AGAIN FROM THE GIVEN OPTIONS ',0dh,0ah,0
errorMsg2 BYTE ' CHOSEN CAR NOT AVAILABLE AT THE MOMENT, PLEASE SELECT AGAIN FROM OTHER OPTIONS ',0dh, 0ah, 0

Quantity BYTE ' Enter Number Of Days: ',0
Quantity1 BYTE ' Enter Number Of Hours: ',0
billing BYTE ' Total INVOICE: Rs ',0

name1 BYTE "			ENTER NAME: ",0
contact1 BYTE "			ENTER CONTACT NO: ",0
buff1 BYTE " Name: ",0
contact BYTE " Contact NO: ",0
arr BYTE 50 DUP(?)
arr1 BYTE 50 DUP(?)

.code
main proc
	INVOKE PlaySoundA, ADDR wav_file, NULL, 00020001h
	mov eax, blue + (lightGray * 16)	;FOREGROUND + BACKGROUND COLOUR
	call settextcolor
	call clrscr
	call Crlf
	call Crlf
	

	mov edx,OFFSET info
	call Writestring
	call crlf
	call crlf
	mov edx,offset contact1
	call writestring
	mov edx,offset arr1
	mov ecx,lengthof arr1
	call readstring				;INPUT OF THE CONTACT 

	mov edx,offset name1
	call writestring
	mov edx,offset arr
	mov ecx,lengthof arr
	call readstring				;INPUT OF THE NAME

	L1:
	call clrscr					;SECOND SCREEN
	call crlf
	call crlf
	mov edx,OFFSET info1		
	call Writestring
	call crlf
	call crlf
	mov edx,OFFSET spaces
	call Writestring
	mov edx,offset choice
	call writestring
	call ReadDec
	mov edx,OFFSET spaces
	call Writestring

	call crlf
	call Checkerror

	cmp eax,1
	je L3
	cmp eax,2
	je L2
	cmp eax,3
	je L4
	cmp eax,4
	je L5
	cmp eax,5
	je L6
	jmp last
	L2: call lamborgini
	jmp L7
	L3: call toyota
	jmp L7
	L4: call bugatti
	jmp L7
	L5: call ferrari
	jmp L7
	L6: call nissan
	L7: mov edx,OFFSET info2
	call Writestring
	mov edx,OFFSET spaces
	call Writestring
	call ReadDec
	call Checkerror1
	cmp eax,1 ; if user want to continue then jump to L1

	je L1
	last:
	call Crlf

	call crlf
	call clrscr
	call crlf
	call crlf

	mov edx,offset contact
	call writestring
	mov edx,offset arr1
	call writestring
	call crlf
	call crlf

	mov edx,offset buff1
	call writestring
	mov edx,offset arr
	call writestring
	call Crlf
	call crlf
	mov edx,OFFSET billing
	call Writestring
	mov eax,bill
	call WriteDec ; prints the bill
	call Crlf
	call Crlf
	call WaitMsg
	INVOKE PlaySoundA,NULL,NULL,0
	invoke ExitProcess,0
main endp

toyota PROC
	mov eax, white + (lightRed * 16)	;FOREGROUND + BACKGROUND COLOUR
	call settextcolor

	call clrscr
	call crlf 
	call crlf
	call crlf
	call crlf
	call crlf
	mov edx,OFFSET info4
	call Writestring
	mov edx,OFFSET spaces
	call Writestring

	mov edx,offset choice
	call writestring
	call ReadDec
	call Crlf
	call Crlf
	mov edx,OFFSET spaces
	call Writestring
	call crlf
	call Checkerror3
	
	_CHECKAVAILABILITY:
	push eax						;PASSING THE CHOICE AS PARAMETER
	push OFFSET toyotaCars			
	call CarsAvailability			;CHECKING CARS AVAILABILITY
	cmp ebx, 0
	jne _continue
	mov edx, OFFSET errorMsg2
	call msgbox
	call readdec
	jmp _CHECKAVAILABILITY

	_continue:
	cmp eax,1
	je L1
	cmp eax,2
	je L2
	cmp eax,3
	je L3
	cmp eax,4
	je L4
	cmp eax,5
	jmp last
	L1: mov edx,OFFSET Quantity
	call Writestring
	call ReadDec
	call Crlf

	mov ecx,eax
	mov ebx,[arr4]
	L11:
	add bill,ebx
	loop L11
	call driver
	jmp last
	L2: mov edx,OFFSET Quantity
	call Writestring
	call ReadDec
	call Crlf
	mov ecx,eax
	mov ebx,[arr4 + 4]
	L22:
	add bill,ebx
	loop L22
	call driver
	jmp last
	L3: mov edx,OFFSET Quantity
	call Writestring
	call ReadDec
	call Crlf
	mov ecx,eax
	mov ebx,[arr4 + 8]
	L33:
	add bill,ebx
	loop L33
	call driver
	jmp last
	L4: mov edx,OFFSET Quantity
	call Writestring

	call ReadDec
	call Crlf
	mov ecx,eax
	mov ebx,[arr4 + 12]
	L44:
	add bill,ebx
	loop L44
	call driver
	last:
	ret
toyota ENDP


lamborgini PROC
	mov eax, red + (yellow * 16)	;FOREGROUND + BACKGROUND COLOUR
	call settextcolor
	call clrscr
	call crlf 
	call crlf
	call crlf
	call crlf
	call crlf
	
	mov edx,OFFSET info5
	call Writestring
	mov edx,OFFSET spaces
	call Writestring

	mov edx,offset choice
	call writestring
	call ReadDec
	call Crlf

	mov edx,OFFSET spaces

	call Writestring
	call crlf
	call Checkerror3

	_CHECKAVAILABILITY:
	push eax						;PASSING THE CHOICE AS PARAMETER
	push OFFSET lamborginiCars			
	call CarsAvailability			;CHECKING CARS AVAILABILITY
	cmp ebx, 0
	jne _continue
	mov edx, OFFSET errorMsg2
	call msgbox
	call crlf
	call crlf
	call readdec
	jmp _CHECKAVAILABILITY

	_continue:

	cmp eax,1
	je L1

	cmp eax,2
	je L2
	cmp eax,3
	je L3
	cmp eax,4
	je L4
	cmp eax,5
	jmp last

	L1: mov edx,OFFSET Quantity
	call Writestring
	call ReadDec
	mov ecx,eax
	mov ebx,[arr5]
	L11:
	add bill,ebx
	loop L11
	call driver
	jmp last
	L2: mov edx,OFFSET Quantity
	call Writestring
	call ReadDec
	mov ecx,eax
	mov ebx,[arr5 + 4]
	L22:
	add bill,ebx
	loop L22
	call driver
	jmp last
	L3: mov edx,OFFSET Quantity
	call Writestring

	call ReadDec
	call Crlf
	mov ecx,eax
	mov ebx,[arr5 + 8]
	L33:
	add bill,ebx
	loop L33
	call driver
	jmp last
	L4: mov edx,OFFSET Quantity
	call Writestring
	call ReadDec
	call Crlf
	mov ecx,eax
	mov ebx,[arr5 + 12]
	L44:
	add bill,ebx
	loop L44
	call driver
	last:

	ret
lamborgini ENDP

bugatti PROC
	mov eax, white + (green * 16)	;FOREGROUND + BACKGROUND COLOUR
	call settextcolor
	call clrscr
	call crlf 
	call crlf
	call crlf
	call crlf
	call crlf
	
	mov edx,OFFSET info6
	call Writestring
	mov edx,OFFSET spaces
	call Writestring

	mov edx,offset choice
	call writestring
	call ReadDec
	call Crlf

	call Crlf

	mov edx,OFFSET spaces

	call Writestring
	call crlf
	call Checkerror3

	_CHECKAVAILABILITY:
	push eax						;PASSING THE CHOICE AS PARAMETER
	push OFFSET bugattiCars			
	call CarsAvailability			;CHECKING CARS AVAILABILITY
	cmp ebx, 0
	jne _continue
	mov edx, OFFSET errorMsg2
	call msgbox
	call crlf
	call crlf
	call readdec
	jmp _CHECKAVAILABILITY

	_continue:
	cmp eax,1
	je L1
	cmp eax,2
	je L2
	cmp eax,3
	je L3
	cmp eax,4
	je L4
	cmp eax,5
	jmp last
	L1: mov edx,OFFSET Quantity
	call Writestring
	call ReadDec
	call Crlf
	mov ecx,eax
	mov ebx,[arr6]
	L11:
	add bill,ebx
	loop L11
	call driver
	jmp last
	L2: mov edx,OFFSET Quantity

	call Writestring
	call ReadDec
	call Crlf
	mov ecx,eax
	mov ebx,[arr6 + 4]
	L22:
	add bill,ebx
	loop L22
	call driver
	jmp last
	L3: mov edx,OFFSET Quantity
	call Writestring
	call ReadDec
	call Crlf
	mov ecx,eax
	mov ebx,[arr6 + 8]
	L33:
	add bill,ebx
	loop L33
	call driver
	jmp last
	L4: mov edx,OFFSET Quantity
	call Writestring
	call ReadDec
	call Crlf
	mov ecx,eax
	mov ebx,[arr6 + 12]
	L44:
	add bill,ebx
	loop L44
	call driver

	last:
	ret
bugatti ENDP

ferrari PROC
	mov eax, white + (red * 16)	;FOREGROUND + BACKGROUND COLOUR
	call settextcolor
	call clrscr
	call crlf 
	call crlf
	call crlf
	call crlf
	call crlf
	
	mov edx,OFFSET info7
	call Writestring
	mov edx,OFFSET spaces
	call Writestring

	mov edx,offset choice
	call writestring
	call ReadDec
	call Crlf

	call Crlf

	mov edx,OFFSET spaces

	call Writestring
	call crlf
	call Checkerror3
	_CHECKAVAILABILITY:
	push eax						;PASSING THE CHOICE AS PARAMETER
	push OFFSET ferrariCars			
	call CarsAvailability			;CHECKING CARS AVAILABILITY
	cmp ebx, 0
	jne _continue
	mov edx, OFFSET errorMsg2
	call msgbox
	call crlf
	call crlf
	call readdec
	jmp _CHECKAVAILABILITY

	_continue:

	cmp eax,1
	je L1
	cmp eax,2
	je L2
	cmp eax,3
	je L3
	cmp eax,4
	je L4
	cmp eax,5
	jmp last
	L1: mov edx,OFFSET Quantity

	call Writestring
	call ReadDec
	call Crlf
	mov ecx,eax
	mov ebx,[arr7]
	L11:
	add bill,ebx
	loop L11
	call driver
	jmp last
	L2: mov edx,OFFSET Quantity
	call Writestring
	call ReadDec
	call Crlf
	mov ecx,eax
	mov ebx,[arr7 + 4]
	L22:
	add bill,ebx
	loop L22
	call driver
	jmp last
	L3: mov edx,OFFSET Quantity
	call Writestring
	call ReadDec
	call Crlf
	mov ecx,eax
	mov ebx,[arr7 + 8]
	L33:
	add bill,ebx
	loop L33
	call driver

	jmp last
	L4: mov edx,OFFSET Quantity
	call Writestring
	call ReadDec
	call Crlf
	mov ecx,eax
	mov ebx,[arr7 + 12]
	L44:
	add bill,ebx
	loop L44
	call driver
	last:
	ret
ferrari ENDP

nissan PROC
	mov eax, magenta + (cyan * 16)	;FOREGROUND + BACKGROUND COLOUR
	call settextcolor

	call clrscr
	call crlf
	call crlf 
	call crlf
	call crlf
	call crlf
	mov edx,OFFSET info8
	call Writestring
	mov edx,OFFSET spaces
	call Writestring
	call ReadDec
	call Crlf

	call Crlf

	mov edx,OFFSET spaces

	call Writestring
	call crlf
	call Checkerror3
	_CHECKAVAILABILITY:
	push eax						;PASSING THE CHOICE AS PARAMETER
	push OFFSET nissanCars			
	call CarsAvailability			;CHECKING CARS AVAILABILITY
	cmp ebx, 0
	jne _continue
	mov edx, OFFSET errorMsg2
	call msgbox
	call crlf
	call crlf
	call readdec
	jmp _CHECKAVAILABILITY

	_continue:

	cmp eax,1
	je L1

	cmp eax,2
	je L2
	cmp eax,3
	je L3
	cmp eax,4
	je L4
	cmp eax,5
	jmp last
	L1: mov edx,OFFSET Quantity
	call Writestring
	call ReadDec
	call Crlf
	mov ecx,eax
	mov ebx,[arr8]
	L11:
	add bill,ebx
	loop L11
	call driver
	jmp last
	L2: mov edx,OFFSET Quantity
	call Writestring
	call ReadDec
	call Crlf
	mov ecx,eax
	mov ebx,[arr8 + 4]
	L22:
	add bill,ebx
	loop L22
	call driver
	jmp last
	L3: mov edx,OFFSET Quantity

	call Writestring
	call ReadDec
	mov ecx,eax
	call Crlf
	mov ebx,[arr8 + 8]
	L33:
	add bill,ebx
	loop L33
	call driver
	jmp last
	L4: mov edx,OFFSET Quantity
	call Writestring
	call ReadDec
	call Crlf
	mov ecx,eax
	mov ebx,[arr8 + 12]
	L44:
	add bill,ebx
	loop L44
	call driver

	last:
	ret
nissan ENDP

driver PROC
	call clrscr
	call crlf
	call crlf
	mov edx,OFFSET info3
	call Writestring
	mov edx,OFFSET spaces
	call Writestring
	mov edx,OFFSET choice2
	call Writestring
	call ReadDec
	call Checkerror2
	cmp eax,1
	je L1
	cmp eax,2
	je last
	L1:
	mov ebx,[arr3]
	mov edx,OFFSET Quantity1

	call Writestring
	call ReadDec
	call Crlf
	mov ecx,eax
	L11:
	add bill,ebx
	loop L11

	last:
	call crlf
	ret
driver ENDP

Checkerror PROC
	L1:
	cmp eax,1
	jl L2
	cmp eax,6

	jg L2
	jmp last

	L2:
	mov edx, OFFSET errorMsg
	call msgbox
	call ReadDec
	jmp L1
	last:
	ret
Checkerror ENDP

Checkerror1 PROC
	L1:
	cmp eax,1
	jl L2
	cmp eax,2
	jg L2
	jmp last

	L2:
	mov edx, OFFSET errorMsg
	call msgbox
	call ReadDec
	jmp L1
	last:
	ret
Checkerror1 ENDP

Checkerror2 PROC
	L1:
	cmp eax,1
	jl L2
	cmp eax,3
	jg L2
	jmp last

	L2:
	mov edx, OFFSET errorMsg
	call msgbox
	call ReadDec
	jmp L1
	last:
	ret
Checkerror2 ENDP

Checkerror3 PROC
	L1:
	cmp eax,1
	jl L2
	cmp eax,5
	jg L2
	jmp last

	L2:
	mov edx, OFFSET errorMsg
	call msgbox
	call ReadDec
	jmp L1

	last:
	ret
Checkerror3 ENDP

CarsAvailability PROC, pArray:PTR BYTE, index:DWORD 		 
	push eax
	push esi
	mov esi, pArray
	mov eax, index
	add esi, eax
	cmp BYTE PTR[esi], 0
	je _returnzero
	mov ebx, 1
	sub BYTE PTR[esi], 1
	jmp _quit
	_returnzero:
	mov ebx, 0
	_quit:
pop esi
pop eax
ret
CarsAvailability ENDP

end main
