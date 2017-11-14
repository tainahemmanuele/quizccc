#include <stdio.h>
#include <iostream>
using namespace std;

// Quiz CCC

// Tamanho do tabuleiro
int tamanho = 5;
// Tabuleiro
int quizccc[5][5];

// Métodos

// Boas vindas do jogo
void textoInicial();
// Nomes dos integrantes do grupo
void textoFinal();
// Exibe os temas que o jogador pode escolher
void exibirTemas();
void preencherTabuleiro();
// Imprime o tabuleiro que exibe apenas as casas que ele já percorreu
void imprimirTabuleiro(int tabuleiro[5][5]);

int main () {
    textoInicial();
    preencherTabuleiro();
    imprimirTabuleiro(quizccc);
    textoFinal();
    return 0;
}

void textoInicial() {
    puts("------------------------------------------------------------------------------");
    puts("  ########  ####   ###  #### ##########      ########   ########   ########   ");
    puts(" #### ##### ####   ###  ####  ## #####      ##### #### ##### #### ##### ####  ");
    puts("####    ### ####   ###  ####    ####        ###        ###        ###         ");
    puts("####    ### ####   ###  ####  ####          ###        ###        ###         ");
    puts(" #########   #########  #### ##### ###       #########  #########  #########  ");
    puts("  #########   #######   #### ##########       #######    #######    #######   ");
    puts("         ##                                                                   ");
    puts("------------------------------------------------------------------------------");
}

void textoFinal(){
    puts("");
    puts("------------------------------------------------------------------------------");
    puts("                               ANA PAULA BARROS                               ");
    puts("                               ANTUNES DANTAS                                 ");
    puts("                               DAVID SOUZA                                    ");
    puts("                               TAINAH EMMANUELE                               ");
    puts("                               THALYTA FABRINE                                ");
    puts("------------------------------------------------------------------------------");
}

void preencherTabuleiro(){
    for(int j = 0; j < tamanho; j ++){
         for(int k = 0; k < tamanho; k ++){
            quizccc[j][k] = 1;
         }
    }
}

//Imprime o tabuleiro do jogo no seu estado atual
void imprimirTabuleiro(int tabuleiro[5][5]){
    printf("\n");
    printf("                              ");
    puts("---------------------");

    for(int x = 0; x < tamanho; x++){
        printf("                              ");
        printf("|");
        for(int y = 0; y < tamanho; y++){
            // se o valor é -1, significa que ele ja passou por essa posicao
            if(tabuleiro[x][y] == -1){
                printf(" x |");
            }
            // se o valor é 0, essa casa eh um buraco
            else if(tabuleiro[x][y] == 0){
                printf(" * |");
            }
            // espaco em branco
            else if(tabuleiro[x][y] == 1){
                printf("   |");
            }
        }
        printf("\n                              ");
        puts("---------------------");
    }
}
