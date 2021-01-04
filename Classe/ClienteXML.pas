
{***************************************************************************}
{                                                                           }
{                             XML Data Binding                              }
{                                                                           }
{         Generated on: 02/01/2021 12:40:35                                 }
{       Generated from: D:\DEll antigo\CURSOS\InfoSistemas\ClienteXML.xsd   }
{   Settings stored in: D:\DEll antigo\CURSOS\InfoSistemas\ClienteXML.xdb   }
{                                                                           }
{***************************************************************************}

unit ClienteXML;

interface

uses Xml.xmldom, Xml.XMLDoc, Xml.XMLIntf;

type

{ Forward Decls }

  IXMLClientes = interface;
  IXMLXmlCliente = interface;
  IXMLXmlEndereco = interface;

{ IXMLClientes }

  IXMLClientes = interface(IXMLNodeCollection)
    ['{894844EF-B4AB-469D-B5AF-06445E4A2CEB}']
    { Property Accessors }
    function Get_ClientXML(Index: Integer): IXMLXmlCliente;
    { Methods & Properties }
    function Add: IXMLXmlCliente;
    function Insert(const Index: Integer): IXMLXmlCliente;
    property ClientXML[Index: Integer]: IXMLXmlCliente read Get_ClientXML; default;
  end;

{ IXMLXmlCliente }

  IXMLXmlCliente = interface(IXMLNode)
    ['{2B55C71C-01F5-4D7C-B46A-BA74DC90642B}']
    { Property Accessors }
    function Get_Nome: UnicodeString;
    function Get_Cpf: UnicodeString;
    function Get_Identidade: UnicodeString;
    function Get_Telefone: UnicodeString;
    function Get_Email: UnicodeString;
    function Get_Endereco: IXMLXmlEndereco;
    procedure Set_Nome(Value: UnicodeString);
    procedure Set_Cpf(Value: UnicodeString);
    procedure Set_Identidade(Value: UnicodeString);
    procedure Set_Telefone(Value: UnicodeString);
    procedure Set_Email(Value: UnicodeString);
    { Methods & Properties }
    property Nome: UnicodeString read Get_Nome write Set_Nome;
    property Cpf: UnicodeString read Get_Cpf write Set_Cpf;
    property Identidade: UnicodeString read Get_Identidade write Set_Identidade;
    property Telefone: UnicodeString read Get_Telefone write Set_Telefone;
    property Email: UnicodeString read Get_Email write Set_Email;
    property Endereco: IXMLXmlEndereco read Get_Endereco;
  end;

{ IXMLXmlEndereco }

  IXMLXmlEndereco = interface(IXMLNode)
    ['{9DE9FDCE-BFB9-45F4-88EE-4BD268914C57}']
    { Property Accessors }
    function Get_Cep: UnicodeString;
    function Get_Logradouro: UnicodeString;
    function Get_Numero: UnicodeString;
    function Get_Complemento: UnicodeString;
    function Get_Bairro: UnicodeString;
    function Get_Cidade: UnicodeString;
    function Get_Estado: UnicodeString;
    function Get_Pais: UnicodeString;
    procedure Set_Cep(Value: UnicodeString);
    procedure Set_Logradouro(Value: UnicodeString);
    procedure Set_Numero(Value: UnicodeString);
    procedure Set_Complemento(Value: UnicodeString);
    procedure Set_Bairro(Value: UnicodeString);
    procedure Set_Cidade(Value: UnicodeString);
    procedure Set_Estado(Value: UnicodeString);
    procedure Set_Pais(Value: UnicodeString);
    { Methods & Properties }
    property Cep: UnicodeString read Get_Cep write Set_Cep;
    property Logradouro: UnicodeString read Get_Logradouro write Set_Logradouro;
    property Numero: UnicodeString read Get_Numero write Set_Numero;
    property Complemento: UnicodeString read Get_Complemento write Set_Complemento;
    property Bairro: UnicodeString read Get_Bairro write Set_Bairro;
    property Cidade: UnicodeString read Get_Cidade write Set_Cidade;
    property Estado: UnicodeString read Get_Estado write Set_Estado;
    property Pais: UnicodeString read Get_Pais write Set_Pais;
  end;

{ Forward Decls }

  TXMLClientes = class;
  TXMLXmlCliente = class;
  TXMLXmlEndereco = class;

{ TXMLClientes }

  TXMLClientes = class(TXMLNodeCollection, IXMLClientes)
  protected
    { IXMLClientes }
    function Get_ClientXML(Index: Integer): IXMLXmlCliente;
    function Add: IXMLXmlCliente;
    function Insert(const Index: Integer): IXMLXmlCliente;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLXmlCliente }

  TXMLXmlCliente = class(TXMLNode, IXMLXmlCliente)
  protected
    { IXMLXmlCliente }
    function Get_Nome: UnicodeString;
    function Get_Cpf: UnicodeString;
    function Get_Identidade: UnicodeString;
    function Get_Telefone: UnicodeString;
    function Get_Email: UnicodeString;
    function Get_Endereco: IXMLXmlEndereco;
    procedure Set_Nome(Value: UnicodeString);
    procedure Set_Cpf(Value: UnicodeString);
    procedure Set_Identidade(Value: UnicodeString);
    procedure Set_Telefone(Value: UnicodeString);
    procedure Set_Email(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLXmlEndereco }

  TXMLXmlEndereco = class(TXMLNode, IXMLXmlEndereco)
  protected
    { IXMLXmlEndereco }
    function Get_Cep: UnicodeString;
    function Get_Logradouro: UnicodeString;
    function Get_Numero: UnicodeString;
    function Get_Complemento: UnicodeString;
    function Get_Bairro: UnicodeString;
    function Get_Cidade: UnicodeString;
    function Get_Estado: UnicodeString;
    function Get_Pais: UnicodeString;
    procedure Set_Cep(Value: UnicodeString);
    procedure Set_Logradouro(Value: UnicodeString);
    procedure Set_Numero(Value: UnicodeString);
    procedure Set_Complemento(Value: UnicodeString);
    procedure Set_Bairro(Value: UnicodeString);
    procedure Set_Cidade(Value: UnicodeString);
    procedure Set_Estado(Value: UnicodeString);
    procedure Set_Pais(Value: UnicodeString);
  end;

{ Global Functions }

function GetclientXML(Doc: IXMLDocument): IXMLClientes;
function LoadclientXML(const FileName: string): IXMLClientes;
function NewclientXML: IXMLClientes;

const
  TargetNamespace = '';

implementation

uses Xml.xmlutil;

{ Global Functions }

function GetclientXML(Doc: IXMLDocument): IXMLClientes;
begin
  Result := Doc.GetDocBinding('clientXML', TXMLClientes, TargetNamespace) as IXMLClientes;
end;

function LoadclientXML(const FileName: string): IXMLClientes;
begin
  Result := LoadXMLDocument(FileName).GetDocBinding('clientXML', TXMLClientes, TargetNamespace) as IXMLClientes;
end;

function NewclientXML: IXMLClientes;
begin
  Result := NewXMLDocument.GetDocBinding('clientXML', TXMLClientes, TargetNamespace) as IXMLClientes;
end;

{ TXMLClientes }

procedure TXMLClientes.AfterConstruction;
begin
  RegisterChildNode('clientXML', TXMLXmlCliente);
  ItemTag := 'clientXML';
  ItemInterface := IXMLXmlCliente;
  inherited;
end;

function TXMLClientes.Get_ClientXML(Index: Integer): IXMLXmlCliente;
begin
  Result := List[Index] as IXMLXmlCliente;
end;

function TXMLClientes.Add: IXMLXmlCliente;
begin
  Result := AddItem(-1) as IXMLXmlCliente;
end;

function TXMLClientes.Insert(const Index: Integer): IXMLXmlCliente;
begin
  Result := AddItem(Index) as IXMLXmlCliente;
end;

{ TXMLXmlCliente }

procedure TXMLXmlCliente.AfterConstruction;
begin
  RegisterChildNode('endereco', TXMLXmlEndereco);
  inherited;
end;

function TXMLXmlCliente.Get_Nome: UnicodeString;
begin
  Result := ChildNodes['nome'].Text;
end;

procedure TXMLXmlCliente.Set_Nome(Value: UnicodeString);
begin
  ChildNodes['nome'].NodeValue := Value;
end;

function TXMLXmlCliente.Get_Cpf: UnicodeString;
begin
  Result := ChildNodes['cpf'].Text;
end;

procedure TXMLXmlCliente.Set_Cpf(Value: UnicodeString);
begin
  ChildNodes['cpf'].NodeValue := Value;
end;

function TXMLXmlCliente.Get_Identidade: UnicodeString;
begin
  Result := ChildNodes['identidade'].Text;
end;

procedure TXMLXmlCliente.Set_Identidade(Value: UnicodeString);
begin
  ChildNodes['identidade'].NodeValue := Value;
end;

function TXMLXmlCliente.Get_Telefone: UnicodeString;
begin
  Result := ChildNodes['telefone'].Text;
end;

procedure TXMLXmlCliente.Set_Telefone(Value: UnicodeString);
begin
  ChildNodes['telefone'].NodeValue := Value;
end;

function TXMLXmlCliente.Get_Email: UnicodeString;
begin
  Result := ChildNodes['email'].Text;
end;

procedure TXMLXmlCliente.Set_Email(Value: UnicodeString);
begin
  ChildNodes['email'].NodeValue := Value;
end;

function TXMLXmlCliente.Get_Endereco: IXMLXmlEndereco;
begin
  Result := ChildNodes['endereco'] as IXMLXmlEndereco;
end;

{ TXMLXmlEndereco }

function TXMLXmlEndereco.Get_Cep: UnicodeString;
begin
  Result := ChildNodes['cep'].Text;
end;

procedure TXMLXmlEndereco.Set_Cep(Value: UnicodeString);
begin
  ChildNodes['cep'].NodeValue := Value;
end;

function TXMLXmlEndereco.Get_Logradouro: UnicodeString;
begin
  Result := ChildNodes['logradouro'].Text;
end;

procedure TXMLXmlEndereco.Set_Logradouro(Value: UnicodeString);
begin
  ChildNodes['logradouro'].NodeValue := Value;
end;

function TXMLXmlEndereco.Get_Numero: UnicodeString;
begin
  Result := ChildNodes['numero'].Text;
end;

procedure TXMLXmlEndereco.Set_Numero(Value: UnicodeString);
begin
  ChildNodes['numero'].NodeValue := Value;
end;

function TXMLXmlEndereco.Get_Complemento: UnicodeString;
begin
  Result := ChildNodes['complemento'].Text;
end;

procedure TXMLXmlEndereco.Set_Complemento(Value: UnicodeString);
begin
  ChildNodes['complemento'].NodeValue := Value;
end;

function TXMLXmlEndereco.Get_Bairro: UnicodeString;
begin
  Result := ChildNodes['bairro'].Text;
end;

procedure TXMLXmlEndereco.Set_Bairro(Value: UnicodeString);
begin
  ChildNodes['bairro'].NodeValue := Value;
end;

function TXMLXmlEndereco.Get_Cidade: UnicodeString;
begin
  Result := ChildNodes['cidade'].Text;
end;

procedure TXMLXmlEndereco.Set_Cidade(Value: UnicodeString);
begin
  ChildNodes['cidade'].NodeValue := Value;
end;

function TXMLXmlEndereco.Get_Estado: UnicodeString;
begin
  Result := ChildNodes['estado'].Text;
end;

procedure TXMLXmlEndereco.Set_Estado(Value: UnicodeString);
begin
  ChildNodes['estado'].NodeValue := Value;
end;

function TXMLXmlEndereco.Get_Pais: UnicodeString;
begin
  Result := ChildNodes['pais'].Text;
end;

procedure TXMLXmlEndereco.Set_Pais(Value: UnicodeString);
begin
  ChildNodes['pais'].NodeValue := Value;
end;

end.