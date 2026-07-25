#include <stdio.h>
int main() {
    int key = 0, r_y1 = 14, r_y2 = 14, scr_1 = 0, scr_2 = 0, ball_x = 40, ball_y = 13, vec_x = 1, vec_y = 1;
    while (key != 'q' && scr_1 <= 21 && scr_2 <= 21) {
        printf("\033[0d\033[2J");
        for (int i = 0; i <= 25 + 1; i++)
            for (int j = 0; j <= 80; j++)
                if (j == ball_x && i == ball_y)
                    printf("o");
                else if (i == 0 || i == 25 + 1)
                    printf("%c%c", '-', (j == 80) ? '\n' : 0);
                else if (j == 80)
                    printf("\n");
                else if ((j == 2 && (i <= r_y1 && i > (r_y1 - 3))) ||
                         (j == 78 && (i <= r_y2 && i > (r_y2 - 3))) || (j == 80 / 2))
                    printf("|");
                else
                    printf(" ");
        printf("\nPlayer 1 SCORE: %d %46c Player 2 SCORE: %d\n", scr_1, ' ', scr_2), key = getchar();
        if ((key == 'A' || key == 'a') && (r_y1 - 3) != 0) r_y1--;
        if ((key == 'Z' || key == 'z') && (r_y1 != 25)) r_y1++;
        if ((key == 'K' || key == 'k') && (r_y2 - 3) != 0) r_y2--;
        if ((key == 'M' || key == 'm') && (r_y2 != 25)) r_y2++;
        while ((key = getchar()) != '\n' && key != EOF);
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
    printf("Congratulations! Player %d wins!\n", (scr_1 > scr_2) ? 1 : 2);
    return 0;
}
