SRC = $(wildcard *.c *.m)
FLAGS = -lcsfml-system -lcsfml-graphics -lcsfml-audio -lcsfml-window -lm
INCLUDE = -I./include
NAME = prog
OBJC_FLAGS = -fobjc-arc -fmodules

all:
	clang $(SRC) $(OBJC_FLAGS) $(INCLUDE) $(FLAGS) -o $(NAME)

clean:
	rm -rf $(NAME)
