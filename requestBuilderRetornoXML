USING OpenEdge.Net.HTTP.*.
USING OpenEdge.Net.URI.
USING Progress.Json.ObjectModel.*.
USING OpenEdge.Core.WidgetHandle FROM PROPATH.
 
DEFINE VARIABLE oLib      AS IHttpClientLibrary NO-UNDO. 
DEFINE VARIABLE resposta  AS OpenEdge.Core.String NO-UNDO.
DEFINE VAR lcConteudo     AS LONGCHAR    NO-UNDO.

DEFINE VARIABLE oURI      AS URI NO-UNDO.
DEFINE VARIABLE oRequest  AS IHttpRequest NO-UNDO. 
DEFINE VARIABLE oClient   AS IHttpClient NO-UNDO.
DEFINE VARIABLE oResponse AS IHttpResponse NO-UNDO.
def var retOK as log no-undo.


//Build a request
oURI = URI:Parse("https://s3.us-east-1.amazonaws.com/xml.anymarket.com.br/259060803.1681992682024-06-04T17:13:31.720.xml").
oRequest = RequestBuilder:GET(oURI):Request.


{xsd/nfe_v4_2023_04.i}
dataset nfeProcDset:empty-dataset no-error.


//Execute a request
oClient = ClientBuilder:Build():Client.
oResponse = oClient:Execute(oRequest).

//Process the response
IF oResponse:StatusCode <> 200 THEN
    RETURN ERROR "Request Error: " + STRING(oResponse:StatusCode).
ELSE
    MESSAGE oResponse:ContentType
        VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.
   
assign retOK = dataset nfeProcDset:read-xml("handle",
                                     CAST(oResponse:Entity, WidgetHandle):Value,
                                     "empty",
                                     ?,
                                     ?,
                                     ?,
                                     "ignore")
                                     no-error.


if retOK = no then
   MESSAGE 'Schema não é compatível com o Arquivo XML'
       VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.
