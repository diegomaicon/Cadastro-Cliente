unit Rotinas;

interface

uses
   System.SysUtils, Email, Cliente ,IdSMTP, IdSSLOpenSSL, IdMessage, IdText, IdAttachmentFile,
   IdExplicitTLSClientServerBase, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
   IdServerIOHandler, IdCoderMIME,  XMLIntf, XMLDoc,ClienteXML;

function  Ret_Numero(Key: Char; Texto: string; EhDecimal: Boolean = False): Char;
function  EnviaEmail(cliente: Tcliente; email: TEmail; anexo:string):Boolean;
function  CriarXML(cliente: Tcliente):string;

implementation

function  Ret_Numero(Key: Char; Texto: string; EhDecimal: Boolean = False): Char;
begin
  if  not EhDecimal then
  begin
    {Chr(8) = Back Space}
    if  not ( Key in ['0'..'9', Chr(8)] ) then
      Key := #0
  end;
  Result := Key;
end;


function EnviaEmail(cliente: Tcliente; email: TEmail; anexo:string):Boolean;
var
  IdSSLIOHandlerSocket: TIdSSLIOHandlerSocketOpenSSL;
  IdSMTP: TIdSMTP;
  IdMessage: TIdMessage;
  IdText: TIdText;
  sAnexo: string;
begin
  IdSSLIOHandlerSocket := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  IdSMTP := TIdSMTP.Create(nil);
  IdMessage := TIdMessage.Create(nil);

  try
    // Configuração do protocolo SSL (TIdSSLIOHandlerSocketOpenSSL)
    IdSSLIOHandlerSocket.SSLOptions.Method := sslvSSLv23;
    IdSSLIOHandlerSocket.SSLOptions.Mode := sslmClient;

    // Configuração do servidor SMTP (TIdSMTP)
    IdSMTP.IOHandler := IdSSLIOHandlerSocket;
    IdSMTP.UseTLS := utUseExplicitTLS;
    IdSMTP.AuthType := satDefault;
    IdSMTP.Port := StrToInt(email.Port);
    IdSMTP.Host := email.Host;
    IdSMTP.Username := email.UserName;
    IdSMTP.Password := email.Password;

    // Configuração da mensagem (TIdMessage)
    IdMessage.From.Address := email.UserName;
    IdMessage.From.Name := 'Processo Seletivo InfoSistemas - DELPHI';
    IdMessage.ReplyTo.EMailAddresses := IdMessage.From.Address;
    IdMessage.Recipients.Add.Text := cliente.Email;
    IdMessage.Subject := 'Cadastro do cliente '+cliente.Nome;
    IdMessage.Encoding := meMIME;

    // Configuração do corpo do email (TIdText)
    IdText := TIdText.Create(IdMessage.MessageParts);
    IdText.Body.Add('Cadastro ');
    IdText.ContentType := 'text/plain; charset=iso-8859-1';

    // Opcional - Anexo da mensagem (TIdAttachmentFile)
    sAnexo := anexo;
    if FileExists(sAnexo) then
    begin
      TIdAttachmentFile.Create(IdMessage.MessageParts, sAnexo);
    end;

    // Conexão e autenticação
    try

      IdSMTP.Connect;
      IdSMTP.Authenticate;
    except
      on E:Exception do
      begin
         raise Exception.Create('Erro na conexão ou autenticação: '+E.Message);
         Result := False;
      end;
    end;

    try
      IdSMTP.ConnectTimeout := 30000;
      IdSMTP.Send(IdMessage);
      Result := True;
    except
      On E:Exception do
      begin
        raise Exception.Create('Erro ao enviar a mensagem: '+E.Message);
        Result := False;
      end;
    end;
  finally
    // libera objetos
    IdSMTP.Disconnect;
    UnLoadOpenSSLLibrary;
    FreeAndNil(IdMessage);
    FreeAndNil(IdSSLIOHandlerSocket);
    FreeAndNil(IdSMTP);
  end;
end;

function  CriarXML(cliente: Tcliente):string;
var
  F: TextFile;
  IClientes: IXMLClientes;
  ICliente :IXMLXmlCliente;
  IEndereco :IXMLXmlEndereco;

  caminho:string;
begin
  try
    caminho :=  ExtractFileDir(GetCurrentDir)+'\'+cliente.Nome+'.xml';
    AssignFile(f,caminho);

    IClientes := NewclientXML;
    ICliente := IClientes.Add;

    ICliente.Nome := cliente.Nome;
    ICliente.Cpf  := cliente.CPF;
    ICliente.Identidade := cliente.Identidade;
    ICliente.Telefone := cliente.Telefone;
    ICliente.Email := cliente.Email;

     ICliente.Endereco.Cep := cliente.CEP;
     ICliente.Endereco.Logradouro := cliente.Logradouro;
     ICliente.Endereco.Numero := cliente.Numero;
     ICliente.Endereco.Complemento := cliente.Complemento;
     ICliente.Endereco.Bairro := cliente.Bairro;
     ICliente.Endereco.Cidade := cliente.Cidade;
     ICliente.Endereco.Estado := cliente.Estado;
     ICliente.Endereco.Pais   := cliente.Pais;

    Rewrite(f);
    Write(f,'<?xml version="1.0" encoding="ISO8859-1"?>'+sLineBreak+IClientes.XML);

  finally
    Closefile(f);
    Result := caminho;
  end;
end;

end.
