#!/bin/bash
#!/bin/zsh

# osascript -e 'tell app "Terminal" to do script "cd && git clone https://github.com/google/googletest.git && \
#                                                 cd googletest && mkdir build && cd build && \
#                                                 cmake -DCMAKE_CXX_COMPILER:STRING="/usr/local/bin/g++" .. && \
#                                                 make install && cd && rm -rf googletest"'

# git clone https://github.com/google/googletest.git \
# && cd googletest && mkdir build && cd build && cmake -DCMAKE_CXX_COMPILER:STRING="/usr/local/bin/g++" .. \

cd && git clone https://github.com/google/googletest.git &&
    cd googletest && mkdir build && cd build &&
    cmake -DCMAKE_CXX_COMPILER:STRING="/usr/local/bin/g++" .. &&
    make install && cd && rm -rf googletest

# brew reinstall googletest --build-from-source && cd && git clone https://github.com/google/googletest.git && cd googletest && mkdir build && cd build && cmake -DCMAKE_CXX_COMPILER:STRING="/usr/local/bin/g++" .. && make install && cd && rm -rf googletest
# brew reinstall googletest --build-from-source 
# && cd 
# && git clone https://github.com/google/googletest.git 
# && cd googletest 
# && mkdir build 
# && cd build 
# && cmake -DCMAKE_CXX_COMPILER:STRING="/usr/local/bin/g++" .. 
# && make
# && rm -rf ~/.brew/Cellar/googletest/1.15.2/lib/*.a
# && cp lib/libgtest.a ~/.brew/Cellar/googletest/1.15.2/lib/libgtest.a
# && cp lib/libgmock.a ~/.brew/Cellar/googletest/1.15.2/lib/libgmock.a
# && cp lib/libgmock_main.a ~/.brew/Cellar/googletest/1.15.2/lib/libgmock_main.a
# && cp lib/libgtest_main.a ~/.brew/Cellar/googletest/1.15.2/lib/libgtest_main.a
# && cd 
# && rm -rf googletest

# brew reinstall googletest --build-from-source && cd && git clone https://github.com/google/googletest.git && cd googletest && mkdir build && cd build && cmake -DCMAKE_CXX_COMPILER:STRING="/usr/local/bin/g++" .. && make&& rm -rf ~/.brew/Cellar/googletest/1.15.2/lib/*.a&& cp lib/libgtest.a ~/.brew/Cellar/googletest/1.15.2/lib/libgtest.a&& cp lib/libgmock.a ~/.brew/Cellar/googletest/1.15.2/lib/libgmock.a&& cp lib/libgmock_main.a ~/.brew/Cellar/googletest/1.15.2/lib/libgmock_main.a&& cp lib/libgtest_main.a ~/.brew/Cellar/googletest/1.15.2/lib/libgtest_main.a&& cd && rm -rf googletest
