/*
   Procedure: execCmdComRet.p
   Description: Executa um comando de sistema via OS-COMMAND e 
                retorna a saida completa do comando no parametro de saida.
*/

DEFINE INPUT  PARAMETER pcComando AS CHARACTER NO-UNDO.
DEFINE OUTPUT PARAMETER pcResultado AS LONGCHAR NO-UNDO.

DEFINE VARIABLE cTempFile AS CHARACTER NO-UNDO.
DEFINE VARIABLE cLinha    AS CHARACTER NO-UNDO.

/* Gera arquivo temporario para capturar o retorno */
ASSIGN cTempFile = TEMP-DIR + "/execCmdRet_" + STRING(RANDOM(10000,99999)) + ".tmp".

/* Executa o comando redirecionando a saida para o arquivo temporario */
OS-COMMAND SILENT VALUE(pcComando + " > \"" + cTempFile + "\" 2>&1").

/* Le o conteudo gerado pelo comando */
pcResultado = "".
INPUT FROM VALUE(cTempFile) NO-ECHO.
REPEAT WHILE TRUE:
    IMPORT UNFORMATTED cLinha NO-ERROR.
    IF ERROR-STATUS:NUM-MESSAGES > 0 THEN LEAVE.
    pcResultado = pcResultado + cLinha + CHR(10).
END.
INPUT CLOSE.

/* Remove o arquivo temporario */
OS-DELETE VALUE(cTempFile) NO-ERROR.

RETURN.
