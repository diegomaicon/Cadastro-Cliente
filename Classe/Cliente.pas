unit Cliente;

interface
  uses System.Math, System.SysUtils;

  Type
  {$M+}
  {$TYPEINFO ON}
  TCliente = class
  private
    FID: Integer;
    FNome: String;
    FCPF: String;
    FIdentidade:string;
    FTelefone: String;
    FEmail :string;
    FCEP: String;
    FLogradouro: String;
    FBairro: String;
    FNumero: String;
    FComplemento: string;
    FCidade: String;
    FEstado: string;
    FPais: string;

   {Metodo de validação do CPF}
    procedure SetCPF(const Value: String);
    procedure SetNome(const Value: String);
    function  ValidCPF(pCPF: string): Boolean;
 protected

  public

  published
    property ID         :Integer read FID write FID;
    property Nome       :String read FNome write SetNome;
    property CPF        :String read FCPF write SetCPF;
    property Identidade :String read FIdentidade write FIdentidade;
    property Telefone   :String read FTelefone write FTelefone;
    property Email      :String read FEmail write FEmail;
    property CEP        :String read FCEP write FCEP;
    property Logradouro :String read FLogradouro write FLogradouro;
    property Numero     :string read FNumero write FNumero;
    property Complemento:string read FComplemento write FComplemento;
    property Bairro     :String read FBairro write FBairro;
    property Cidade     :String read FCidade write FCidade;
    property Estado     :string read FEstado write FEstado;
    property Pais       :string read FPais write FPais;
  end;

implementation


{ TCliente }

procedure TCliente.SetCPF(const Value: String);
begin
  If ValidCPF(Value) Then
     FCPF := Value
  else
    raise Exception.Create('CPF inválido');
end;

procedure TCliente.SetNome(const Value: String);
begin
  If Value <> EmptyStr Then
     FNome := Value
  else
    raise Exception.Create('Campo Nome vazio.');
end;

function TCliente.ValidCPF(pCPF: string): Boolean;
var
  v: array [0 .. 1] of Word;
  cpf: array [0 .. 10] of Byte;
  I: Byte;
begin
  Result := False;

  { Verificando se tem 11 caracteres }
  if Length(pCPF) <> 11 then
  begin
    Exit;
  end;

  { Conferindo se todos dígitos são iguais }
  if pCPF = StringOfChar('0', 11) then
    Exit;

  if pCPF = StringOfChar('1', 11) then
    Exit;

  if pCPF = StringOfChar('2', 11) then
    Exit;

  if pCPF = StringOfChar('3', 11) then
    Exit;

  if pCPF = StringOfChar('4', 11) then
    Exit;

  if pCPF = StringOfChar('5', 11) then
    Exit;

  if pCPF = StringOfChar('6', 11) then
    Exit;

  if pCPF = StringOfChar('7', 11) then
    Exit;

  if pCPF = StringOfChar('8', 11) then
    Exit;

  if pCPF = StringOfChar('9', 11) then
    Exit;

  try
    for I := 1 to 11 do
      cpf[I - 1] := StrToInt(pCPF[I]);
    // Nota: Calcula o primeiro dígito de verificação.
    v[0] := 10 * cpf[0] + 9 * cpf[1] + 8 * cpf[2];
    v[0] := v[0] + 7 * cpf[3] + 6 * cpf[4] + 5 * cpf[5];
    v[0] := v[0] + 4 * cpf[6] + 3 * cpf[7] + 2 * cpf[8];
    v[0] := 11 - v[0] mod 11;
    v[0] := IfThen(v[0] >= 10, 0, v[0]);
    // Nota: Calcula o segundo dígito de verificação.
    v[1] := 11 * cpf[0] + 10 * cpf[1] + 9 * cpf[2];
    v[1] := v[1] + 8 * cpf[3] + 7 * cpf[4] + 6 * cpf[5];
    v[1] := v[1] + 5 * cpf[6] + 4 * cpf[7] + 3 * cpf[8];
    v[1] := v[1] + 2 * v[0];
    v[1] := 11 - v[1] mod 11;
    v[1] := IfThen(v[1] >= 10, 0, v[1]);
    // Nota: Verdadeiro se os dígitos de verificação são os esperados.
    Result := ((v[0] = cpf[9]) and (v[1] = cpf[10]));
  except
    on E: Exception do
      Result := False;
  end;
end;

end.
