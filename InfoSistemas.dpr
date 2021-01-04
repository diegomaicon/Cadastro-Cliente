program InfoSistemas;

uses
  Vcl.Forms,
  Principal in 'Principal.pas' {FrmPrincipal},
  Cliente in 'Classe\Cliente.pas',
  Rotinas in 'Rotinas.pas',
  Email in 'Classe\Email.pas',
  ClienteXML in 'Classe\ClienteXML.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
