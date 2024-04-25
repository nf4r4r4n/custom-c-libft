NAME 		= 	push_swap
CFLAGS		=	-Wall -Wextra -Werror
SRCS		=	main.c
INCLUDE_FLAGS	=	-I includes/
OBJS		=	$(SRCS:.c=.o)

# Colors
GREEN		=	\33[1;34m
END_COLOR	=	\33[0m

all:	$(NAME)

$(NAME):	$(OBJS)
	@echo "$(GREEN)Compiling...$(END_COLOR)"
	@make -C libft
	@ar -r $(NAME).a $?
	@cc -o $(NAME) $(CFLAGS) $(INCLUDE_FLAGS) $(NAME).a libft/libft.a
	@echo "$(GREEN)>>> Compilation OK!$(END_COLOR)"

%.o:		%.c
	@cc -c $(CFLAGS) $? $(INCLUDE_FLAGS)

clean:
	@make -C libft clean
	@rm -f $(OBJS)
	@rm -f $(NAME).a
	@echo "$(GREEN)>>> Clean OK!$(END_COLOR)"

fclean:		clean
	@make -C libft fclean
	@rm -f $(NAME)
	@echo "$(GREEN)>>> Fclean OK!$(END_COLOR)"

re:			fclean all

.PHONY:		all re clean fclean