NAME = Colleen

NASM = nasm
NASM_FLAGS = -f macho64
CC = cc
CC_FLAGS = -Wl,-no_pie

SRCS = Colleen.s
OBJS = $(SRCS:.s=.o)

all: $(NAME)

$(NAME): $(OBJS)
	$(CC) $(CC_FLAGS) -o $(NAME) $(OBJS)

%.o: %.s
	$(NASM) $(NASM_FLAGS) $< -o $@

clean:
	$(RM) $(OBJS)

fclean: clean
	$(RM) $(NAME)

re: fclean all

.PHONY: all clean fclean re