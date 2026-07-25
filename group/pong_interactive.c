#include <ncurses.h>
#include <stdio.h>
int main() {
    initscr(), cbreak(), noecho(), keypad(stdscr, TRUE), nodelay(stdscr, TRUE), timeout(100);
    int key = 0, r_y1 = 14, r_y2 = 14, scr_1 = 0, scr_2 = 0, ball_x = 40, ball_y = 13, vec_x = 1, vec_y = 1;
    while (key != 'q' && scr_1 < 21 && scr_2 < 21) {
        for (int i = 0; i <= 25 + 1; i++)
            for (int j = 0; j <= 80; j++)
                if (j == ball_x && i == ball_y)
                    printw("o");
                else if (i == 0 || i == 25 + 1)
                    printw("%c%c", '-', (j == 80) ? '\n' : 0);
                else if (j == 80)
                    printw("\n");
                else if ((j == 2 && (i <= r_y1 && i > (r_y1 - 3))) ||
                         (j == 78 && (i <= r_y2 && i > (r_y2 - 3))) || (j == 80 / 2))
                    printw("|");
                else
                    printw(" ");
        printw("\nPlayer 1 SCORE: %d %46c Player 2 SCORE: %d\n", scr_1, ' ', scr_2);
        flushinp(), key = getch(), clear();
        if ((key == 'A' || key == 'a') && (r_y1 - 3) != 0) r_y1--;
        if ((key == 'Z' || key == 'z') && (r_y1 != 25)) r_y1++;
        if ((key == 'K' || key == 'k') && (r_y2 - 3) != 0) r_y2--;
        if ((key == 'M' || key == 'm') && (r_y2 != 25)) r_y2++;
        if ((ball_x - 1 == 2 && (ball_y <= r_y1 && ball_y > r_y1 - 3)) ||
            (ball_x - 1 == 2 && ((ball_y == r_y1 + 1 && vec_y < 0) || (ball_y == r_y1 - 3 && vec_y > 0))) ||
            (ball_x + 1 == 78 && (ball_y <= r_y2 && ball_y > r_y2 - 3)) ||
            (ball_x + 1 == 78 && ((ball_y == r_y2 + 1 && vec_y < 0) || (ball_y == r_y2 - 3 && vec_y > 0))))
            vec_x *= -1;
        if ((ball_y == 25 || ball_y - 1 == 0) ||
            (ball_x - 1 == 2 && ((ball_y == r_y1 + 1 && vec_y < 0) || (ball_y == r_y1 - 3 && vec_y > 0))) ||
            (ball_x + 1 == 78 && ((ball_y == r_y2 + 1 && vec_y < 0) || (ball_y == r_y2 - 3 && vec_y > 0))))
            vec_y *= -1;
        ball_x += vec_x, ball_y += vec_y;
        if (ball_x == 80) scr_1++, ball_x = 4, ball_y = r_y1 - 1;
        if (ball_x == 0) scr_2++, ball_x = 76, ball_y = r_y2 - 1;
    }
    endwin(), printf("Congratulations! Player %d wins!\n", (scr_1 > scr_2) ? 1 : 2);
    return 0;
}
