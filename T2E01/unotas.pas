unit unotas;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;
const
  MAX_ELE=120;
type

  { TNotas }

  TNotas = Class
    private
      elem:array[1..MAX_ELE]of integer;
      dim:integer;
    public
      constructor crear();
      procedure setElem(pos, ele:integer);
      function getElem(pos:integer):integer;
      procedure setDim(dime:integer);
      function getDim():integer;
      procedure cargar();
      procedure mostrar();
      procedure aprobados();
      procedure reprobados();
      function promedio():integer;
      procedure mayor();  //CTRL+SHIFT+C
  end;

implementation

{ TNotas }

constructor TNotas.crear();
var
  pos:integer;
begin
   dim:=0;
   for pos:=1 to MAX_ELE do
       elem[pos]:=0;
end;

procedure TNotas.setElem(pos, ele: integer);
begin
      if(pos>=1)AND(pos<=dim) then
      elem[pos]:=ele
      else
        writeln('Posicion Fuera de Rango . . .');
end;

function TNotas.getElem(pos: integer): integer;
begin
     if(pos>=1)AND(pos<=dim) then
       result:=elem[pos]
     else
       result:=-999;
end;

procedure TNotas.setDim(dime: integer);
begin
    if(dime>=0)AND(dime=MAX_ELE) then
         dim:=dime
    else
        writeln('Dimension esta Fuera de Rango . . .');
end;

function TNotas.getDim(): integer;
begin
   result:= dim;
end;

procedure TNotas.cargar();
var
  pos:integer;
begin
  write('Cuantas Notas : ');
  readln(dim);
  for pos:=1 to dim do
      begin
        write('Nota[',pos,'] = ');
        readln(elem[pos]);
      end;
end;

procedure TNotas.mostrar();
var
pos:integer;
begin
  writeln('Las Notas del Curso son : ');
  for pos:=1 to dim do
      writeln(pos,'.- ',elem[pos]);
end;

procedure TNotas.aprobados();
var
 pos:integer;
begin
  writeln('Los Aprobados del Curso son : ');
  for pos:=1 to dim do
      begin
      if(elem[pos]>=51) then
      writeln(pos, '.- ',elem[pos], ' Aprobado . . .');
      end;
end;

procedure TNotas.reprobados();
var
pos:integer;
begin
    writeln('Los Reprobados del Curso son : ');
  for pos:=1 to dim do
      begin
      if(elem[pos]<51) then
      writeln(pos, '.- ',elem[pos], ' Reprobado . . .');
      end;
end;

function TNotas.promedio(): integer;
var
 pos,suma:integer;
begin
 suma:=0;
 for pos:=1 to dim do
     suma:=suma+elem[pos];
 result:=suma div dim;
end;

procedure TNotas.mayor();
var
 may,pos,p:integer;
begin
  may:=elem[1];
  pos:=1;
  for p:=2 to dim do
      begin
      if(may<elem[p])then
      begin
        may:=elem[p];
        pos:=p;
      end;
end;
 writeln('La Nota Mayor es ', may, ' y se encuentra en la Posicion ', pos);
end;
end.

