
# Global
ARCH=x86_64
CSRC=csrc
OBJ_DIR=obj.$(ARCH)

# llvm Variables
LLVM_CCFLAGS=$(shell llvm-config --cppflags)
LLVM_LDFLAGS=$(shell llvm-config --ldflags) `llvm-config --libs`

# Erlang Variables
ERL_TOP=/ldisk/lukas/otp/release/x86_64-unknown-linux-gnu
ERL=$(ERL_TOP)/bin/erl

# CPP Variables
CC=g++
LINKER=g++
CCFLAGS=-m64 $(LLVM_CCFLAGS) -I $(ERL_TOP)/erts-5.8.4/include/ -O3  -fno-exceptions -fno-rtti -fno-common -Woverloaded-virtual -Wcast-qual -g -Wall -fPIC
LDFLAGS=$(LLVM_LDFLAGS) -shared
OBJ_FILES=$(patsubst $(CSRC)/%.cc, $(OBJ_DIR)/%.o, $(wildcard $(CSRC)/*.cc))
HH_FILES=$(wildcard $(CSRC)/*.hh)

all: compile

compile: priv/$(ARCH)/llevm.so
	./rebar $@
	@erl -noshell -pa ebin -eval "code:load_file(llvm_nif)." -s init stop

$(OBJ_DIR)/%.o: $(CSRC)/%.cc $(HH_FILES) $(OBJ_DIR)
	$(CC) -c $(CCFLAGS) -o $@ $<

priv/$(ARCH)/llevm.so: $(OBJ_FILES) priv/$(ARCH)
	$(LINKER) $(OBJ_FILES) $(LDFLAGS) -o $@

priv/$(ARCH) $(OBJ_DIR):
	@mkdir -p $@

clean:
	./rebar $@
	rm -rf $(OBJ_DIR) priv/$(ARCH)

shell:
	erl -pa ebin