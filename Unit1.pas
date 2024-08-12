//------------------------------------------------------------------------------------------------------------
//********* Sobre ************
//Autor: Gisele de Melo
//Esse código foi desenvolvido com o intuito de aprendizado para o blog codedelphi.com, portanto não me
//responsabilizo pelo uso do mesmo.
//
//********* About ************
//Author: Gisele de Melo
//This code was developed for learning purposes for the codedelphi.com blog, therefore I am not responsible for
//its use.
//------------------------------------------------------------------------------------------------------------
unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.JSON;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    JSONStr : String;

    procedure CriarJSON;
    procedure LerJSON(const JSONString: string);
    procedure ModificarJSON(var JSONString: string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  CriarJSON;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  LerJSON(JSONStr);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  ModificarJSON(JSONStr);
  LerJSON(JSONStr);
end;

procedure TForm1.CriarJSON;
var
  JSONObj: TJSONObject;
  JSONArray: TJSONArray;
begin
  JSONObj := TJSONObject.Create;
  try
    JSONObj.AddPair('nome', 'João');
    JSONObj.AddPair('idade', TJSONNumber.Create(30));

    JSONArray := TJSONArray.Create;
    JSONArray.Add('Delphi');
    JSONArray.Add('JavaScript');
    JSONArray.Add('SQL');

    JSONObj.AddPair('habilidades', JSONArray);

    JSONStr := JSONObj.ToString;

    ShowMessage('Arquivo JSON criado com sucesso.');
  finally
    JSONObj.Free;
  end;
end;

procedure TForm1.LerJSON(const JSONString: string);
var
  JSONObj: TJSONObject;
  Habilidades: TJSONArray;
  I: Integer;
begin
  JSONObj := TJSONObject.ParseJSONValue(JSONString) as TJSONObject;
  try
    Memo1.Clear;
    if Assigned(JSONObj) then
    begin
      Memo1.Lines.Add('Nome: '+ JSONObj.GetValue('nome').Value);
      Memo1.Lines.Add('Idade: '+ JSONObj.GetValue('idade').Value);

      Habilidades := JSONObj.GetValue('habilidades') as TJSONArray;
      Memo1.Lines.Add('Habilidades:');
      for I := 0 to Habilidades.Count - 1 do
      begin
        Memo1.Lines.Add(' - '+ Habilidades.Items[I].Value);
      end;
    end;
  finally
    JSONObj.Free;
  end;
end;

procedure TForm1.ModificarJSON(var JSONString: string);
var
  JSONObj: TJSONObject;
begin
  JSONObj := TJSONObject.ParseJSONValue(JSONString) as TJSONObject;
  try
    if Assigned(JSONObj) then
    begin
      JSONObj.RemovePair('idade');
      JSONObj.AddPair('idade', TJSONNumber.Create(31));

      JSONString := JSONObj.ToString;
    end;
  finally
    JSONObj.Free;
  end;
end;

end.
