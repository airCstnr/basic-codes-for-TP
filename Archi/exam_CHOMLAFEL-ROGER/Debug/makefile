################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include startup/subdir.mk
-include src/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 

# All Target
all: exam_CHOMLAFEL-ROGER.elf

dependents:
	-cd /home/chomlafg/basic-codes-for-TP/Archi/nucleo-f103rb_hal_lib/Debug && $(MAKE) all

# Tool invocations
exam_CHOMLAFEL-ROGER.elf: $(OBJS) $(USER_OBJS) /home/chomlafg/basic-codes-for-TP/Archi/nucleo-f103rb_hal_lib/Debug/libnucleo-f103rb_hal_lib.a /home/chomlafg/basic-codes-for-TP/Archi/exam_CHOMLAFEL-ROGER/LinkerScript.ld
	@echo 'Building target: $@'
	@echo 'Invoking: MCU GCC Linker'
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -mfloat-abi=soft -L"/home/chomlafg/basic-codes-for-TP/Archi/nucleo-f103rb_hal_lib/Debug" -T"/home/chomlafg/basic-codes-for-TP/Archi/exam_CHOMLAFEL-ROGER/LinkerScript.ld" -Wl,-Map=output.map -Wl,--gc-sections -o "exam_CHOMLAFEL-ROGER.elf" @"objects.list" $(USER_OBJS) $(LIBS) -lm
	@echo 'Finished building target: $@'
	@echo ' '
	$(MAKE) --no-print-directory post-build

# Other Targets
clean:
	-$(RM) *
	-@echo ' '

post-build:
	-@echo 'Generating binary and Printing size information:'
	arm-none-eabi-objcopy -O binary "exam_CHOMLAFEL-ROGER.elf" "exam_CHOMLAFEL-ROGER.bin"
	arm-none-eabi-size "exam_CHOMLAFEL-ROGER.elf"
	-@echo ' '

.PHONY: all clean dependents
.SECONDARY: post-build
/home/chomlafg/basic-codes-for-TP/Archi/nucleo-f103rb_hal_lib/Debug/libnucleo-f103rb_hal_lib.a:

-include ../makefile.targets
