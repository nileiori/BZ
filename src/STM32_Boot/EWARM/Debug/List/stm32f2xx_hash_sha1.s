///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.10.2.52244/W32 for ARM    04/Dec/2013  10:58:11 /
// Copyright 1999-2010 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  D:\work\行标产品\改进版一体机\源程序\改进型EGS701-1\改� /
//                    虴GS701-1\STM32F2xx_Boot_V1.62\STM32F2xx_Boot_130815_ /
//                    IAR6.1\STM32_Boot\STM32F2xx_StdPeriph_Driver\src\stm32f /
//                    2xx_hash_sha1.c                                         /
//    Command line =  D:\work\行标产品\改进版一体机\源程序\改进型EGS701-1\改� /
//                    虴GS701-1\STM32F2xx_Boot_V1.62\STM32F2xx_Boot_130815_ /
//                    IAR6.1\STM32_Boot\STM32F2xx_StdPeriph_Driver\src\stm32f /
//                    2xx_hash_sha1.c -D STM32F10X_CL -D                      /
//                    USE_STDPERIPH_DRIVER -lcN D:\work\行标产品\改进版一体机 /
//                    \源程序\改进型EGS701-1\改进型EGS701-1\STM32F2xx_Boot_V1 /
//                    .62\STM32F2xx_Boot_130815_IAR6.1\STM32_Boot\EWARM\Debug /
//                    \List\ -lb D:\work\行标产品\改进版一体机\源程序\改进型E /
//                    GS701-1\改进型EGS701-1\STM32F2xx_Boot_V1.62\STM32F2xx_B /
//                    oot_130815_IAR6.1\STM32_Boot\EWARM\Debug\List\ -o       /
//                    D:\work\行标产品\改进版一体机\源程序\改进型EGS701-1\改� /
//                    虴GS701-1\STM32F2xx_Boot_V1.62\STM32F2xx_Boot_130815_ /
//                    IAR6.1\STM32_Boot\EWARM\Debug\Obj\ --no_cse             /
//                    --no_unroll --no_inline --no_code_motion --no_tbaa      /
//                    --no_clustering --no_scheduling --debug                 /
//                    --endian=little --cpu=Cortex-M3 -e                      /
//                    --warnings_are_errors --fpu=None --dlib_config          /
//                    E:\SoftwareInstall\arm\INC\c\DLib_Config_Normal.h -I    /
//                    D:\work\行标产品\改进版一体机\源程序\改进型EGS701-1\改� /
//                    虴GS701-1\STM32F2xx_Boot_V1.62\STM32F2xx_Boot_130815_ /
//                    IAR6.1\STM32_Boot\EWARM\..\inc\ -I                      /
//                    D:\work\行标产品\改进版一体机\源程序\改进型EGS701-1\改� /
//                    虴GS701-1\STM32F2xx_Boot_V1.62\STM32F2xx_Boot_130815_ /
//                    IAR6.1\STM32_Boot\EWARM\..\CMSIS\CM3\CoreSupport\ -I    /
//                    D:\work\行标产品\改进版一体机\源程序\改进型EGS701-1\改� /
//                    虴GS701-1\STM32F2xx_Boot_V1.62\STM32F2xx_Boot_130815_ /
//                    IAR6.1\STM32_Boot\EWARM\..\STM32F2xx_StdPeriph_Driver\i /
//                    nc\ -I D:\work\行标产品\改进版一体机\源程序\改进型EGS70 /
//                    1-1\改进型EGS701-1\STM32F2xx_Boot_V1.62\STM32F2xx_Boot_ /
//                    130815_IAR6.1\STM32_Boot\EWARM\..\CMSIS\CM3\DeviceSuppo /
//                    rt\ST\STM32F2xx\ -On --use_c++_inline                   /
//    List file    =  D:\work\行标产品\改进版一体机\源程序\改进型EGS701-1\改� /
//                    虴GS701-1\STM32F2xx_Boot_V1.62\STM32F2xx_Boot_130815_ /
//                    IAR6.1\STM32_Boot\EWARM\Debug\List\stm32f2xx_hash_sha1. /
//                    s                                                       /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm32f2xx_hash_sha1

        EXTERN HASH_DataIn
        EXTERN HASH_DeInit
        EXTERN HASH_GetDigest
        EXTERN HASH_GetFlagStatus
        EXTERN HASH_Init
        EXTERN HASH_SetLastWordValidBitsNbr
        EXTERN HASH_StartDigest

        PUBLIC HASH_SHA1
        PUBLIC HMAC_SHA1


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
HASH_SHA1:
        PUSH     {R4-R11,LR}
        SUB      SP,SP,#+44
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R0,#+0
        STRH     R0,[SP, #+4]
        MOVS     R11,#+0
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        MOVS     R7,#+0
        MOVS     R8,#+1
        MOV      R10,R4
        MOV      R9,R6
        MOVS     R0,#+4
        UDIV     R1,R5,R0
        MLS      R1,R1,R0,R5
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LSLS     R0,R1,#+3
        STRH     R0,[SP, #+4]
        BL       HASH_DeInit
        MOVS     R0,#+0
        STR      R0,[SP, #+28]
        MOVS     R0,#+0
        STR      R0,[SP, #+32]
        MOVS     R0,#+32
        STR      R0,[SP, #+36]
        ADD      R0,SP,#+28
        BL       HASH_Init
        LDRH     R0,[SP, #+4]
        BL       HASH_SetLastWordValidBitsNbr
        MOVS     R0,#+0
        MOV      R11,R0
??HASH_SHA1_0:
        CMP      R11,R5
        BCS.N    ??HASH_SHA1_1
        LDR      R0,[R10, #+0]
        BL       HASH_DataIn
        ADDS     R10,R10,#+4
        ADDS     R11,R11,#+4
        B.N      ??HASH_SHA1_0
??HASH_SHA1_1:
        BL       HASH_StartDigest
??HASH_SHA1_2:
        MOVS     R0,#+8
        BL       HASH_GetFlagStatus
        MOVS     R7,R0
        LDR      R0,[SP, #+0]
        ADDS     R0,R0,#+1
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+0]
        CMP      R0,#+65536
        BEQ.N    ??HASH_SHA1_3
        CMP      R7,#+0
        BNE.N    ??HASH_SHA1_2
??HASH_SHA1_3:
        CMP      R7,#+0
        BEQ.N    ??HASH_SHA1_4
        MOVS     R0,#+0
        MOV      R8,R0
        B.N      ??HASH_SHA1_5
??HASH_SHA1_4:
        ADD      R0,SP,#+8
        BL       HASH_GetDigest
        LDR      R0,[SP, #+8]
        REV      R0,R0
        STR      R0,[R9, #+0]
        ADDS     R9,R9,#+4
        LDR      R0,[SP, #+12]
        REV      R0,R0
        STR      R0,[R9, #+0]
        ADDS     R9,R9,#+4
        LDR      R0,[SP, #+16]
        REV      R0,R0
        STR      R0,[R9, #+0]
        ADDS     R9,R9,#+4
        LDR      R0,[SP, #+20]
        REV      R0,R0
        STR      R0,[R9, #+0]
        ADDS     R9,R9,#+4
        LDR      R0,[SP, #+24]
        REV      R0,R0
        STR      R0,[R9, #+0]
??HASH_SHA1_5:
        MOV      R0,R8
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADD      SP,SP,#+44
        POP      {R4-R11,PC}      ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
HMAC_SHA1:
        PUSH     {R0,R2,R4-R11,LR}
        SUB      SP,SP,#+44
        MOVS     R4,R1
        MOVS     R5,R3
        MOVS     R0,#+0
        STRH     R0,[SP, #+6]
        MOVS     R0,#+0
        STRH     R0,[SP, #+4]
        MOVS     R11,#+0
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        MOVS     R6,#+0
        MOVS     R7,#+1
        LDR      R10,[SP, #+44]
        LDR      R9,[SP, #+48]
        LDR      R8,[SP, #+88]
        MOVS     R0,#+4
        UDIV     R1,R5,R0
        MLS      R1,R1,R0,R5
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LSLS     R0,R1,#+3
        STRH     R0,[SP, #+6]
        MOVS     R0,#+4
        UDIV     R1,R4,R0
        MLS      R1,R1,R0,R4
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LSLS     R0,R1,#+3
        STRH     R0,[SP, #+4]
        BL       HASH_DeInit
        MOVS     R0,#+0
        STR      R0,[SP, #+8]
        MOVS     R0,#+64
        STR      R0,[SP, #+12]
        MOVS     R0,#+32
        STR      R0,[SP, #+16]
        CMP      R4,#+65
        BCC.N    ??HMAC_SHA1_0
        MOVS     R0,#+65536
        STR      R0,[SP, #+20]
        B.N      ??HMAC_SHA1_1
??HMAC_SHA1_0:
        MOVS     R0,#+0
        STR      R0,[SP, #+20]
??HMAC_SHA1_1:
        ADD      R0,SP,#+8
        BL       HASH_Init
        LDRH     R0,[SP, #+4]
        BL       HASH_SetLastWordValidBitsNbr
        MOVS     R0,#+0
        MOV      R11,R0
??HMAC_SHA1_2:
        CMP      R11,R4
        BCS.N    ??HMAC_SHA1_3
        LDR      R0,[R10, #+0]
        BL       HASH_DataIn
        ADDS     R10,R10,#+4
        ADDS     R11,R11,#+4
        B.N      ??HMAC_SHA1_2
??HMAC_SHA1_3:
        BL       HASH_StartDigest
??HMAC_SHA1_4:
        MOVS     R0,#+8
        BL       HASH_GetFlagStatus
        MOVS     R6,R0
        LDR      R0,[SP, #+0]
        ADDS     R0,R0,#+1
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+0]
        CMP      R0,#+65536
        BEQ.N    ??HMAC_SHA1_5
        CMP      R6,#+0
        BNE.N    ??HMAC_SHA1_4
??HMAC_SHA1_5:
        CMP      R6,#+0
        BEQ.N    ??HMAC_SHA1_6
        MOVS     R0,#+0
        MOVS     R7,R0
        B.N      ??HMAC_SHA1_7
??HMAC_SHA1_6:
        LDRH     R0,[SP, #+6]
        BL       HASH_SetLastWordValidBitsNbr
        MOVS     R0,#+0
        MOV      R11,R0
??HMAC_SHA1_8:
        CMP      R11,R5
        BCS.N    ??HMAC_SHA1_9
        LDR      R0,[R9, #+0]
        BL       HASH_DataIn
        ADDS     R9,R9,#+4
        ADDS     R11,R11,#+4
        B.N      ??HMAC_SHA1_8
??HMAC_SHA1_9:
        BL       HASH_StartDigest
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
??HMAC_SHA1_10:
        MOVS     R0,#+8
        BL       HASH_GetFlagStatus
        MOVS     R6,R0
        LDR      R0,[SP, #+0]
        ADDS     R0,R0,#+1
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+0]
        CMP      R0,#+65536
        BEQ.N    ??HMAC_SHA1_11
        CMP      R6,#+0
        BNE.N    ??HMAC_SHA1_10
??HMAC_SHA1_11:
        CMP      R6,#+0
        BEQ.N    ??HMAC_SHA1_12
        MOVS     R0,#+0
        MOVS     R7,R0
        B.N      ??HMAC_SHA1_7
??HMAC_SHA1_12:
        LDRH     R0,[SP, #+4]
        BL       HASH_SetLastWordValidBitsNbr
        LDR      R0,[SP, #+44]
        MOV      R10,R0
        MOVS     R0,#+0
        MOV      R11,R0
??HMAC_SHA1_13:
        CMP      R11,R4
        BCS.N    ??HMAC_SHA1_14
        LDR      R0,[R10, #+0]
        BL       HASH_DataIn
        ADDS     R10,R10,#+4
        ADDS     R11,R11,#+4
        B.N      ??HMAC_SHA1_13
??HMAC_SHA1_14:
        BL       HASH_StartDigest
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
??HMAC_SHA1_15:
        MOVS     R0,#+8
        BL       HASH_GetFlagStatus
        MOVS     R6,R0
        LDR      R0,[SP, #+0]
        ADDS     R0,R0,#+1
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+0]
        CMP      R0,#+65536
        BEQ.N    ??HMAC_SHA1_16
        CMP      R6,#+0
        BNE.N    ??HMAC_SHA1_15
??HMAC_SHA1_16:
        CMP      R6,#+0
        BEQ.N    ??HMAC_SHA1_17
        MOVS     R0,#+0
        MOVS     R7,R0
        B.N      ??HMAC_SHA1_7
??HMAC_SHA1_17:
        ADD      R0,SP,#+24
        BL       HASH_GetDigest
        LDR      R0,[SP, #+24]
        REV      R0,R0
        STR      R0,[R8, #+0]
        ADDS     R8,R8,#+4
        LDR      R0,[SP, #+28]
        REV      R0,R0
        STR      R0,[R8, #+0]
        ADDS     R8,R8,#+4
        LDR      R0,[SP, #+32]
        REV      R0,R0
        STR      R0,[R8, #+0]
        ADDS     R8,R8,#+4
        LDR      R0,[SP, #+36]
        REV      R0,R0
        STR      R0,[R8, #+0]
        ADDS     R8,R8,#+4
        LDR      R0,[SP, #+40]
        REV      R0,R0
        STR      R0,[R8, #+0]
??HMAC_SHA1_7:
        MOVS     R0,R7
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADD      SP,SP,#+52
        POP      {R4-R11,PC}      ;; return

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)

        END
// 
// 648 bytes in section .text
// 
// 648 bytes of CODE memory
//
//Errors: none
//Warnings: none
