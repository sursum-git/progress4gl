USING Progress.Lang.*.

CLASS execCmdComRet:

    /*
       Method: RunCommand
       Executa um comando de sistema e retorna o texto de saida
       completo como LONGCHAR.
    */
    METHOD PUBLIC STATIC LONGCHAR RunCommand(INPUT pcComando AS CHARACTER):
        DEFINE VARIABLE cTempFile    AS CHARACTER NO-UNDO.
        DEFINE VARIABLE cLinha       AS CHARACTER NO-UNDO.
        DEFINE VARIABLE lcResultado  AS LONGCHAR  NO-UNDO.

        ASSIGN cTempFile = SESSION:TEMP-DIR + "/execCmdRet_" +
                           STRING(RANDOM(10000,99999)) + ".tmp".

        OS-COMMAND SILENT VALUE(pcComando + " > " + cTempFile + " 2>&1").

        lcResultado = "".
        INPUT FROM VALUE(cTempFile) NO-ECHO.
        REPEAT WHILE TRUE:
            IMPORT UNFORMATTED cLinha NO-ERROR.
            IF ERROR-STATUS:NUM-MESSAGES > 0 THEN LEAVE.
            lcResultado = lcResultado + cLinha + CHR(10).
        END.
        INPUT CLOSE.

        OS-DELETE VALUE(cTempFile) NO-ERROR.

        RETURN lcResultado.
    END METHOD.

END CLASS.
