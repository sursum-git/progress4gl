/*
   Procedure: fibonate.p

   Description: Calcula o n-ésimo número de Fibonacci.
*/

DEFINE INPUT  PARAMETER piN AS INTEGER NO-UNDO.
DEFINE OUTPUT PARAMETER piResultado AS INTEGER NO-UNDO.

DEFINE VARIABLE i    AS INTEGER NO-UNDO.
DEFINE VARIABLE a    AS INTEGER NO-UNDO INIT 0.
DEFINE VARIABLE b    AS INTEGER NO-UNDO INIT 1.
DEFINE VARIABLE temp AS INTEGER NO-UNDO.

IF piN < 0 THEN DO:
    /* Número inválido */
    piResultado = ?.
    RETURN.
END.

IF piN = 0 THEN DO:
    piResultado = 0.
    RETURN.
END.

IF piN = 1 THEN DO:
    piResultado = 1.
    RETURN.
END.

DO i = 2 TO piN:
    temp = a + b.
    a = b.
    b = temp.
END.

piResultado = b.

RETURN.
