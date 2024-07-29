#!/bin/bash
#!/bin/zsh

osascript -e 'tell app "Terminal" to do script "brew install pkg-config && \
                                                brew install check && \
                                                brew install lmdb && \
                                                brew install lcov && \
                                                brew install gcovr && \
                                                brew install googletest && \
                                                brew install cppcheck && \
                                                brew install doxygen && \
                                                killall iTerm2 Terminal"'


# ln -s /Users/nohemife/goinfre/.brew/Cellar/gcc /Users/nohemife/.brew/Cellar/gcc
# ln -s /Users/nohemife/goinfre/.brew/Cellar/gcc@10 /Users/nohemife/.brew/Cellar/gcc@10

# ln -s /Users/nohemife/goinfre/.brew/Cellar/llvm@12 /Users/nohemife/.brew/Cellar/llvm@12
# ln -s /Users/nohemife/goinfre/.brew/Cellar/llvm@13 /Users/nohemife/.brew/Cellar/llvm@13
# ln -s /Users/nohemife/goinfre/.brew/Cellar/llvm@14 /Users/nohemife/.brew/Cellar/llvm@14
# ln -s /Users/nohemife/goinfre/.brew/Cellar/llvm@15 /Users/nohemife/.brew/Cellar/llvm@15
# ln -s /Users/nohemife/goinfre/.brew/Cellar/llvm@16 /Users/nohemife/.brew/Cellar/llvm@16


# ln -s /Users/nohemife/goinfre/.brew/Cellar/llvm@17 /Users/nohemife/.brew/Cellar/llvm@17
# To use the bundled libc++ please add the following LDFLAGS:
#   LDFLAGS="-L/Users/nohemife/.brew/opt/llvm@17/lib/c++ -Wl,-rpath,/Users/nohemife/.brew/opt/llvm@17/lib/c++"

# llvm@17 is keg-only, which means it was not symlinked into /Users/nohemife/.brew,
# because this is an alternate version of another formula.

# If you need to have llvm@17 first in your PATH, run:
#   echo 'export PATH="/Users/nohemife/.brew/opt/llvm@17/bin:$PATH"' >> ~/.zshrc

# For compilers to find llvm@17 you may need to set:
#   export LDFLAGS="-L/Users/nohemife/.brew/opt/llvm@17/lib"
#   export CPPFLAGS="-I/Users/nohemife/.brew/opt/llvm@17/include"



# ln -s /Users/nohemife/goinfre/.brew/Cellar/llvm /Users/nohemife/.brew/Cellar/llvm
# To use the bundled libc++ please add the following LDFLAGS:
#   LDFLAGS="-L/Users/nohemife/.brew/opt/llvm/lib/c++ -L/Users/nohemife/.brew/opt/llvm/lib -lunwind"

# llvm is keg-only, which means it was not symlinked into /Users/nohemife/.brew,
# because macOS already provides this software and installing another version in
# parallel can cause all kinds of trouble.

# If you need to have llvm first in your PATH, run:
#   echo 'export PATH="/Users/nohemife/.brew/opt/llvm/bin:$PATH"' >> ~/.zshrc

# For compilers to find llvm you may need to set:
#   export LDFLAGS="-L/Users/nohemife/.brew/opt/llvm/lib"
#   export CPPFLAGS="-I/Users/nohemife/.brew/opt/llvm/include"

# python3 -m ~/.venv
# python3 -m /Users/nohemife/.venv
# python3 -m venv /Users/nohemife/.venv
# source /Users/nohemife/.venv/bin/activate
# pip install --upgrade pip