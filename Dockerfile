FROM node:13
 
ARG WORKSPACE=/root 

RUN apt-get update
RUN apt-get install vim -y
  
RUN git config --global user.name "John Doe"
RUN git config --global user.email johndoe@example.com

RUN ["apt-get", "install", "-y", "zsh"]
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true

WORKDIR $WORKSPACE

COPY .vimrc ${WORKSPACE}/.vimrc 
COPY plug.vim ${WORKSPACE}/.vim/autoload/plug.vim

CMD ["zsh"]
  

