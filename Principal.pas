unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, System.ImageList, Vcl.ImgList, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.WinXCtrls, Vcl.StdCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.StorageBin, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Imaging.pngimage, System.Actions, Vcl.ActnList, Vcl.CategoryButtons,  System.JSON,
  REST.Types, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, Cliente, Email,
  System.TypInfo, Rotinas, Vcl.Mask;

type
  Grud = (tpInsert,tpUpdate,tpDelete);

  TFrmPrincipal = class(TForm)
    PanelCentral: TPanel;
    paginas: TPageControl;
    tabLista: TTabSheet;
    tabCadastro: TTabSheet;
    PanelSuperior: TPanel;
    DBGrid1: TDBGrid;
    tabHome: TTabSheet;
    Label1: TLabel;
    edtBusca: TEdit;
    FDClientes: TFDMemTable;
    dsBusca: TDataSource;
    FDClientesID: TIntegerField;
    FDClientesNOME: TStringField;
    FDClientesIDENTIDADE: TStringField;
    FDClientesCPF: TStringField;
    FDClientesTELEFONE: TStringField;
    FDClientesEMAIL: TStringField;
    FDClientesLOGRADOURO: TStringField;
    FDClientesNUMERO: TStringField;
    FDClientesCOMPLEMENTO: TStringField;
    FDClientesBAIRRO: TStringField;
    FDClientesCIDADE: TStringField;
    FDClientesESTADO: TStringField;
    FDClientesPAIS: TStringField;
    SV: TSplitView;
    catMenuItems: TCategoryButtons;
    imlIcons: TImageList;
    ActionList1: TActionList;
    actHome: TAction;
    actCliente: TAction;
    actLimpaBanco: TAction;
    imgMenu: TImage;
    lblTitle: TLabel;
    pnlToolbar: TPanel;
    Image1: TImage;
    Panel1: TPanel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtRG: TEdit;
    edtEmail: TEdit;
    Label3: TLabel;
    Label6: TLabel;
    GroupBox1: TGroupBox;
    edtNome: TEdit;
    Panel2: TPanel;
    bnCancel_exclui: TButton;
    btnSalvar: TButton;
    Label7: TLabel;
    Image2: TImage;
    edtLogradouro: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    edtNumero: TEdit;
    Label10: TLabel;
    edtComplemento: TEdit;
    Label11: TLabel;
    edtBairro: TEdit;
    Label12: TLabel;
    edtCidade: TEdit;
    Label13: TLabel;
    edtPais: TEdit;
    Label14: TLabel;
    edtUF: TEdit;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    Panel3: TPanel;
    btnFechar: TButton;
    btnDeletar: TButton;
    btnEditar: TButton;
    btnIncluir: TButton;
    FDClientesCEP: TStringField;
    lblBusca: TLabel;
    tabEmail: TTabSheet;
    GroupBox2: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    edtPort: TEdit;
    edtHost: TEdit;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    Panel4: TPanel;
    btnFechaEmail: TButton;
    BtnSalvaEmail: TButton;
    actEmail: TAction;
    Image3: TImage;
    btnFiltrar: TImage;
    edtCPF: TMaskEdit;
    edtTelefone: TMaskEdit;
    edtCep: TMaskEdit;
    procedure Image1Click(Sender: TObject);
    procedure actHomeExecute(Sender: TObject);
    procedure actClienteExecute(Sender: TObject);
    procedure actLimpaBancoExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure bnCancel_excluiClick(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure edtCPFKeyPress(Sender: TObject; var Key: Char);
    procedure edtRGKeyPress(Sender: TObject; var Key: Char);
    procedure edtTelefoneKeyPress(Sender: TObject; var Key: Char);
    procedure edtCepKeyPress(Sender: TObject; var Key: Char);
    procedure actEmailExecute(Sender: TObject);
    procedure edtPortKeyPress(Sender: TObject; var Key: Char);
    procedure BtnSalvaEmailClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Image3Click(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure edtBuscaExit(Sender: TObject);
    procedure catMenuItemsCategoryCollapase(Sender: TObject; const Category: TButtonCategory);



  private
    { Private declarations }

    FCliente: TCliente;
    FEmail:  TEmail;

    property cliente: TCliente read FCliente write FCliente;
    property emailConfig: TEmail read FEmail write FEmail;

    procedure BuscaCep(cep:string);
    procedure Salvar(cli: TCliente);
    function  BuscaPrimarykey:integer;
    procedure FechaCadastro;
    procedure AbreCadastro;
    procedure LimpaCampos;


  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}


procedure TFrmPrincipal.actClienteExecute(Sender: TObject);
begin
   tabLista.TabVisible := True;
   paginas.ActivePage := tabLista;
end;

procedure TFrmPrincipal.actEmailExecute(Sender: TObject);
begin
  tabEmail.TabVisible := True;
  paginas.ActivePage := tabEmail;
  if edtPort.CanFocus then edtPort.SetFocus;

  if Assigned(emailConfig) then
  begin
    edtPort.Text :=  emailConfig.Port;
    edtHost.Text := emailConfig.Host;
    edtUsuario.Text :=  emailConfig.UserName;
    edtSenha.Text :=  emailConfig.Password;
  end;
end;

procedure TFrmPrincipal.actHomeExecute(Sender: TObject);
begin
  paginas.ActivePage := tabHome;
end;

procedure TFrmPrincipal.actLimpaBancoExecute(Sender: TObject);
begin
  if not FDClientes.Active then
    FDClientes.Open;

  If Application.MessageBox('Deseja realmente limpar banco ?','Atenção',52)=7 then
    Exit;

  FDClientes.EmptyDataSet;
  FechaCadastro;
  paginas.ActivePage := tabLista;
  MessageDlg(' Banco limpo com sucesso. ',mtInformation,[mbOk],0);

end;

procedure TFrmPrincipal.bnCancel_excluiClick(Sender: TObject);
begin
  tabEmail.TabVisible := false;
end;

procedure TFrmPrincipal.btnSalvarClick(Sender: TObject);
var
  arquivo:string;
begin
  try
    cliente.Nome       := edtNome.Text;
    cliente.CPF        := edtCPF.Text;
    cliente.Identidade := edtRG.Text;
    cliente.Telefone   := edtTelefone.Text;
    cliente.Email      := edtEmail.Text;
    cliente.CEP        := edtCep.Text;
    cliente.Logradouro := edtLogradouro.Text;
    cliente.Numero     := edtNumero.Text;
    cliente.Complemento := edtComplemento.Text;
    cliente.Bairro     := edtBairro.Text;
    cliente.Cidade     := edtCidade.Text;
    cliente.Estado     := edtUF.Text;
    cliente.Pais       := edtPais.Text;
  except on E: Exception do
    begin
      MessageDlg(E.Message, mtWarning,[mbOk],0);
      if Pos ('CPF', E.Message) > 0 then
      begin
        if edtCPF.CanFocus then edtCPF.SetFocus;
      end
      else
      if Pos ('NOME',UpperCase(E.Message)) > 0 then
      begin
        if edtNome.CanFocus then edtNome.SetFocus;
      end;

      exit;
    end;
  end;

  Salvar(cliente);

  if Assigned(emailConfig) and (cliente.Email <> EmptyStr) then
  begin
    If not(Application.MessageBox('Deseja enviar email de cadastro para cliente ?','Atenção',52)=7) then
    begin
      try
        arquivo := CriarXML(cliente);
        if EnviaEmail(cliente, emailConfig, arquivo) then
        begin
          if FileExists(arquivo) then
             DeleteFile(arquivo);

          MessageDlg(' Email enviado para '+cliente.Email,mtInformation,[mbOk],0);
        end;
      except on E: Exception do
        MessageDlg(' Falha ao enviar email. Erro: '+E.Message, mtError,[mbOk],0);
      end;
    end;
  end;
  FechaCadastro;

end;

procedure TFrmPrincipal.btnDeletarClick(Sender: TObject);
begin
  try
    If Application.MessageBox('Deseja realmente deletar cliente ?','Atenção',52)=7 then
      Exit;

    FDClientes.Delete;

  except on E: Exception do
    MessageDlg(' Falha ao deletar cliente. Erro: '+E.Message, mtError,[mbOk],0);
  end;
end;

procedure TFrmPrincipal.btnEditarClick(Sender: TObject);
var
  i:Word;
  ListaPropriedades: TPropList;
  Valor: variant;
begin
  AbreCadastro;

  for i := 0 to FDClientes.Fields.Count - 1 do
  begin
    if IsPublishedProp(cliente, FDClientes.Fields[i].FieldName)   then
      SetPropValue(cliente,FDClientes.Fields[i].FieldName, FDClientes.Fields[i].Value);
  end;

  edtNome.Text     := cliente.Nome;
  edtCPF.Text      := cliente.CPF;
  edtRG.Text       := cliente.Identidade;
  edtTelefone.Text := cliente.Telefone;
  edtEmail.Text    := cliente.Email;
  edtCep.Text      := cliente.CEP;
  edtLogradouro.Text  := cliente.Logradouro;
  edtNumero.Text      := cliente.Numero;
  edtComplemento.Text := cliente.Complemento;
  edtBairro.Text   := cliente.Bairro;
  edtCidade.Text   := cliente.Cidade;
  edtUF.Text       := cliente.Estado;
  edtPais.Text     := cliente.Pais;
end;

procedure TFrmPrincipal.btnFecharClick(Sender: TObject);
begin
  tabLista.TabVisible := False;
end;

procedure TFrmPrincipal.btnFiltrarClick(Sender: TObject);
begin
  if Trim(edtBusca.Text) <> '' then
  begin
    FDClientes.Filtered := False;
    FDClientes.Filter   := 'NOme like ' + QuotedStr('%' + edtBusca.Text + '%');
    FDClientes.Filtered := True;
  end;
end;

procedure TFrmPrincipal.edtBuscaExit(Sender: TObject);
begin
   if Trim(edtBusca.Text) = '' then
  begin
    FDClientes.Filtered := False;
    FDClientes.Filter   := '';
    FDClientes.Filtered := True;
  end;
end;

procedure TFrmPrincipal.btnIncluirClick(Sender: TObject);
begin
  AbreCadastro
end;

procedure TFrmPrincipal.BtnSalvaEmailClick(Sender: TObject);
begin
  emailConfig := TEmail.Create;
  emailConfig.Port := edtPort.Text;
  emailConfig.Host := edtHost.Text;
  emailConfig.UserName := edtUsuario.Text;
  emailConfig.Password := edtSenha.Text;

  tabEmail.TabVisible := False;
  paginas.ActivePage := tabHome;
end;

procedure TFrmPrincipal.FechaCadastro;
begin
  tabCadastro.TabVisible := False;
  tabLista.TabVisible := True;
  paginas.ActivePage := tabLista;
  cliente.Free;
  LimpaCampos;
end;

procedure TFrmPrincipal.AbreCadastro;
begin
  tabCadastro.TabVisible := True;
  tabLista.TabVisible := False;
  paginas.ActivePage := tabCadastro;
  cliente := TCliente.Create;
end;

procedure TFrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  emailConfig.Free;
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
  FDClientes.Open;
  tabCadastro.TabVisible := False;
  tabLista.TabVisible    := False;
  tabEmail.TabVisible    := False;
  paginas.ActivePage     := tabHome;
end;

procedure TFrmPrincipal.Image1Click(Sender: TObject);
begin
  if SV.Opened then
    SV.Close
  else
    SV.Open;
end;

procedure TFrmPrincipal.Image2Click(Sender: TObject);
begin
   try
      lblBusca.Visible := True;
      Application.ProcessMessages;
      BuscaCep(edtCep.Text)
   finally
      lblBusca.Visible := False;
   end;
end;

procedure TFrmPrincipal.Image3Click(Sender: TObject);
begin
  FrmPrincipal.Close;
end;

procedure TFrmPrincipal.LimpaCampos;
var
  i:Word;
begin
  for i := 0 to FrmPrincipal.ComponentCount - 1 do
  begin
    if FrmPrincipal.Components[i] is TEdit then
    TEdit(FrmPrincipal.Components[i]).Text := '';
  end;
end;

procedure TFrmPrincipal.Salvar(cli: TCliente);
var
 i:Word;
begin
  if not FDClientes.Active then
    FDClientes.Open;

  try
    if cli.ID = 0 then
    begin
      cliente.ID := BuscaPrimarykey;
      FDClientes.Append;
    end
    else
    begin
      FDClientes.Edit;
    end;

    with FDClientes do
    begin
      for i := 0 to FDClientes.Fields.Count - 1 do
      begin
        if IsPublishedProp(cliente, FDClientes.Fields[i].FieldName)   then
           FDClientes.Fields[i].Value := GetPropValue(cliente, FDClientes.Fields[i].FieldName, True);
      end;
    end;
  finally
    FDClientes.Post;
  end;

end;

procedure TFrmPrincipal.BuscaCep(cep:string);
var
    retorno:TJSONObject;
begin
  try
    if Length(cep) < 7 then
    begin
      MessageDlg(' Cep inválido. ',mtInformation,[mbOk],0);
      edtCep.SetFocus;
      Exit;
    end
    else
    begin
      try
        RESTClient1.BaseURL := 'https://viacep.com.br/ws/'+cep+'/json/';
        RESTRequest1.Accept := 'application/json';
        RESTRequest1.Execute;
        retorno := RESTRequest1.Response.JSONValue as TJSONObject;

      except on E: Exception do
        MessageDlg(' Problema ao cuscar cep !'+E.ToString,mtInformation,[mbOk],0);
      end;

      if Assigned(retorno.GetValue('localidade'))  then
      begin
         edtCidade.Text   := retorno.GetValue('localidade').Value;
         edtUF.Text       := retorno.GetValue('uf').Value;
         if retorno.GetValue('logradouro') <> nil then
              edtLogradouro.Text := retorno.GetValue('logradouro').Value;
         if retorno.GetValue('bairro') <> nil then
              edtBairro.Text   :=  retorno.GetValue('bairro').Value ;
         if retorno.GetValue('complemento') <> nil then
              edtComplemento.Text   :=  retorno.GetValue('complemento').Value ;
      end
      else
      begin
          MessageDlg(' Cep não encontrado !',mtInformation,[mbOk],0);
          edtCep.SetFocus;

          Exit;
      end;

    end;
  except on E: Exception do
      MessageDlg(' Problema ao cuscar cep !'+E.ToString,mtInformation,[mbOk],0);
  end;
end;

function TFrmPrincipal.BuscaPrimarykey: integer;
begin
  if not FDClientes.Active then
    FDClientes.Open;

   FDClientes.Last;
   if not FDClientes.IsEmpty then
     Result := FDClientes.FieldByName('ID').AsInteger + 1
   else
      Result := 1;
end;

procedure TFrmPrincipal.catMenuItemsCategoryCollapase(Sender: TObject; const Category: TButtonCategory);
begin
  catMenuItems.Categories[0].Collapsed := false;
end;

procedure TFrmPrincipal.edtPortKeyPress(Sender: TObject; var Key: Char);
begin
  Key := Ret_Numero(Key, edtTelefone.Text);
end;

procedure TFrmPrincipal.edtCepKeyPress(Sender: TObject; var Key: Char);
begin
  Key := Ret_Numero(Key, edtCep.Text);
end;

procedure TFrmPrincipal.edtCPFKeyPress(Sender: TObject; var Key: Char);
begin
  Key := Ret_Numero( Key, edtCPF.Text);
end;

procedure TFrmPrincipal.edtRGKeyPress(Sender: TObject; var Key: Char);
begin
  Key := Ret_Numero(Key, edtRG.Text);
end;

procedure TFrmPrincipal.edtTelefoneKeyPress(Sender: TObject; var Key: Char);
begin
  Key := Ret_Numero(Key, edtTelefone.Text);
end;

end.
