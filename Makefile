CC = $(CROSS_COMPILE)gcc
AR = $(CROSS_COMPILE)ar
export CC
export AR

all:
	$(MAKE) -C parsers
	$(CC) -g -o stm32flash -I./ \
		main.c \
		utils.c \
		stm32.c \
		serial_common.c \
		serial_platform.c \
		parsers/parsers.a \
		stm32/stmreset_binary.c \
		-Wall \
		-mmacosx-version-min=10.6 \
		-DUSE_SERIAL_RESET

clean:
	$(MAKE) -C parsers clean
	rm -f stm32flash

install: all
	cp stm32flash /usr/local/bin
