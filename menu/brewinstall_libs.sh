#!/bin/bash
#!/bin/zsh

osascript -e 'tell app "Terminal" to do script "brew install pkg-config && \
                                                brew install check && \
                                                brew install lmdb && \
                                                brew install lcov && \
                                                brew install gcovr && \
                                                brew install cppcheck && \
                                                brew install doxygen && \
                                                killall iTerm2 Terminal"'
