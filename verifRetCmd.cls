USING Progress.Lang.*.
USING execCmdComRet.

CLASS verifRetCmd:

    /*
       Method: CheckCommand
       Executa um comando utilizando execCmdComRet e retorna
       true caso nao haja erro no comando executado (OS-ERROR = 0).
       O resultado textual do comando e retornado via parametro de saida.
    */
    METHOD PUBLIC STATIC LOGICAL CheckCommand(
        INPUT  pcComando   AS CHARACTER,
        OUTPUT pcResultado AS LONGCHAR):

        pcResultado = execCmdComRet:RunCommand(pcComando).
        RETURN OS-ERROR = 0.
    END METHOD.

END CLASS.
