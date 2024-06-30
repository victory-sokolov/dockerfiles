FROM ubuntu:24.10

# Set-up pyenv
RUN git clone git://github.com/yyuu/pyenv.git .pyenv

ENV HOME /home/ubuntu
ENV PYENV_ROOT $HOME/.pyenv
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH

RUN pyenv install $PYTHON_VERSION
RUN pyenv global $PYTHON_VERSION
RUN pyenv rehash
