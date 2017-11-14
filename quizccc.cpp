#include <stdio.h>
#include <stdio>
#include <iostream>
using namespace std;

// Quiz CCC

// Tamanho do tabuleiro
int tamanho = 5;
// Tabuleiro
int quizccc[5][5];

// Quantidade de buracos
int buracos;

// Nivel do jogo
int nivel;

//Linha do tabuleiro
int i;

//Coluna do tabuleiro
int j;

//Quantidade de vidas que o jogador possui . No inicio do jogo, ele comeca com 3
int vidas = 3;
// Metodos

// Boas vindas do jogo
void textoInicial();
// Nomes dos integrantes do grupo
void textoFinal();
// Exibe os temas que o jogador pode escolher
void exibirTemas();
void preencherTabuleiro();
// Imprime o tabuleiro que exibe apenas as casas que ele já percorreu
void imprimirTabuleiro(int tabuleiro[5][5]);

// estrutura simples que representa cada casa de um tabuleiro
struct casa {
	int ehBuraco;
	int foiPisado; // se o usu�rio j� caiu nessa casa
}

//Define posicao dos buracos no tabuleiro
void posicaoBuracos();

//Define quantidade de buracos conforme o nível de jogo
void qtdBuracos();

void qtdBuracos(){
  if (nivel == 1){
    buracos = 8;
  }
  if (nivel == 2){
    buracos = 10;
  }
  if (nivel == 3){
    buracos = 12;
  }
}

void posicaoBuracos(){
  i = rand() % 5 + 1;
  j = rand() % 5 + 1;
  if (quizccc[i][j] != 1){
      quizccc[i][j] = 1;
  }else{
    posicaoBuracos();
  }
}

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

