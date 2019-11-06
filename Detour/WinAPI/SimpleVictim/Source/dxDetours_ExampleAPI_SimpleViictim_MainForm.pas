//Source: https://github.com/darianmiller/dxInjectionDetours
//For demonstration purposes only
unit dxDetours_ExampleAPI_SimpleViictim_MainForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TfrmMain = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.DFM}

procedure TfrmMain.Button1Click(Sender: TObject);
begin
  //Just for demonstration purposes.  This process simply calls the
  //MessageBox windows API method to display the contents of the Memo.
  //
  //Run app and click button before and then after external injection to verify injection success.
  MessageBox(Self.Handle, PChar(Memo1.Text), PChar('Message Box Caption'), MB_OK);
end;

end.
