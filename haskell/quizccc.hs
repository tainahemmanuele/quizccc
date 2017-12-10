main = do
    textoInicial
    textoObjetivo
    textoFinal

qtdBuracos :: Int -> Int
qtdBuracos x |x==1 = 8
     |x == 2 = 10
     |x == 3 = 12

incrementaScore :: Int -> Int -> Int
incrementaScore x  y| x == 1 = y+50
     | x == 2 = y + 100
     | x == 3 = y + 150

-- Inicialmente salvei tema e nivel dentro da funcao, precisamos ver como
-- utilizar isso pras demais funcoes
showMenu = do
    putStrLn "\n"
    putStrLn "Indique o numero correspondente ao tema que voce deseja jogar:"
    putStrLn "\n"
    putStrLn "1 - Animais\n"
    -- Lembrando que falta criar perguntas para os temas seguintes,
    -- e analisar a sugestao da prof de adicionar temas de PLP
    putStrLn "2 - Comida\n"
    putStrLn "3 - Esportes\n"
    
    tema <- getLine
    
    putStrLn "\n"
    putStrLn "Indique o numero correspondente ao nivel desejado"
    putStrLn "\n"
    -- Tambem precisamos analisar como separar as perguntas por niveis
    putStrLn "1 - Facil\n"
    putStrLn "2 - Medio\n"
    putStrLn "3 - Dificil\n"
    
    nivel <- getLine
    
    putStrLn "\n"
    putStrLn "Excelente, agora vamos iniciar o jogo\n"

textoInicial = do
    putStrLn "------------------------------------------------------------------------------"
    putStrLn "  ########  ####   ###  #### ##########      ########   ########   ########   "
    putStrLn " #### ##### ####   ###  ####  ## #####      ##### #### ##### #### ##### ####  "
    putStrLn "####    ### ####   ###  ####    ####        ###        ###        ###         "
    putStrLn "####    ### ####   ###  ####  ####          ###        ###        ###         "
    putStrLn " #########   #########  #### ##### ###       #########  #########  #########  "
    putStrLn "  #########   #######   #### ##########       #######    #######    #######   "
    putStrLn "         ##                                                                   "
    putStrLn "------------------------------------------------------------------------------"

textoObjetivo = do
    putStrLn "----------------------------  OBJETIVO DO JOGO -------------------------------"
    putStrLn ">> O jogador tem como objetivo chegar ao outro lado do tabuleiro com a maior \npontuacao possivel."
    putStrLn ">> O jogador deve indicar o numero correspondente ao tema de interesse."
    putStrLn ">> Em seguida, ele deve informar o numero correspondente a dificuldade do jogo, \nclassificada em: Facil, Medio e Dificil."
    putStrLn ">> Apos selecionado o tema e o nivel, o jogo eh iniciado e o jogador escolhe \na posicao que deseja avancar no tabuleiro"
    putStrLn ">> A rodada|jogo acaba quando o jogador 'cair' em um buraco ou quando a \nquantidade de vidas estiver zerada."
    putStrLn ">> O jogador vence quando chegar a ultima celula posicionada no canto inferior \na direita do tabuleiro."
    putStrLn ">> Ao final da rodada, ganhando ou nao, o jogador sera informado que a mesma \nacabou e a sua pontuacao sera exibida."
    putStrLn "------------------------------------------------------------------------------"
    putStrLn "-----------------------  SIGINIFICADO DOS SIMBOLOS  --------------------------"
    putStrLn ">> @ - Representa a posicao atual do jogador no tabuleiro."
    putStrLn ">> X - Significa que a celula ja foi visitada pelo jogador."

textoFinal = do
    putStrLn "------------------------------------------------------------------------------"
    putStrLn "PRODUZIDO POR:"
    putStrLn "ANA BARROS | ANTUNES DANTAS | DAVID SOUZA | TAINAH EMMANUELE | THALYTA FABRINE"
    putStrLn "------------------------------------------------------------------------------"
