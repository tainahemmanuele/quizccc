#include <stdio>
#include <iostream>
using namespace std;

// Quiz CCC

// Tamanho do tabuleiro
int tamanho = 5;
// Tabuleiro
int quizccc[tamanho][tamanho];

// Quantidade de buracos
int buracos;

// Nivel do jogo
int nivel;
// M�todos

// Boas vindas do jogo
void textoInicial();
// Nomes dos integrantes do grupo
void textoFinal();
// Exibe os temas que o jogador pode escolher
void exibirTemas();
// Imprime o tabuleiro que exibe apenas as casas que ele j� percorreu
void imprimirTabuleiro();

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
  if (quizccc[i][j] != true){
      quizccc[i][j] = true
  }else{
    posicaoBuracos();
  }
}

int main () {
    return 0;
}
