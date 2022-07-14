SRC = $(wildcard *.c *.m)
FLAGS = -lcsfml-system -lcsfml-graphics -lcsfml-audio -lcsfml-window -lm
INCLUDE = -I./include
NAME = prog
OBJC_FLAGS = -fobjc-arc -fmodules

all:
# gcc `gnustep-config --objc-flags` $(SRC) $(FLAGS) $(INCLUDE) -lgnustep-base -lobjc -o $(NAME)
	clang $(SRC) $(OBJC_FLAGS) $(INCLUDE) $(FLAGS) -o $(NAME)

clean:
	rm -rf $(NAME)
	rm -rf *.d
