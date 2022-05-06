/* Created by: Jonathan Pasco-Arnone
 * Created May 2022
 * Compares two values
 * -- loop01.s
 */

.text
.global main

main:
    mov r1, #0 @ r1 <- 0
    mov r2, #1 @ r2 <- 1
loop:
    add r1, r1, r2 @ r1 <- r1 + r2
    add r2, r2, #1 @ r2 <- r2 + 1
    cmp r2, #100 @ compare r2 and 22
    bgt end @ branch if r2 > 22 to end
    b loop
end:
    mov r0, r1 @ r0 <- r1
    bx lr
