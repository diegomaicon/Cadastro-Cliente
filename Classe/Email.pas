unit Email;

interface

Type
  {$M+}
  {$TYPEINFO ON}
TEmail = class
  private
    FHost: String;
    FPort: String;
    FUserName : String;
    FPassword:string;

  protected

  public

  published
    property Host       :String read FHost write FHost;
    property Port       :String read FPort write FPort;
    property UserName   :String read FUserName write FUserName;
    property Password   :String read FPassword write FPassword;

  end;

implementation


{ TCEmail }


end.
