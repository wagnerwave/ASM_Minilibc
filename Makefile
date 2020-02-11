
##
## EPITECH PROJECT, 2020
## Alexandre Wagner
## File description:
## ASM lib
##

D_SRC	=	./src/

SRC	=	$(D_SRC)strlen.s

OBJ	=	$(SRC:.s=.o)

NAME	=	libasm.so

all:		$(NAME)

$(NAME):	$(OBJ)
		ld -fPIC -shared -o $(NAME) $(OBJ)

%.o:		%.s
		nasm -felf64 $< -o $@

clean:		
		rm -f $(OBJ)

fclean:		clean
		rm -f $(NAME)

re:		fclean all

.PHONY:		all clean fclean re
