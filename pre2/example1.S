    .data
    .global i
    .align 4
    .size i,4
i: 
    .word 2
    .global f
    .align 4
    .size f,4
f: 
    .word 1
    .comm n,4
    .text
    .global main

main:
    push {fp,lr}
    ldr r0,_bridge+8
    bl getint
    mov r8,r0
    ldr r3,_bridge+4
    ldr r0,[r3]
    mov r3,r0
    ldr r4,_bridge
    ldr r0,[r4]
    mov r4,r0
loop:
    mul r3,r3,r4
    add r4,#1
    sub r10,r4,#1
    cmp r10,r8
    bne loop
stop:
    mov r0,r3
    bl putint
    pop {fp,pc}

_bridge:
    .word i
    .word f
    .word n