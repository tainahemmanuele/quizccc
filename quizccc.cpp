#include <stdio.h>
#include <iostream>
using namespace std;

// Quiz CCC

// estrutura simples que representa cada casa de um tabuleiro
struct casa {
	int ehBuraco;
	int foiPisado; // se o usu�rio j� caiu nessa casa
};

// Tamanho do tabuleiro
int tamanho = 5;
// Tabuleiro
struct casa quizccc[tamanho][tamanho];

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
// M�todos

// Boas vindas do jogo
void textoInicial();
// Nomes dos integrantes do grupo
void textoFinal();
// Exibe os temas que o jogador pode escolher
void exibirTemas();
// cria o tabuleiro colocando as casas e setando quais serão buracos
void criarTabuleiro();
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
  if (quizccc[i][j].ehBuraco != 1){
      quizccc[i][j].ehBuraco = 1;
  }else{
    posicaoBuracos();
  }
}

void criarTabuleiro() {
	for(int i = 0; i < tamanho; i++) {
		for(int j = 0; j < tamanho; j++) {
			quizccc[i][j].ehBuraco = 0;
			quizccc[i][j].foiPisado = 0;
		}
	}
	
	for(int k = 0; k < buracos; k++) {
		posicaoBuracos();
	}
}

int main () {
    return 0;
}