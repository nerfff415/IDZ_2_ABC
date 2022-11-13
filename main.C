#include <stdio.h>
#include <string.h>
void ToLower(char *str)
{
    while (*str != '\0')
    {
        if (*str >= 65 && *str <= 90)
        {
            *str = *str + 32;
        }
        str++;
    }
}
int fcount_vowels(char *str, int n)
{
    char vowels[6] = {'a', 'o', 'u', 'i', 'e', 'y'};
    int count_vowels = 0;
    for (int j = 0; j < n; j++)
    {
        for (int i = 0; i < 6; i++)
        {
            if (str[j] == vowels[i])
                count_vowels++;
        }
    }
    return count_vowels;
}
int fcount_consonants(char *str, int n)
{
    char consonants[20] = {'q', 'w', 'r', 't', 'p', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'z', 'x', 'c', 'v', 'b', 'n', 'm'};
    int count_consonants = 0;
    for (int j = 0; j < n; j++)
    {
        for (int i = 0; i < 20; i++)
        {
            if (str[j] == consonants[i])
                count_consonants++;
        }
    }
    return count_consonants;
}
int main(void)
{
    char phrase[10000];
    char tmp;
    int i = 0;
    int tmp1, tmp2;
    printf("Введите строку: ");
    do
    {
        tmp = fgetc(stdin);
        phrase[i++] = tmp;
    } while (tmp != '\n');
    phrase[i - 1] = '\0';
    ToLower(phrase);
    tmp1 = fcount_vowels(phrase, i - 1);
    tmp2 = fcount_consonants(phrase, i - 1);
    printf("Количество гласных букв в строке: %d \n", tmp1);
    printf("Количество согласных букв в строке: %d \n", tmp2);
}