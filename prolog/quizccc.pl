textoInicial( 
'------------------------------------------------------------------------------ 
  ########  ####   ###  #### ##########      ########   ########   ########   
 #### ##### ####   ###  ####  ## #####      ##### #### ##### #### ##### ####  
####    ### ####   ###  ####    ####        ###        ###        ###         
####    ### ####   ###  ####  ####          ###        ###        ###         
 #########   #########  #### ##### ###       #########  #########  #########  
  #########   #######   #### ##########       #######    #######    #######  
         ##                                                                   
------------------------------------------------------------------------------').

textoObjetivo(
'----------------------------  OBJETIVO DO JOGO -------------------------------
>> O jogador tem como objetivo chegar ao outro lado do tabuleiro com a maior \npontuacao possivel.
>> O jogador deve indicar o numero correspondente ao tema de interesse.
>> Em seguida, ele deve informar o numero correspondente a dificuldade do jogo, \nclassificada em: Facil, Medio e Dificil.
>> Apos selecionado o tema e o nivel, o jogo eh iniciado e o jogador escolhe \na posicao que deseja avancar no tabuleiro
>> A rodada|jogo acaba quando o jogador "cair" em um buraco ou quando a \nquantidade de vidas estiver zerada.
>> O jogador vence quando chegar a ultima celula posicionada no canto inferior \na direita do tabuleiro.
>> Ao final da rodada, ganhando ou nao, o jogador sera informado que a mesma \nacabou e a sua pontuacao sera exibida.
------------------------------------------------------------------------------
-----------------------  SIGINIFICADO DOS SIMBOLOS  --------------------------
>> @ - Representa a posicao atual do jogador no tabuleiro.
>> X - Significa que a celula ja foi visitada pelo jogador.').

textoFinal(
'------------------------------------------------------------------------------
PRODUZIDO POR:
ANA BARROS | ANTUNES DANTAS | DAVID SOUZA | TAINAH EMMANUELE | THALYTA FABRINE
------------------------------------------------------------------------------').
 
:- initialization (main).

main :-
    textoInicial(QUIZZCCC),
    write(QUIZZCCC),
    nl,
    textoObjetivo(O),
    write(O),
    nl,
    textoFinal(EQUIPE),
    write(EQUIPE),
    nl,
    halt(0).
