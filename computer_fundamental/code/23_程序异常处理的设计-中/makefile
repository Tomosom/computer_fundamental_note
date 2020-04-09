
.PHONY : all clean rebuild

ERR_INC := errheap.h errtmr.h
APP := app.out
APP_SRC := $(wildcard *.c)
APP_INC := $(wildcard *.h)
ERR2STR := err2str
ERR2STR_SRC := err2str.cpp
ERRSTR_DEF := errstr.def

all : $(APP)
	@echo "BUILD SUCCESS => $^"
	
$(APP) : $(APP_SRC) $(APP_INC) $(ERRSTR_DEF)
	gcc -o $@ $(filter %.c, $^)
	
$(ERRSTR_DEF) : $(ERR2STR) $(ERR_INC)
	./$(ERR2STR) $(ERR_INC) > $@
	
$(ERR2STR) : $(ERR2STR_SRC)
	g++ -o $@ $^
	
clean :
	rm -fr $(APP) $(ERR2STR) $(ERRSTR_DEF)
	
rebuild : clean all
