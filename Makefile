##
## EPITECH PROJECT, 2020
## ASM_minilibc_2019
## File description:
## Makefile
##

ASM		=	src/memcpy.asm		\
			src/memmove.asm		\
			src/memset.asm		\
			src/rindex.asm		\
			src/strcasecmp.asm	\
			src/strchr.asm		\
			src/strcmp.asm		\
			src/strcspn.asm		\
			src/strlen.asm		\
			src/strncmp.asm		\
			src/strpbrk.asm		\
			src/strstr.asm

OBJ		=	$(ASM:.asm=.o)

NAME	=	libasm.so

all:    $(NAME)

%.o: %.asm
	nasm -f elf64 -Wall $< -o $@ -g -F dwarf

$(NAME):	$(OBJ)
	ld -shared -o $(NAME) $(OBJ)

clean:
	rm -f $(OBJ)

fclean:	clean
	rm -f $(NAME)

re:	fclean all

.PHONY: all clean re fclean