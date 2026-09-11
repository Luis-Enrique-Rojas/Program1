program T2E01;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes, unotas
  { you can add units after this };
var
  n:TNotas;
begin
  n:=TNotas.crear(); //inicializar
  n.cargar();
  n.mostrar();
  n.aprobados();
  n.reprobados();
  writeln('El Promedio de las Notas es : ', n.promedio);
  n.mayor();
  readln;
end.

