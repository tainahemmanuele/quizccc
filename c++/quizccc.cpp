#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

const int TAMANHO_INICIAL = 5;

using namespace std;

struct Posicao {
	int posX, posY;
};

struct Pergunta {
	string texto;
	string alternativas;
	int resposta;
};

struct Celula {
	int value;
	Pergunta pergunta;
};

int qtdVidas = 3;
int score = 0;
int tema, nivel, posicaoDigitaUsuario;
bool isLoser = false;
Posicao posicaoAtual;
Celula tabuleiro[TAMANHO_INICIAL][TAMANHO_INICIAL];
Pergunta perguntas[25];

void showMenu() {

	printf("\n");
	printf("Indique o numero correspondente ao tema que voce deseja jogar:");
	printf("\n");
	printf("1 - Animais\n");
	printf("2 - Comida\n");
	printf("3 - Esportes\n");

	scanf("%d", & tema);

	printf("\n");
	printf("Indique o numero correspondente ao nivel desejado:");
	printf("\n");
	printf("1 - Facil\n");
	printf("2 - Medio\n");
	printf("3 - Dificil\n");

	scanf("%d", & nivel);

	printf("\n");
	printf("Excelente, agora vamos iniciar o jogo! \n");

}

void imprimirTabuleiro() {

	printf("\n");
	printf("                              ");
	puts("---------------------");

	for(int x = 0; x < TAMANHO_INICIAL; x++) {
		printf("                              ");
		printf("|");
		for(int y = 0; y < TAMANHO_INICIAL; y++) {
			// se o valor ÃƒÆ’Ã†â€™Ãƒâ€ Ã¢â‚¬â„¢ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â© -1, significa que ele ja passou por essa posicao
			if(tabuleiro[x][y].value == -1) {
				printf(" x |");
			}
			// se o valor for 0, eh um buraco, caso queira visualizar o buraco coloque um asterisco abaixo
			else if(tabuleiro[x][y].value == 0) {
				printf("   |");
			}
			// espaco em branco
			else if(tabuleiro[x][y].value == 1) {
				if (x == posicaoAtual.posX && y == posicaoAtual.posY) {
					printf(" @ |");
				} else {
					printf("   |");
				}
			}

		}
		printf("\n                              ");
		puts("---------------------");
	}
}

void incrementaScore() {

	if(nivel == 1) {
		score = score + 50;
	} else if(nivel == 2) {
		score = score + 100;
	} else {
		score = score + 150;
	}
}

void decrementaLife() {

	if(qtdVidas == 0) {
		cout << "Score atingido: " << score << endl;
		isLoser = true;
	} else {
		qtdVidas--;
	}
}

bool verificaSeEhPossivelCaminhar(Posicao pos) {

	if((pos.posX < 0 || pos.posX > 4) || (pos.posY < 0 || pos.posY > 4)) {
		return false;
	} else if(tabuleiro[pos.posX][pos.posY].value == -1) {
		return false;
	} else {
		return true;
	}
}

void setPosicaoTabuleiro(Posicao novaPosicao) {

	//Troca a posicao atual pela nova posicao
	memcpy ( & posicaoAtual, & novaPosicao, sizeof(novaPosicao));

}

void preenchePerguntasNivelUm() {

	perguntas[0].texto = "Ratos sentem cocegas. Essa afirmacao eh:";
	perguntas[0].alternativas = "1.Verdadeira \n2.Falso";
	perguntas[0].resposta = 1;

	perguntas[1].texto = "Alguns anfibios saltam distancias que correspondem a no maximo 50 vezes o seu tamanho. Essa afirmacao eh:";
	perguntas[1].alternativas = "1.Verdadeira \n2.Falso";
	perguntas[1].resposta = 2;

	perguntas[2].texto = "As cabras tem sotaques diferentes. Essa afirmacao eh:";
	perguntas[2].alternativas = "1.Verdadeira \n2.Falso";
	perguntas[2].resposta = 1;

	perguntas[3].texto = "Quantas picadas um Pica-Pau da por minuto?";
	perguntas[3].alternativas = "1.100 \n2.1000 \n3.200 \n4.500";
	perguntas[3].resposta = 1;

	perguntas[4].texto = "Com quantos narizes as formigas sao equipadas?";
	perguntas[4].alternativas = "1. 2 \n2. 5 \n3. 4 \n4. 0";
	perguntas[4].resposta = 2;

	perguntas[5].texto = "Os Golfinhos dao nomes uns aos outros. Essa afirmacao eh:";
	perguntas[5].alternativas = "1.Verdadeira \n2.Falso";
	perguntas[5].resposta = 1;

	perguntas[6].texto = "Qual animal pode correr mais rapido do que um cavalo?";
	perguntas[6].alternativas = "1.Gato \n2.Cachorro \n3.Barata \n4.Urso";
	perguntas[6].resposta = 4;

	perguntas[7].texto = "Qual animal tem o coice mais poderoso?";
	perguntas[7].alternativas = "1.Zebra \n2.Cavalo \n3.Girafa \n4.Vaca";
	perguntas[7].resposta = 3;

	perguntas[8].texto = "Quanto pesa um Urso Malaio?";
	perguntas[8].alternativas = "1. 15 a 25 Kg \n2. 25 a 45 Kg \n 3.65 a 95 Kg \n4. 95 a 105 Kg";
	perguntas[8].resposta = 2;

	perguntas[9].texto = "Qual o animal terrestre eh mais barulhento?";
	perguntas[9].alternativas = "1.Hiena \n2.Bugio \n3.Porco \n4.Leao";
	perguntas[9].resposta = 2;

	perguntas[10].texto = "Quais destes animais nao sao todos insetos?";
	perguntas[10].alternativas = "1. Mosca, formiga e michoca \n2. Joaninha, aranha e formiga \n3. Abelha, pulga e escorpiao \n4. Escorpiao, aranha e tatu-bolinha";
	perguntas[10].resposta = 4;

	perguntas[11].texto = "Quais destes animais sao herbivoros?";
	perguntas[11].alternativas = "1. Coala, cavalo e coelho \n2.Tigre, macaco e tubarao \n3.Vaca, leao e lince \n4.Cavalo, pato e onca";
	perguntas[11].resposta = 1;

	perguntas[12].texto = "Sarcophilus harrisii eh o nome cientifico de qual animal?";
	perguntas[12].alternativas = "1. Tamandua-bandeira \n2. Peixe-boi \n3. Diabo-da-tasmania \n4. Leao";
	perguntas[12].resposta = 3;

	perguntas[13].texto = "Qual outro nome a abelha-rainha tambem eh conhecida?";
	perguntas[13].alternativas = "1. Abelha-governadora \n2. Abelha-mestra \n3. Abelha-maior \n4. Abelha-mae";
	perguntas[13].resposta = 2;

	perguntas[14].texto = "Por que a abelha operaria morre apos picar alguem?";
	perguntas[14].alternativas = "1. Porque ela perde suas asas \n2. Porque quando o ferrao se solta ela perde parte posterior do abdomem \n3. Porque ela injeta seu proprio veneno nela \n4. N.D.A";
	perguntas[14].resposta = 2;

	perguntas[15].texto = "Qual foi o primeiro mamifero a ser clonado?";
	perguntas[15].alternativas = "1. Cachorro \n2. Carneiro \n3. Ovelha \n4. Elefante";
	perguntas[15].resposta = 3;

	perguntas[16].texto = "Qual destes animais eh o unico mamifero capaz de voar?";
	perguntas[16].alternativas = "1. Esquilo \n2. Morcego \n3. Demonio da tazmania \n4. Passarinho";
	perguntas[16].resposta = 2;

	perguntas[17].texto = "Qual destes eh um reptil?";
	perguntas[17].alternativas = "1. Mosca \n2. Leopardo \n3. Larico \n4. N.D.A";
	perguntas[17].resposta = 4;

	perguntas[18].texto = "Qual alternativa a seguir so possui apenas insetos?";
	perguntas[18].alternativas = "1. Borboleta, Louva-a-Deus, Carrapato e Mosquito. \n2. Bicho-Pau, Acaro, Barata e Grilo. \n3. Centopeia, Formiga, Mosca e Borboleta. \n4. Mosquito, Formiga, Borboleta e Barata.";
	perguntas[18].resposta = 4;

	perguntas[19].texto = "Qual o inseto mais forte do mundo?";
	perguntas[19].alternativas = "1. Escaravelho \n2. Besouro-Rinoceronte \n3. Barata-Pata-De-Leao \n4. Louva-a-Deus";
	perguntas[19].resposta = 2;

	perguntas[20].texto = "Na Antartida nao ha repteis. Essa afirmacao ÃƒÆ’Ã†â€™Ãƒâ€ Ã¢â‚¬â„¢ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â© verdadeira ou falsa?";
	perguntas[20].alternativas = "1. Verdadeira \n2. Falsa";
	perguntas[20].resposta = 1;

	perguntas[21].texto = "Exemplos de Aracnideos:";
	perguntas[21].alternativas = "1. Grilo,minhoca e Aranha \n2. Centopeia, Escorpiao e Barata \n3. Aranha,Escorpiao e Grilo \n4. Acaro, Carrapato e Aranha";
	perguntas[21].resposta = 4;

	perguntas[22].texto = "Quanto tempo dura a gestacao de uma vaca?";
	perguntas[22].alternativas = "1. 9 meses \n2. 10 meses \n3. 4 meses \n4. 12 meses";
	perguntas[22].resposta = 1;

	perguntas[23].texto = "Qual eh o animal terrestre mais alto do mundo?";
	perguntas[23].alternativas = "1. Elefante \n2. Girafa \n3. Zebra \n4. Macaco";
	perguntas[23].resposta = 2;

	perguntas[24].texto = "Qual eh o animal mais pesado do mundo?";
	perguntas[24].alternativas = "1. Baleia-Azul \n2. Elefante \n3. Rinoceronte \n4. Hipopotamo";
	perguntas[24].resposta = 1;
}

void preenchePerguntasNivelDois() {

	perguntas[0].texto = "Quantos anos vive um Cavalo?";
	perguntas[0].alternativas = "1. 20 anos \n2. 30 anos \n3. 50 anos \n4. 45 anos";
	perguntas[0].resposta = 1;

	perguntas[1].texto = "Qual eh o maior tubarao?";
	perguntas[1].alternativas = "1. Tubarao-Branco \n2. Tubarao-Tigre \n3. Tubarao-Baleia \n4. Tubarao-Serra";
	perguntas[1].resposta = 3;

	perguntas[2].texto = "Qual eh o animal terrestre mais rapido do mundo?";
	perguntas[2].alternativas = "1. Leopardo \n2. Cavalo \n3. Tigre \n4. Guepardo";
	perguntas[2].resposta = 4;

	perguntas[3].texto = "Qual eh o animal terrestre mais alto do mundo?";
	perguntas[3].alternativas = "1. Elefante \n2. Girafa \n3. Zebra \n4. Macaco";
	perguntas[3].resposta = 2;

	perguntas[4].texto = "Qual eh o animal mais pesado do mundo?";
	perguntas[4].alternativas = "1. Baleia-Azul \n2. Elefante \n3. Rinoceronte \n4. Hipopotamo";
	perguntas[4].resposta = 1;

	perguntas[5].texto = "Qual animal a seguir eh o mais lento?";
	perguntas[5].alternativas = "1. Tartaruga \n2. Leao \n3. Rinoceronte \n4. Lesma";
	perguntas[5].resposta = 4;

	perguntas[6].texto = "Qual passaro consegue parar no ar?";
	perguntas[6].alternativas = "1. Pardal \n2. Andorinha \n3. Tico-Tico \n4. Beija-Flor";
	perguntas[6].resposta = 4;

	perguntas[7].texto = "Qual eh o peixe mais voraz?";
	perguntas[7].alternativas = "1. Lambari \n2. Carca \n3. Tilapia \n4.Piranha";
	perguntas[7].resposta = 4;

	perguntas[8].texto = "Qual desses mamiferos nao consegue pular?";
	perguntas[8].alternativas = "1. Elefante \n2. Golfinho \n3. Foca \n4. Prequica";
	perguntas[8].resposta = 1;

	perguntas[9].texto = "O guecko eh um tipo de?";
	perguntas[9].alternativas = "1.Peixe \n2.Lagarto \n3.Mamifero \n4.Inseto";
	perguntas[9].resposta = 2;

	perguntas[10].texto = "Qual eh a diferenca entre viviparos e oviparos";
	perguntas[10].alternativas = "1. Viviparo eh o animal que nasce do utero da mae, ovipararo eh o animal que nasce do ovo que a mae bota. \n2. Viviparo eh o animal que nasce do ovo que a mae bota, oviparo eh o animal que nasce do utero da mae";
	perguntas[10].resposta = 1;

	perguntas[11].texto = "O narval eh um tipo de:";
	perguntas[11].alternativas = "1. Peixe \n2. Cobra \n3. Aracnideo \n4. Baleia";
	perguntas[11].resposta = 4;

	perguntas[12].texto = "Qual eh a alternativa correta?";
	perguntas[12].alternativas = "1. O maior animal do mundo eh a formiga. \n2. Os peixes sao animais invertebrados e de sangue frio. \n3. Existem cerca de 5 mil especies diferentes de mamiferos. \n4. O tamandua tem uma lingua pequena.";
	perguntas[12].resposta = 3;

	perguntas[13].texto = "A pele dos repteis sao:";
	perguntas[13].alternativas = "1. Seca, grossa e impermeavel. \n2. Fofa, rosa e macia. \n3. Peluda, verde e brilhante. \n4. Lisa, colorida e feia.";
	perguntas[13].resposta = 1;

	perguntas[14].texto = "Qual eh o unico animal que pode se queimar se for exposto ao sol?";
	perguntas[14].alternativas = "1. Elefante \n2. Porco \n3. Rato \n4. Rinoceronte" ;
	perguntas[14].resposta = 2;

	perguntas[15].texto = "Se um peixe dourado for colocado em um local escuro ficara branco. Essa afirmacao eh verdadeira ou falsa?";
	perguntas[15].alternativas = "1. Verdadeira \n2. Falso";
	perguntas[15].resposta = 1;

	perguntas[16].texto = "Os lagartos e jacares, quando sao atacados na cauda, desprendem-as para poder escapar. Verdadeiro ou falso?";
	perguntas[16].alternativas = "1. Verdadeira \n 2. Falso";
	perguntas[16].resposta = 2;

	perguntas[17].texto = "A especie de peixe Lambari sao uma das mais agressivas que existem. Verdadeiro ou falso?";
	perguntas[17].alternativas = "1. Verdadeira \n 2. Falso";
	perguntas[17].resposta = 2;

	perguntas[18].texto = "As moscas comuns podem viver por aproximadamente quanto tempo?";
	perguntas[18].alternativas = "1. 2 meses \n 2. 1 dia \n 3. 2 dias \n 4. 1 semana";
	perguntas[18].resposta = 1;

	perguntas[19].texto = "Os olhos de um hamster podem cair se pendurados de cabeca para baixo. Verdadeiro ou falso?";
	perguntas[19].alternativas = "1. Verdadeiro \n 2. Falso";
	perguntas[19].resposta = 1;

	perguntas[20].texto = "Os cangurus nao sao capazes de andar para tras. Verdadeiro ou falso?";
	perguntas[20].alternativas = "1. Verdadeiro \n 2. Falso";
	perguntas[20].resposta = 1;

	perguntas[21].texto = "As borboletas sentem o gosto com os pes. Essa afirmacao eh verdadeira ou falsa?";
	perguntas[21].alternativas = "1. Verdadeira \n2. Falsa";
	perguntas[21].resposta = 1;

	perguntas[22].texto = "Qual destes eh um reptil?";
	perguntas[22].alternativas = "1. Mosca \n2. Leopardo \n3. Larico \n4. N.D.A";
	perguntas[22].resposta = 4;

	perguntas[23].texto = "Qual alternativa a seguir so possui apenas insetos?";
	perguntas[23].alternativas = "1. Borboleta, Louva-a-Deus, Carrapato e Mosquito. \n2. Bicho-Pau, Acaro, Barata e Grilo. \n3. Centopeia, Formiga, Mosca e Borboleta. \n4. Mosquito, Formiga, Borboleta e Barata.";
	perguntas[23].resposta = 4;

	perguntas[24].texto = "Qual o inseto mais forte do mundo?";
	perguntas[24].alternativas = "1. Escaravelho \n2. Besouro-Rinoceronte \n3. Barata-Pata-De-Leao \n4. Louva-a-Deus";
	perguntas[24].resposta = 2;
}

void preenchePerguntasNivelTres() {

	perguntas[0].texto = "Se um peixe dourado for colocado em um local escuro ficara branco. Essa afirmacao eh verdadeira ou falsa?";
	perguntas[0].alternativas = "1. Verdadeira \n2. Falso";
	perguntas[0].resposta = 1;

	perguntas[1].texto = "Os lagartos e jacares, quando sao atacados na cauda, desprendem-as para poder escapar. Verdadeiro ou falso?";
	perguntas[1].alternativas = "1. Verdadeira \n2. Falso";
	perguntas[1].resposta = 2;

	perguntas[2].texto = "A especie de peixe Lambari sao uma das mais agressivas que existem. Verdadeiro ou falso?";
	perguntas[2].alternativas = "1. Verdadeira \n2. Falso";
	perguntas[2].resposta = 2;

	perguntas[3].texto = "As moscas comuns podem viver por aproximadamente quanto tempo?";
	perguntas[3].alternativas = "1. 2 meses \n2. 1 dia \n3. 2 dias \n4. 1 semana";
	perguntas[3].resposta = 1;

	perguntas[4].texto = "Os olhos de um hamster podem cair se pendurados de cabeca para baixo. Verdadeiro ou falso?";
	perguntas[4].alternativas = "1. Verdadeiro \n2. Falso";
	perguntas[4].resposta = 1;

	perguntas[5].texto = "Os cangurus nao sao capazes de andar para tras. Verdadeiro ou falso?";
	perguntas[5].alternativas = "1. Verdadeiro \n2. Falso";
	perguntas[5].resposta = 1;

	perguntas[6].texto = "As borboletas sentem o gosto com os pes. Essa afirmacao eh verdadeira ou falsa?";
	perguntas[6].alternativas = "1. Verdadeira \n2. Falsa";
	perguntas[6].resposta = 1;

	perguntas[7].texto = "Qual destes eh um reptil?";
	perguntas[7].alternativas = "1. Mosca \n2. Leopardo \n3. Larico \n4. N.D.A";
	perguntas[7].resposta = 4;

	perguntas[8].texto = "Qual alternativa a seguir so possui apenas insetos?";
	perguntas[8].alternativas = "1. Borboleta, Louva-a-Deus, Carrapato e Mosquito. \n2. Bicho-Pau, Acaro, Barata e Grilo. \n3. Centopeia, Formiga, Mosca e Borboleta. \n4. Mosquito, Formiga, Borboleta e Barata.";
	perguntas[8].resposta = 4;

	perguntas[9].texto = "Qual o inseto mais forte do mundo?";
	perguntas[9].alternativas = "1. Escaravelho \n2. Besouro-Rinoceronte \n3. Barata-Pata-De-Leao \n4. Louva-a-Deus";
	perguntas[9].resposta = 2;

	perguntas[10].texto = "Na Antartida nao ha repteis. Essa afirmacao eh verdadeira ou falsa?";
	perguntas[10].alternativas = "1. Verdadeira \n2. Falsa";
	perguntas[10].resposta = 1;

	perguntas[11].texto = "Exemplos de Aracnideos:";
	perguntas[11].alternativas = "1. Grilo,minhoca e Aranha \n2. Centopeia, Escorpiao e Barata \n3. Aranha,Escorpiao e Grilo \n4. Acaro, Carrapato e Aranha";
	perguntas[11].resposta = 4;

	perguntas[12].texto = "Quanto tempo dura a gestacao de uma vaca?";
	perguntas[12].alternativas = "1. 9 meses \n2. 10 meses \n3. 4 meses \n4. 12 meses";
	perguntas[12].resposta = 1;

	perguntas[13].texto = "Qual eh o animal terrestre mais alto do mundo?";
	perguntas[13].alternativas = "1. Elefante \n2. Girafa \n3. Zebra \n4. Macaco";
	perguntas[13].resposta = 2;

	perguntas[14].texto = "Qual eh o animal mais pesado do mundo?";
	perguntas[14].alternativas = "1. Baleia-Azul \n2. Elefante \n3. Rinoceronte \n4. Hipopotamo";
	perguntas[14].resposta = 1;

	perguntas[15].texto = "Qual animal a seguir eh o mais lento?";
	perguntas[15].alternativas = "1. Tartaruga \n2. Leao \n3. Rinoceronte \n4. Lesma";
	perguntas[15].resposta = 4;

	perguntas[16].texto = "Qual passaro consegue parar no ar?";
	perguntas[16].alternativas = "1. Pardal \n2. Andorinha \n3. Tico-Tico \n4. Beija-Flor";
	perguntas[16].resposta = 4;

	perguntas[17].texto = "Qual eh o peixe mais voraz?";
	perguntas[17].alternativas = "1. Lambari \n2. Carca \n3. Tilapia \n4.Piranha";
	perguntas[17].resposta = 4;

	perguntas[18].texto = "Qual desses mamiferos nao consegue pular?";
	perguntas[18].alternativas = "1. Elefante \n2. Golfinho \n3. Foca \n4. Prequica";
	perguntas[18].resposta = 1;

	perguntas[19].texto = "O guecko eh um tipo de?";
	perguntas[19].alternativas = "1.Peixe \n2.Lagarto \n3.Mamifero \n4.Inseto";
	perguntas[19].resposta = 2;

	perguntas[20].texto = "Qual eh a diferenca entre viviparos e oviparos";
	perguntas[20].alternativas = "1. Viviparo eh o animal que nasce do utero da mae, ovipararo eh o animal que nasce do ovo que a mae bota. \n2. Viviparo eh o animal que nasce do ovo que a mae bota, oviparo eh o animal que nasce do utero da mae";
	perguntas[20].resposta = 1;

	perguntas[21].texto = "O narval eh um tipo de:";
	perguntas[21].alternativas = "1. Peixe \n2. Cobra \n3. Aracnideo \n4. Baleia";
	perguntas[21].resposta = 4;

	perguntas[22].texto = "Qual eh a alternativa correta?";
	perguntas[22].alternativas = "1. O maior animal do mundo eh a formiga. \n2. Os peixes sao animais invertebrados e de sangue frio. \n3. Existem cerca de 5 mil especies diferentes de mamiferos. \n4. O tamandua tem uma lingua pequena.";
	perguntas[22].resposta = 3;

	perguntas[23].texto = "A pele dos repteis sao:";
	perguntas[23].alternativas = "1. Seca, grossa e impermeavel. \n2. Fofa, rosa e macia. \n3. Peluda, verde e brilhante. \n4. Lisa, colorida e feia.";
	perguntas[23].resposta = 1;

	perguntas[24].texto = "Qual eh o unico animal que pode se queimar se for exposto ao sol?";
	perguntas[24].alternativas = "1. Elefante \n2. Porco \n3. Rato \n4. Rinoceronte" ;
	perguntas[24].resposta = 2;
}

void exibirPergunta(int indiceDaPergunta) {

	Pergunta perSelecionada = perguntas[indiceDaPergunta];

	cout << perSelecionada.texto << endl;
	cout << perSelecionada.alternativas << endl;

	int escolhaDoJogador;

	cout << "Escolha uma alternativa: " << endl;

	scanf("%d", & escolhaDoJogador);

	if(escolhaDoJogador == perSelecionada.resposta) {
		cout << "Parabens!" << endl;
		incrementaScore();
	} else {
		decrementaLife();
		cout << "Voce errou! A resposta correta eh a alternativa: " << perSelecionada.resposta << endl;
		cout << "Quantidade de vidas: " << qtdVidas << endl;
	}

}

void andarNoTabuleiro(int indice) {

	printf("Para se movimentar no tabuleiro, digite a posicao correspondente ao movimento desejado: [Para baixo => 2, Para direita => 6, Para Esquerda => 4] \n");

	scanf("%d", & posicaoDigitaUsuario);

	Posicao novaPosicao;

	memcpy( & novaPosicao, & posicaoAtual, sizeof(posicaoAtual));

	if(posicaoDigitaUsuario == 2) {
		novaPosicao.posX += 1;
	}
	if(posicaoDigitaUsuario == 6) {
		novaPosicao.posY += 1;
	}
	if(posicaoDigitaUsuario == 4) {
		novaPosicao.posY -= 1;
	}

	bool podeAndar = verificaSeEhPossivelCaminhar(novaPosicao);

	if(podeAndar) {

		if(tabuleiro[novaPosicao.posX][novaPosicao.posY].value == 1) {

			tabuleiro[posicaoAtual.posX][posicaoAtual.posY].value = -1;

			//Seta a posicao do jogador no tabuleiro
			setPosicaoTabuleiro(novaPosicao);

			imprimirTabuleiro();

			exibirPergunta(indice);

		}

		if(tabuleiro[novaPosicao.posX][novaPosicao.posY].value == 0) {
			cout << "Voce caiu na armadilha! Fim de jogo! Seu score atual eh: " << score << endl;
			isLoser = true;
		}

	}

}

int qtdBuracos() {
	if (nivel == 1) {
		return 8;
	}
	if (nivel == 2) {
		return 10;
	}
	if (nivel == 3) {
		return 12;
	}
}

void preencherComBuracos() {
	int x, y, z;
	z = rand() % 4 + 1;
	x = rand() % z + 1;
	y = rand() % z + 1;
	if ((x != 0 && y != 0) && (x != TAMANHO_INICIAL - 1 && y != TAMANHO_INICIAL - 1)) {
		tabuleiro[x][y].value = 0;
	}
}

void posicaoBuracos() {
	int quantosBuracos = qtdBuracos();
	for(int i = 0; i < quantosBuracos; i++) {
		preencherComBuracos();
	}
}

void criarTabuleiro() {
	for(int i = 0; i < TAMANHO_INICIAL; i++) {
		for(int j = 0; j < TAMANHO_INICIAL; j++) {
			tabuleiro[i][j].value = 1;
		}
	}
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

void textoObjetivo(){

	puts("---------------------------  OBJETIVO DO JOGO -------------------------------");
	puts("O jogador tem como objetivo chegar ao outro lado do tabuleiro com maior pontuacao possivel.");
	puts(">> O jogador deve indicar o numero correspondente ao tema de interesse.");
	puts(">> Em seguida, ele deve iformar o numero correspondente a dificuldade do jogo, \nclassificada em: Facil, Medio e Dificil.");
	puts(">> Apos selecionado o tema e o nivel, o jogo eh iniciado e o jogador escolhe \na posicao que deseja avancar no tabuleiro");
	puts(">> A rodada|jogo acaba quando o jogador 'cair' em um buraco  ou quando a \nquantidade de vidas estiver zerada.");
	puts(">> O jogador vence quando chegar a ultima celular posicionada no canto inferior a direita do tabuleiro.");
	puts(">> Ao final da rodada, ganhado ou nao, o jogador serao informado que a mesma \nacabou e a sua pontuacao sera exibida.");
	puts("------------------------------------------------------------------------------");
	puts("-----------------------  SIGINIFICADO DOS SIMBOLOS  --------------------------");
	puts(">> @ - ignifica  a posicao atual do jogador no tabuleiro.");
	puts(">> X - Significa que a celular ja foi visitada pelo jogador.");
}

void textoFinal(){
    puts("------------------------------------------------------------------------------");
    puts("PRODUZIDO POR:");
    puts("ANA BARROS | ANTUNES DANTAS | DAVID SOUZA | TAINAH EMMANUELE | THALYTA FABRINE");
    puts("------------------------------------------------------------------------------");
}

int main(int argc, char * * argv) {

	textoInicial();
	textoObjetivo();
	textoFinal();
	showMenu();
	criarTabuleiro();
	posicaoBuracos();
	imprimirTabuleiro();

	posicaoAtual.posX = 0;
	posicaoAtual.posY = 0;

	preenchePerguntasNivelUm();

	int indiceParaPergunta = 0;

	while(!isLoser) {

		if(posicaoAtual.posX == 4 && posicaoAtual.posY == 4) {
			cout << "Voce ganhou! Seu score eh: " << score << endl;
			break;
		}

		if (qtdVidas == 0) {
			cout << "Voce perdeu! Seu score atual eh: " << score << endl;
			break;
		}

		andarNoTabuleiro(indiceParaPergunta);
		indiceParaPergunta++;

	}

	return EXIT_SUCCESS;
}
