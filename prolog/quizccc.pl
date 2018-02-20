textoInicial(
'----------------------------------------------------------------------------
  ########  ####   ###  #### ##########      ########   ########   ########
 #### ##### ####   ###  ####  ## #####      ##### #### ##### #### ##### ####
####    ### ####   ###  ####    ####        ###        ###        ###
####    ### ####   ###  ####  ####          ###        ###        ###
 #########   #########  #### ##### ###       #########  #########  #########
  #########   #######   #### ##########       #######    #######    #######
         ##
-----------------------------------------------------------------------------').

textoObjetivo(
'----------------------------  OBJETIVO DO JOGO ------------------------------
>> O jogador tem como objetivo chegar ao outro lado do tabuleiro com a maior
   pontuacao possivel.
>> O jogador deve indicar o numero correspondente ao tema de interesse.
>> Em seguida, ele deve informar o numero correspondente a dificuldade do jogo,
   classificada em: Facil, Medio e Dificil.
>> Apos selecionado o tema e o nivel, o jogo eh iniciado e o jogador escolhe a
   posicao que deseja avancar no tabuleiro
>> A rodada|jogo acaba quando o jogador "cair" em um buraco ou quando a
   quantidade de vidas estiver zerada.
>> O jogador vence quando chegar a ultima celula posicionada no canto inferior
   a direita do tabuleiro.
>> Ao final da rodada, ganhando ou nao, o jogador sera informado que a mesma
   acabou e a sua pontuacao sera exibida.
------------------------------------------------------------------------------
-----------------------  SIGINIFICADO DOS SIMBOLOS  --------------------------
>> @ - Representa a posicao atual do jogador no tabuleiro.
>> X - Significa que a celula ja foi visitada pelo jogador.').

textoFinal(
'------------------------------------------------------------------------------
PRODUZIDO POR:
ANA BARROS | ANTUNES DANTAS | DAVID SOUZA | TAINAH EMMANUELE | THALYTA FABRINE
------------------------------------------------------------------------------').

textoTema('\nIndique o numero correspondente ao tema que voce deseja jogar: \n1 - Animais \n2 - PLP\n').

textoNivel('\nIndique o numero correspondente ao nivel desejado: \n1 - Facil \n2 - Medio \n3 - Dificil\n').

qtdBuracos(1, 8).
qtdBuracos(2, 10).
qtdBuracos(3, 12).

incrementaScore(NIVEL, SCORE, NOVOSCORE) :- NIVEL =;= 1, NOVOSCORE is (SCORE + 50).
incrementaScore(NIVEL, SCORE, NOVOSCORE) :- NIVEL =;= 2, NOVOSCORE is (SCORE + 100).
incrementaScore(NIVEL, SCORE, NOVOSCORE) :- NIVEL =;= 3, NOVOSCORE is (SCORE + 150).

decrementaLife(VIDA, NOVAVIDA) :-VIDA =\= 0, NOVAVIDA is (VIDA-1).
decrementaLife(VIDA, NOVAVIDA) :- NOVAVIDA ='Poxa, você perdeu! Sua pontuacao foi:'.

:- initialization (main).

main :-
    textoInicial(QUIZZCCC),
    write(QUIZZCCC), nl,

    textoObjetivo(O),
    write(O), nl,

    textoFinal(Equipe),
    write(Equipe), nl,

    textoTema(TextoTema),
    write(TextoTema), nl,

    read_line_to_codes(user_input, NumeroTemaSystem),
    string_to_atom(NumeroTemaSystem, NumeroTemaString),
    atom_number(NumeroTemaString, NumeroTema),

    textoNivel(TextoNivel),
    write(TextoNivel), nl,

    read_line_to_codes(user_input, NumeroNivelSystem),
    string_to_atom(NumeroNivelSystem, NumeroNivelString),
    atom_number(NumeroNivelString, NumeroNivel),

    halt(0).
