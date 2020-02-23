
##
## EPITECH PROJECT, 2020
## Alexandre Wagner
## File description:
## ASM lib
##

D_SRC	=	./src/
D_TEST	=	./tests/

SRC	=		$(D_SRC)strlen.s \
			$(D_SRC)strchr.s \
			$(D_SRC)memset.s \
			$(D_SRC)memcpy.s \
			$(D_SRC)memmove.s \
			$(D_SRC)strcmp.s \
			$(D_SRC)strncmp.s \
			$(D_SRC)rindex.s \
			$(D_SRC)strstr.s \
			$(D_SRC)strpbrk.s \
			$(D_SRC)strcspn.s

OBJ	=		$(SRC:.s=.o)

NAME	=	libasm.so

all:		$(NAME)

$(NAME):	$(OBJ)
			ld -fPIC -shared -o $(NAME) $(OBJ)

%.o:		%.s
			nasm -felf64 $< -o $@

clean:
			rm -f $(OBJ)

tests_run:	re
			mv $(NAME) $(D_TEST)
			make re -C $(D_TEST) --no-print-directory

fclean:		clean
			rm -f $(NAME)

re:			fclean all

.PHONY:		all clean fclean re
