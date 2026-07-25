#include <ncurses.h>

#define FIELD_WIDTH 80
#define FIELD_HEIGHT 25
#define PADDLE_SIZE 3
#define WIN_SCORE 21
#define LEFT_PADDLE_X 2
#define RIGHT_PADDLE_X 77
#define DELAY_MS 50

#define INIT 0
#define GET 1
#define SET 2
#define ADD 3
#define SUB 4

#define KEYUP_P1 (input == 'A' || input == 'a')
#define KEYDW_P1 (input == 'Z' || input == 'z')
#define KEYUP_P2 (input == 'K' || input == 'k')
#define KEYDW_P2 (input == 'M' || input == 'm')

#define DEFINE_STATE(name, init)      \
    int name(int action, int value) { \
        static int state = init;      \
        switch (action) {             \
            case SET:                 \
            case INIT:                \
                state = value;        \
                break;                \
            case ADD:                 \
                state += value;       \
                break;                \
            case SUB:                 \
                state -= value;       \
                break;                \
        }                             \
        return state;                 \
    }

DEFINE_STATE(BallX, 40)
DEFINE_STATE(BallY, 12)
DEFINE_STATE(BallDx, 1)
DEFINE_STATE(BallDy, 1)
DEFINE_STATE(P1Y, 11)
DEFINE_STATE(P2Y, 11)
DEFINE_STATE(Score1, 0)
DEFINE_STATE(Score2, 0)

void InitState(void) {
    BallX(INIT, FIELD_WIDTH / 2);
    BallY(INIT, FIELD_HEIGHT / 2);
    BallDx(INIT, 1);
    BallDy(INIT, 1);
    P1Y(INIT, FIELD_HEIGHT / 2 - 1);
    P2Y(INIT, FIELD_HEIGHT / 2 - 1);
    Score1(INIT, 0);
    Score2(INIT, 0);
}

void ResetBall(int dx) {
    BallX(INIT, FIELD_WIDTH / 2);
    BallY(INIT, FIELD_HEIGHT / 2);
    BallDx(INIT, dx);
    BallDy(INIT, 1);
}

void UpdateP1(char input) {
    int y = P1Y(GET, 0);
    if (KEYUP_P1 && y > 1) {
        P1Y(SET, y - 1);
    } else if (KEYDW_P1 && y < FIELD_HEIGHT - PADDLE_SIZE - 1) {
        P1Y(SET, y + 1);
    }
}

void UpdateP2(char input) {
    int y = P2Y(GET, 0);
    if (KEYUP_P2 && y > 1) {
        P2Y(SET, y - 1);
    } else if (KEYDW_P2 && y < FIELD_HEIGHT - PADDLE_SIZE - 1) {
        P2Y(SET, y + 1);
    }
}

void UpdateBallDy(void) {
    int dy = BallDy(GET, 0);
    int next_y = BallY(GET, 0) + dy;
    if (next_y < 1 || next_y > FIELD_HEIGHT - 2) {
        BallDy(SET, -dy);
    }
}

void UpdateBallDx(void) {
    int dx = BallDx(GET, 0);
    int next_y = BallY(GET, 0) + BallDy(GET, 0);
    int next_x = BallX(GET, 0) + dx;
    int p1_y = P1Y(GET, 0);
    int p2_y = P2Y(GET, 0);

    if (next_x == LEFT_PADDLE_X && next_y >= p1_y && next_y <= p1_y + PADDLE_SIZE - 1) {
        BallDx(SET, 1);
    } else if (next_x == RIGHT_PADDLE_X && next_y >= p2_y && next_y <= p2_y + PADDLE_SIZE - 1) {
        BallDx(SET, -1);
    }
}

int CheckGoal(void) {
    int result = 0;
    int next_x = BallX(GET, 0) + BallDx(GET, 0);
    if (next_x <= 0) {
        result = 2;
    } else if (next_x >= FIELD_WIDTH - 1) {
        result = 1;
    }
    return result;
}

void DrawChar(int x, int y, int bx, int by, int p1y, int p2y) {
    if (y == 0 || y == FIELD_HEIGHT - 1) {
        printw("-");
    } else if (x == 0 || x == FIELD_WIDTH - 1) {
        printw("|");
    } else if (x == LEFT_PADDLE_X && y >= p1y && y <= p1y + PADDLE_SIZE - 1) {
        printw("|");
    } else if (x == RIGHT_PADDLE_X && y >= p2y && y <= p2y + PADDLE_SIZE - 1) {
        printw("|");
    } else if (x == bx && y == by) {
        printw("o");
    } else if (x == FIELD_WIDTH / 2 && y % 2 == 0) {
        printw(".");
    } else {
        printw(" ");
    }
}

void DrawField(void) {
    int bx = BallX(GET, 0);
    int by = BallY(GET, 0);
    int p1y = P1Y(GET, 0);
    int p2y = P2Y(GET, 0);
    int s1 = Score1(GET, 0);
    int s2 = Score2(GET, 0);

    clear();
    printw("Player 1: %d  |  Player 2: %d\n", s1, s2);
    for (int y = 0; y < FIELD_HEIGHT; y++) {
        for (int x = 0; x < FIELD_WIDTH; x++) {
            DrawChar(x, y, bx, by, p1y, p2y);
        }
        printw("\n");
    }
    refresh();
}

char GetInput(void) {
    int c = getch();
    char result = ' ';
    if (c != ERR) {
        result = (char)c;
    }
    return result;
}

void PrintRes() {
    if (Score1(GET, 0) == WIN_SCORE) {
        printf("Player 1 wins!\n");
    } else if (Score2(GET, 0) == WIN_SCORE) {
        printf("Player 2 wins!\n");
    }
}

void InitCurses() {
    initscr();
    cbreak();
    noecho();
    nodelay(stdscr, TRUE);
    curs_set(FALSE);
}

void Step() {
    switch (CheckGoal()) {
        case 1:
            Score1(ADD, 1);
            ResetBall(1);
            break;
        case 2:
            Score2(ADD, 1);
            ResetBall(-1);
            break;
        default:
            BallX(ADD, BallDx(GET, 0));
            BallY(ADD, BallDy(GET, 0));
    }
}

void GameLoop() {
    while (Score1(GET, 0) < WIN_SCORE && Score2(GET, 0) < WIN_SCORE) {
        DrawField();
        char input = GetInput();
        UpdateP1(input);
        UpdateP2(input);
        UpdateBallDy();
        UpdateBallDx();
        Step();
        flushinp();
        napms(DELAY_MS);
    }
}

int main(void) {
    InitCurses();
    InitState();
    GameLoop();
    endwin();
    PrintRes();
    return 0;
}
