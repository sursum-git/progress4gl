/*
   Procedure: verifRetCmd.p
   Description: Executes a command using execCmdComRet.p and checks if a
                given string is present in the command output.
*/

DEFINE INPUT  PARAMETER pcComando AS CHARACTER NO-UNDO.
DEFINE INPUT  PARAMETER pcTrecho  AS CHARACTER NO-UNDO.
DEFINE OUTPUT PARAMETER plEncontrado AS LOGICAL   NO-UNDO.

DEFINE VARIABLE lcRetorno AS LONGCHAR NO-UNDO.

/* Chama o programa que executa o comando e retorna a saida */
RUN execCmdComRet.p(INPUT pcComando, OUTPUT lcRetorno).

/* Verifica se o trecho procurado faz parte do retorno */
plEncontrado = INDEX(lcRetorno, pcTrecho) > 0.

RETURN.
