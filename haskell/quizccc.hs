import Data.Array
import Data.Matrix
import Textos
import System.Random
import Perguntas



data Posicao  = Posicao { posX :: Int,
    posY:: Int
}

main = do
    Textos.textoInicial
    Textos.textoObjetivo
    Textos.textoFinal
    showMenu

qtdBuracos :: Int -> Int
qtdBuracos nivel |nivel ==1 = 8
     |nivel == 2 = 10
     |nivel == 3 = 12

incrementaScore :: Int -> Int -> Int
incrementaScore nivel score| nivel == 1 = score + 50
     |nivel == 2 = score + 100
     |nivel  == 3 = score + 150
     
criarMatriz :: Matrix [Char]
criarMatriz = fromLists tabuleiro

tabuleiro = [
    ["X", "X", "X", "X", "X"],
    ["X", "X", "X", "X", "X"],
    ["X", "X", "X", "X", "X"],
    ["X", "X", "X", "X", "X"],
    ["X", "X", "X", "X", "X"]]

decrementaLife vida | vida == 0 = -1
     |otherwise  = vida - 1


perguntasSelecionadas :: Int -> Int -> [(String, Integer)]
perguntasSelecionadas nivel tema |nivel == 1 && tema  == 1 = Perguntas.perguntasNivelUm
    |nivel == 2 && tema == 1 = Perguntas.perguntasNivelDois
    |nivel == 3 && tema == 1 = Perguntas.perguntasNivelTres
    |nivel == 1 && tema == 2 = Perguntas.preenchePerguntasNivelUm_APLP
    |nivel == 2 && tema == 2 = Perguntas.preenchePerguntasNivelDois_APLP
    |otherwise = Perguntas.preenchePerguntasNivelTres_APLP
    

showMenu = do
    putStrLn "\n"
    putStrLn "Indique o numero correspondente ao tema que voce deseja jogar:"
    putStrLn "\n"
    putStrLn "1 - Animais\n"
    putStrLn "2 - PLP\n"

    
    tema <- getLine
    
    putStrLn "\n"
    putStrLn "Indique o numero correspondente ao nivel desejado"
    putStrLn "\n"
    putStrLn "1 - Facil\n"
    putStrLn "2 - Medio\n"
    putStrLn "3 - Dificil\n"
    
    nivel <- getLine
    let perguntas = (perguntasSelecionadas (read(nivel)) (read( tema)))
    putStrLn "\n"
    putStrLn "Excelente, agora vamos iniciar o jogo\n"
    jogar (criarMatriz) 1 1 0 3 0 perguntas
    

jogar :: Matrix [Char] -> Int -> Int -> Int -> Int -> Int ->  [(String, Integer)] -> IO()
jogar matriz 5 y jogadas vidas score perguntas = putStrLn "Você venceu, parabéns!"
jogar matriz x 5 jogadas vidas score perguntas = putStrLn "Você venceu, parabéns!"
jogar matriz x y jogadas 0 score perguntas = putStrLn ("Poxa, você perdeu! Sua pontuacao foi: " ++ (show score))
jogar matriz 2 1 jogadas vidas score perguntas = putStrLn ("Buraco! Você perdeu! Sua pontuacao foi: " ++ (show score))
jogar matriz 2 2 jogadas vidas score perguntas = putStrLn ("Buraco! Você perdeu! Sua pontuacao foi: " ++ (show score))
jogar matriz 3 4 jogadas vidas score perguntas = putStrLn ("Buraco! Você perdeu! Sua pontuacao foi: " ++ (show score))
jogar matriz 4 3 jogadas vidas score perguntas = putStrLn ("Buraco! Você perdeu! Sua pontuacao foi: " ++ (show score))
jogar matriz 3 5 jogadas vidas score perguntas = putStrLn ("Buraco! Você perdeu! Sua pontuacao foi: " ++ (show score))
jogar matriz 4 2 jogadas vidas score perguntas = putStrLn ("Buraco! Você perdeu! Sua pontuacao foi: " ++ (show score))
jogar matriz 4 5 jogadas vidas score perguntas = putStrLn ("Buraco! Você perdeu! Sua pontuacao foi: " ++ (show score))
jogar matriz posx posy jogada vidas score perguntas = do
        print matriz
        putStrLn "Você quer ir para \n 1 - Esquerda \n 2 - Direita\n 3 - Baixo\n"
        putStrLn "Selecione a opção: "
        opcao <- getLine
        if opcao == "1" then do
            let matrizNova = setElem " " (posx, posy - 1) matriz
            putStrLn $ fst (perguntas!!jogada)
            resposta <- getLine
            if (read resposta) == snd (perguntas!!jogada) then do
                jogar matrizNova posx (posy - 1) (jogada + 1) vidas (incrementaScore 1 score) perguntas
            else do
                putStrLn "Você errou!!!"
                jogar matrizNova posx (posy - 1) (jogada + 1) (decrementaLife vidas) score perguntas
        else if opcao == "2" then do
            let matrizNova = setElem " " (posx, posy + 1) matriz
            putStrLn $ fst (perguntas!!jogada)
            resposta <- getLine
            if (read resposta) == snd (perguntas!!jogada) then do
                jogar matrizNova posx (posy + 1) (jogada + 1) vidas (incrementaScore 1 score ) perguntas
            else do
                putStrLn "Você errou!!!"
                jogar matrizNova posx (posy + 1) (jogada + 1) (decrementaLife vidas) score perguntas
        else do
            let matrizNova = setElem " " (posx + 1, posy) matriz
            putStrLn $ fst (perguntas!!jogada)
            resposta <- getLine
            if (read resposta) == snd (perguntas!!jogada) then do
                jogar matrizNova (posx + 1) posy (jogada + 1) vidas (incrementaScore 1 score) perguntas
            else do
                putStrLn "Você errou!!!"
                jogar matrizNova (posx + 1) posy (jogada + 1) (decrementaLife vidas) score perguntas
