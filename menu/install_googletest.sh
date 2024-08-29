#!/bin/bash
#!/bin/zsh

osascript -e 'tell app "Terminal" to do script "cd && git clone https://github.com/google/googletest.git && \
                                                cd googletest && mkdir build && cd build && \
                                                cmake -DCMAKE_CXX_COMPILER:STRING="/usr/local/bin/g++" .. && \
                                                make install && cd && rm -rf googletest"'

# git clone https://github.com/google/googletest.git \
# && cd googletest && mkdir build && cd build && cmake -DCMAKE_CXX_COMPILER:STRING="/usr/local/bin/g++" .. \