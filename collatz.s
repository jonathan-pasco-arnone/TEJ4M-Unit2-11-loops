/* Created by: Jonathan Pasco-Arnone
 * Created May 2022
 * Compares two values
 * -- collatz.s
 */

.text
.global main
main:
    mov r1, #123 @ r1 <- 123 a trial number
    mov r0, #0 @ r2 <- 0 the # of steps

loop:
    cmp r1, #1 @ compare r1 and 1
    beq end @ branch to end if r1 == 1

    and r3, r1, #1 /* r3 <- r1 & 1 [mask] (converts r1 to binary and
        uses an "and" to compare it with #1) */
    cmp r3, #0 @ compare r3 and 0 (0 = even | 1 = odd)
    bne odd @ branch to odd if r3 != 0

even:
    mov r1, r1, ASR #1 @ r1 <- (r1 >> 1) [divided by 2 to the power of #1]
    b end_loop
odd:
    add r1, r1, r1, LSL #1 @ r1 <- r1 + (r1 << 1) [3n]
    add r1, r1, #1 @ r1 <- r1 + 1 [3n+1]

end_loop:
    add r0, r0, #1 @ r2 <- r2 + 1
    b loop @ branch to loop

end:
    mov r0, r0 @ number of steps
    bx lr
