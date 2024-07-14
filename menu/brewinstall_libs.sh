#!/bin/bash
#!/bin/zsh

osascript -e 'tell app "Terminal" to do script "brew install pkg-config && \
                                                brew install lmdb && \
                                                brew install lcov && \
                                                brew install gcovr && \
                                                brew install googletest && \
                                                brew install cppcheck && \
                                                killall iTerm2 Terminal"'
