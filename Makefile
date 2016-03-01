CFLAGS	:= -Wall -std=gnu11 -fPIC
LDFLAGS	:= -shared

LIB	:= libscrewmysecurity.so

$(LIB): screwmysecurity.c
	$(LINK.c) $^ -o $@

.PHONY: clean
clean:
	$(RM) $(LIB)
