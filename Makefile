# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fejjed <fejjed@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/05/06 10:37:35 by tamighi           #+#    #+#              #
#    Updated: 2022/06/29 10:49:19 by fejjed           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = webserv
CC = c++
FLAGS = -Wall -Werror -Wextra -pedantic -std=c++98
OBJ_DIR = objs/
RM = rm -rf

OBJS =  $(SRCS_OBJS) $(CONFIG_OBJS)  $(REQUEST_OBJS)  $(RESPON_OBJS) $(UTILS_OBJS)  

#### FILES

#### SRCS FILES

SRCS_DIR = srcs/
SRCS_FILES = main.cpp Server.cpp
SRCS_HEADERS = Server.hpp

SRCS_SRCS = $(addprefix $(SRCS_DIR), $(SRCS_FILES))
SRCS_INCLUDES = $(addprefix $(SRCS_DIR), $(SRCS_HEADERS))
SRCS_OBJS = $(addprefix $(OBJ_DIR), $(SRCS_FILES:.cpp=.o))

$(OBJ_DIR)%.o: $(SRCS_DIR)%.cpp
	mkdir -p $(OBJ_DIR)
	$(CC) $(FLAGS) -o $@ -c $<

#### UTILS FILES

UTILS_DIR = srcs/utils/
UTILS_FILES = Utils.cpp cgi.cpp
UTILS_HEADERS = Utils.hpp cgi.hpp

UTILS_SRCS = $(addprefix $(UTILS_DIR), $(UTILS_FILES))
UTILS_INCLUDES = $(addprefix $(UTILS_DIR), $(UTILS_HEADERS))
UTILS_OBJS = $(addprefix $(OBJ_DIR), $(UTILS_FILES:.cpp=.o))

$(OBJ_DIR)%.o: $(UTILS_DIR)%.cpp
	mkdir -p $(OBJ_DIR)
	$(CC) $(FLAGS) -o $@ -c $<

#### CONFIG FILES

CONFIG_DIR = srcs/config/
CONFIG_FILES = ParserConfig.cpp
CONFIG_HEADERS = ParserRequest.hpp

CONFIG_SRCS = $(addprefix $(CONFIG_DIR), $(CONFIG_FILES))
CONFIG_INCLUDES = $(addprefix $(CONFIG_DIR), $(CONFIG_HEADERS))
CONFIG_OBJS = $(addprefix $(OBJ_DIR), $(CONFIG_FILES:.cpp=.o))

$(OBJ_DIR)%.o: $(CONFIG_DIR)%.cpp
	mkdir -p $(OBJ_DIR)
	$(CC) $(FLAGS) -o $@ -c $<

#### REQUEST FILES

REQUEST_DIR = srcs/request/
REQUEST_FILES = ParserRequest.cpp
REQUEST_HEADERS = ParserRequest.hpp

REQUEST_SRCS = $(addprefix $(REQUEST_DIR), $(REQUEST_FILES))
REQUEST_INCLUDES = $(addprefix $(REQUEST_DIR), $(REQUEST_HEADERS))
REQUEST_OBJS = $(addprefix $(OBJ_DIR), $(REQUEST_FILES:.cpp=.o))

$(OBJ_DIR)%.o: $(REQUEST_DIR)%.cpp
	mkdir -p $(OBJ_DIR)
	$(CC) $(FLAGS) -o $@ -c $<

#### RESPON FILES

RESPON_DIR = srcs/Respon/
RESPON_FILES = ResHandler.cpp
RESPON_HEADERS = ResHandler.hpp

RESPON_SRCS = $(addprefix $(RESPON_DIR), $(RESPON_FILES))
RESPON_INCLUDES = $(addprefix $(RESPON_DIR), $(RESPON_HEADERS))
RESPON_OBJS = $(addprefix $(OBJ_DIR), $(RESPON_FILES:.cpp=.o))

$(OBJ_DIR)%.o: $(RESPON_DIR)%.cpp
	mkdir -p $(OBJ_DIR)
	$(CC) $(FLAGS) -o $@ -c $<


#### RULES

all: $(NAME)

$(NAME): $(OBJS)
	$(CC) -o $(NAME) $(OBJS)

clean:
	$(RM) $(OBJ_DIR)

fclean: clean
	$(RM) $(NAME)

re: fclean all

.PHONY: all re clean fclean
