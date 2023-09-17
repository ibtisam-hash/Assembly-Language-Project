.data
msg1: .asciiz"\nEnter your E-mail : "
msg2: .asciiz"\nEnter your Password : "
msg3: .asciiz"\nIncorrect E-mail or Password, try again.\n"
msg4: .asciiz"\n*********************************************"
msg5: .asciiz"\n*        Flight Management System           *"
msg6: .asciiz"\n*********************************************"
msg7: .asciiz"\nPlease choose an option from above : "
msg8: .asciiz"\n1. Destinations and Airlines."
msg9: .asciiz"\n2. Ticket Reservation."
msg10: .asciiz"\n3. Billing."
msg11: .asciiz"\n4. View Details."
msg12: .asciiz"\n5. Exit."
msg13: .asciiz"\n[Error] : Please enter a valid choice.\n"
msg14: .asciiz"\n  *      Destinations and Airlines       *"
msg15: .asciiz"\n  ****************************************"
msg16: .asciiz"\n\nDomestic flights available are : \n"
msg17: .asciiz"\n1. Karachi to Lahore  [PIA]  Ticket Cost: Rs25000 "
msg18: .asciiz"\n2. Quetta to Peshawar  [AIRSIAL]  Ticket Cost: Rs18000 "
msg19: .asciiz"\n3. Islamabad to Karachi  [SERENE]  Ticket Cost: Rs30000 "
msg20: .asciiz"\n\nInternational flights available are : \n"
msg21: .asciiz"\n4. Karachi to Istanbul  [TURKISH AIRLINES]  Ticket Cost: Rs65000 "
msg22: .asciiz"\n5. Lahore to Abu Dhabi  [EMIRATES]  Ticket Cost: Rs45000 "
msg23: .asciiz"\n6. Islamabad to Sydney  [QATAR AIRWAYS]  Ticket Cost: Rs100000 \n"
msg24: .asciiz"\nPress B to go back to main page. "
msg25: .asciiz"\n\n[Error] Only Press B to go back to main page. \n"
msg26: .asciiz"\n     *       Ticket Reservation      *"
msg27: .asciiz"\n     *********************************"
msg28: .asciiz"\n\nEnter Your name : "
msg29: .asciiz"\nEnter Your Email : "
msg30: .asciiz"\nSelect Your Destination : "
msg31: .asciiz"\n\nThank You For your reservation :) \n"
msg32: .asciiz"\n          *       Billing      *"
msg33: .asciiz"\n          **********************"
msg34: .asciiz"\n\nYour total amount of "
msg35: .asciiz"\n\nHow would you like to pay : \n1.Credit Card\n2.Cash\n"
msg36: .asciiz"\nEnter your credit card number : "
msg37: .asciiz"\nEnter your credit card PIN : "
msg38: .asciiz"\nAmount of Rs "
msg39: .asciiz" is deducted from your account."
msg40: .asciiz"\n\nYour tickets are now confirmed. :)"
msg41: .asciiz"\n\nPlease pay at any booth of the airline you chose."
msg42: .asciiz"\n\nYour tickets will be confirmed after payment. :)"
msg43: .asciiz"\n\nPress B to go back to main page. "
msg44: .asciiz" tickets will be : "
msg45: .asciiz"\n\nPlease buy tickets first. "
msg46: .asciiz"\n\nThank You for visiting us. :) \n"
enteredpassword: .space 30
enteredemail: .space 30
realpassword: .asciiz"abc123"
realemail: .asciiz"fahad1"
null: .asciiz""
back: .space 5
Name: .space 30
A1: .asciiz" Karachi to Lahore  [PIA] Cost: 25000"
B1: .asciiz" Quetta to Peshawar  [AIRSIAL] Cost: 18000"
C1: .asciiz" Islamabad to Karachi  [SERENE] Cost: 30000"
D1: .asciiz" Karachi to Istanbul  [TURKISH AIRLINES] Cost: 65000"
E1: .asciiz" Lahore to Abu Dhabi  [EMIRATES] Cost: 45000"
F1: .asciiz" Islamabad to Sydney  [QATAR AIRWAYS] Cost: 100000"
Email: .space 30
Nextline: .asciiz"\n"
filename: .asciiz "D:/fahadairline.txt"
back2: .space 5
.text

Login:

la $t0, realemail
la $t1, realpassword
li $t6,0
li $t7,6
li $t8,0

li $v0,4
la $a0, msg1
syscall
la $a0 , enteredemail
li $a1 , 30
li $v0 , 8
syscall
li $v0,4
la $a0, msg2
syscall
la $a0 , enteredpassword
li $a1 , 30
li $v0 , 8
syscall
la $t2, enteredemail
la $t3, enteredpassword
j emailLoop
emailLoop:
beq $t6,$t7,TemporaryLoop
lb $t4,($t0)
lb $t5,($t2)
bne $t4,$t5,incorrect
add $t0,$t0,1
add $t2,$t2,1
add $t6,$t6,1
j emailLoop
TemporaryLoop:
li $t6,0
la $t0, realemail
la $t1, realpassword
la $t2, enteredemail
la $t3, enteredpassword
j PasswordLoop
PasswordLoop:
beq $t6,$t7,MainPage
lb $t4,($t1)
lb $t5,($t3)
bne $t4,$t5,incorrect
add $t1,$t1,1
add $t3,$t3,1
add $t6,$t6,1
j PasswordLoop
incorrect:
li $v0,4
la $a0, msg3
syscall
j Login
MainPage:
li $v0,4
la $a0, msg4
syscall
li $v0,4
la $a0, msg5
syscall
li $v0,4
la $a0, msg6
syscall
li $v0,4
la $a0, msg8
syscall
li $v0,4
la $a0, msg9
syscall
li $v0,4
la $a0, msg10
syscall
li $v0,4
la $a0, msg11
syscall
li $v0,4
la $a0, msg12
syscall
li $v0,4
la $a0, msg7
syscall
li $v0,5
syscall
move $t0,$v0
beq $t0,1,Destination
beq $t0,2,Ticket
beq $t0,3,Billing
beq $t0,4,View
beq $t0,5,Exit
li $v0,4
la $a0, msg13
syscall
j MainPage
Destination:
li $v0,4
la $a0, msg4
syscall
li $v0,4
la $a0, msg5
syscall
li $v0,4
la $a0, msg6
syscall
li $v0,4
la $a0, msg14
syscall
li $v0,4
la $a0, msg15
syscall
li $v0,4
la $a0, msg16
syscall
li $v0,4
la $a0, msg17
syscall
li $v0,4
la $a0, msg18
syscall
li $v0,4
la $a0, msg19
syscall
li $v0,4
la $a0, msg20
syscall
li $v0,4
la $a0, msg21
syscall
li $v0,4
la $a0, msg22
syscall
li $v0,4
la $a0, msg23
syscall
li $v0,4
la $a0, msg24
syscall
la $a0 , back
li $a1 , 5
li $v0 , 8
syscall
lb $t1, back
beq $t1,'b',MainPage
beq $t1,'B',MainPage
li $v0,4
la $a0, msg25
syscall
j Destination
Ticket:
add $t8,$t8,1
li $v0,4
la $a0, msg4
syscall
li $v0,4
la $a0, msg5
syscall
li $v0,4
la $a0, msg6
syscall
li $v0,4
la $a0, msg26
syscall
li $v0,4
la $a0, msg27
syscall
li $v0,4
la $a0, msg28
syscall
la $a0 , Name
li $a1 , 30
li $v0 , 8
syscall
li $v0,4
la $a0, msg29
syscall
la $a0 , Email
li $a1 , 30
li $v0 , 8
syscall
li $v0,4
la $a0, msg30
syscall
li $v0,4
la $a0, msg17
syscall
li $v0,4
la $a0, msg18
syscall
li $v0,4
la $a0, msg19
syscall
li $v0,4
la $a0, msg21
syscall
li $v0,4
la $a0, msg22
syscall
li $v0,4
la $a0, msg23
syscall
li $v0,5
syscall
move $s1,$v0
beq $s1,1,A
beq $s1,2,B
beq $s1,3,C
beq $s1,4,D
beq $s1,5,E
beq $s1,6,F
A:
li $s2,25000
subi $sp, $sp, 4
sw $s2, 0($sp)

j write1
B:
li $s2,18000
subi $sp, $sp, 4
sw $s2, 0($sp)

j write2
C:
li $s2,30000
subi $sp, $sp, 4
sw $s2, 0($sp)

j write3
D:
li $s2,65000
subi $sp, $sp, 4
sw $s2, 0($sp)

j write4
E:
li $s2,45000
subi $sp, $sp, 4
sw $s2, 0($sp)

j write5
F:
li $s2,100000
subi $sp, $sp, 4
sw $s2, 0($sp)

j write6
write1:
li $v0,4
la $a0, msg31
syscall

li $v0, 13 # open file
la $a0, filename # loading file name
li $a1, 1 # mode of writing in file 
syscall
move $s0, $v0 # file descriptor

li $v0, 15 # write in file
move $a0, $s0 #file descriptor
la $a1, Name # word u want to print
li $a2, 20 # size of word
syscall

li $v0, 15 # write in file
move $a0, $s0 #file descriptor
la $a1, Email # word u want to print
li $a2, 20 # size of word
syscall

li $v0, 15 # write in file
move $a0, $s0 #file descriptor
la $a1, A1 # word u want to print
li $a2, 50 # size of word
syscall

li $v0, 16 # close file
move $a0, $s0 # file descriptor
syscall

j MainPage
write2:
li $v0,4
la $a0, msg31
syscall
li $v0, 13 # open file
la $a0, filename # loading file name
li $a1, 1 # mode of writing in file 
syscall
move $s0, $v0 # file descriptor

li $v0, 15 # write in file
move $a0, $s0 #file descriptor
la $a1, Name # word u want to print
li $a2, 50 # size of word
syscall

li $v0, 15 # write in file
move $a0, $s0 #file descriptor
la $a1, Email # word u want to print
li $a2, 50 # size of word
syscall

li $v0, 15 # write in file
move $a0, $s0 #file descriptor
la $a1, A1 # word u want to print
li $a2, 50 # size of word
syscall

li $v0, 16 # close file
move $a0, $s0 # file descriptor
syscall

j MainPage
write3:
li $v0,4
la $a0, msg31
syscall
li $v0, 13 # open file
la $a0, filename # loading file name
li $a1, 1 # mode of writing in file 
syscall
move $s0, $v0 # file descriptor

li $v0, 15 # write in file
move $a0, $s0 #file descriptor
la $a1, Name # word u want to print
li $a2, 50 # size of word
syscall

li $v0, 15 # write in file
move $a0, $s0 #file descriptor
la $a1, Email # word u want to print
li $a2, 50 # size of word
syscall

li $v0, 15 # write in file
move $a0, $s0 #file descriptor
la $a1, C1 # word u want to print
li $a2, 50 # size of word
syscall

li $v0, 16 # close file
move $a0, $s0 # file descriptor
syscall

j MainPage
write4:
li $v0,4
la $a0, msg31
syscall
li $v0, 13 # open file
la $a0, filename # loading file name
li $a1, 1 # mode of writing in file 
syscall
move $s0, $v0 # file descriptor

li $v0, 15 # write in file
move $a0, $s0 #file descriptor
la $a1, Name # word u want to print
li $a2, 15 # size of word
syscall

li $v0, 15 # write in file
move $a0, $s0 #file descriptor
la $a1, Email # word u want to print
li $a2, 30 # size of word
syscall

li $v0, 15 # write in file
move $a0, $s0 #file descriptor
la $a1, D1 # word u want to print
li $a2, 30 # size of word
syscall

li $v0, 16 # close file
move $a0, $s0 # file descriptor
syscall

j MainPage

write5:
li $v0,4
la $a0, msg31
syscall
li $v0, 13 # open file
la $a0, filename # loading file name
li $a1, 1 # mode of writing in file 
syscall
move $s0, $v0 # file descriptor

li $v0, 15 # write in file
move $a0, $s0 #file descriptor
la $a1, Name # word u want to print
li $a2, 50 # size of word
syscall

li $v0, 15 # write in file
move $a0, $s0 #file descriptor
la $a1, Email # word u want to print
li $a2, 50 # size of word
syscall

li $v0, 15 # write in file
move $a0, $s0 #file descriptor
la $a1, E1 # word u want to print
li $a2, 50 # size of word
syscall

li $v0, 16 # close file
move $a0, $s0 # file descriptor
syscall

j MainPage

write6:
li $v0,4
la $a0, msg31
syscall
li $v0, 13 # open file
la $a0, filename # loading file name
li $a1, 1 # mode of writing in file 
syscall
move $s0, $v0 # file descriptor

li $v0, 15 # write in file
move $a0, $s0 #file descriptor
la $a1, Name # word u want to print
li $a2, 50 # size of word
syscall

li $v0, 15 # write in file
move $a0, $s0 #file descriptor
la $a1, Email # word u want to print
li $a2, 50 # size of word
syscall

li $v0, 15 # write in file
move $a0, $s0 #file descriptor
la $a1, F1 # word u want to print
li $a2, 50 # size of word
syscall

li $v0, 16 # close file
move $a0, $s0 # file descriptor
syscall

j MainPage



Billing:
li $t3,0
li $t5,0
j BillingLoop
BillingLoop:
beq $t3,$t8,BillingLoop2
lw $t4,0($sp)
addi $sp, $sp, 4
add $t5,$t5,$t4
add $t3,$t3,1
j BillingLoop
BillingLoop2:
beq $t8,0,BillingLoop3
li $v0,4
la $a0, msg4
syscall
li $v0,4
la $a0, msg5
syscall
li $v0,4
la $a0, msg6
syscall
li $v0,4
la $a0, msg32
syscall
li $v0,4
la $a0, msg33
syscall
li $v0,4
la $a0, msg34
syscall
li $v0,1
move $a0,$t8
syscall
li $v0,4
la $a0, msg44
syscall
li $v0,1
move $a0,$t5
syscall
li $v0,4
la $a0, msg35
syscall
li $v0,5
syscall
move $t9,$v0
li $t8,0
beq $t9,1,CreditCard
beq $t9,2,Cash
j MainPage
CreditCard:
li $v0,4
la $a0, msg36
syscall
li $v0,5
syscall
move $t9,$v0
li $v0,4
la $a0, msg37
syscall
li $v0,5
syscall
move $s5,$v0
li $v0,4
la $a0, msg38
syscall
li $v0,1
move $a0,$t5
syscall
li $v0,4
la $a0, msg39
syscall
li $v0,4
la $a0, msg40
syscall
li $v0,4
la $a0, msg43
syscall
la $a0 , back2
li $a1 , 5
li $v0 , 8
syscall
la $s7, back2
lb $s6,($s7)

beq $s6,'b',MainPage
beq $s6,'B',MainPage
j CreditCard
Cash:
li $v0,4
la $a0, msg41
syscall
li $v0,4
la $a0, msg42
syscall
li $v0,4
la $a0, msg43
syscall
la $a0 , back2
li $a1 , 5
li $v0 , 8
syscall
la $s7, back2
lb $s6,($s7)
beq $s6,'b',MainPage
beq $s6,'B',MainPage
j Cash
BillingLoop3:
li $v0,4
la $a0, msg4
syscall
li $v0,4
la $a0, msg5
syscall
li $v0,4
la $a0, msg6
syscall
li $v0,4
la $a0, msg32
syscall
li $v0,4
la $a0, msg33
syscall
li $v0,4
la $a0, msg34
syscall
li $v0,1
move $a0,$t8
syscall
li $v0,4
la $a0, msg44
syscall
li $v0,1
move $a0,$t5
syscall
li $v0,4
la $a0, msg45
syscall
li $v0,4
la $a0, msg43
syscall
la $a0 , back2
li $a1 , 5
li $v0 , 8
syscall
la $s7, back2
lb $s6,($s7)
beq $s6,'b',MainPage
beq $s6,'B',MainPage
j BillingLoop3
View:
li $v0,10
syscall
Exit:
li $v0,4
la $a0, msg46
syscall
li $v0,10
syscall
