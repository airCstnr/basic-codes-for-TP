################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/main.c \
../src/stm32f1xx_it.c \
../src/syscalls.c \
../src/system_stm32f1xx.c 

OBJS += \
./src/main.o \
./src/stm32f1xx_it.o \
./src/syscalls.o \
./src/system_stm32f1xx.o 

C_DEPS += \
./src/main.d \
./src/stm32f1xx_it.d \
./src/syscalls.d \
./src/system_stm32f1xx.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -mfloat-abi=soft -DSTM32F1 -DNUCLEO_F103RB -DSTM32F103RBTx -DSTM32 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F103xB -I"/home/chomlafg/basic-codes-for-TP/Archi/nucleo-f103rb_hal_lib" -I"/home/chomlafg/basic-codes-for-TP/Archi/exam_CHOMLAFEL-ROGER/inc" -I"/home/chomlafg/basic-codes-for-TP/Archi/nucleo-f103rb_hal_lib/CMSIS/device" -I"/home/chomlafg/basic-codes-for-TP/Archi/nucleo-f103rb_hal_lib/CMSIS/core" -I"/home/chomlafg/basic-codes-for-TP/Archi/nucleo-f103rb_hal_lib/HAL_Driver/Inc" -I"/home/chomlafg/basic-codes-for-TP/Archi/nucleo-f103rb_hal_lib/HAL_Driver/Inc/Legacy" -I"/home/chomlafg/basic-codes-for-TP/Archi/nucleo-f103rb_hal_lib/Utilities/STM32F1xx_Nucleo" -O0 -g3 -Wall -fmessage-length=0 -ffunction-sections -c -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


