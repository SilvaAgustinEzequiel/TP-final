Unit Unit_Competencias;
{$CODEPAGE UTF8}

interface 
type 
    TCompetencia = record 
        Legajo: String[10];
        CodigoHabilidad: String[10];
        NivelDominio: String[10];
        end;

    TarchivoCompetencias = file of TCompetencia;

procedure CrearArchivoCompetencias(var a: TArchivoCompetencias);
procedure abrirRegistroCompetencias(var a: TArchivoCompetencias);
procedure cerrarRegristrosCompetencias(var a: TArchivoCompetencias);
procedure LeerRegistroCompetencias(var a: TArchivoCompetencias;pos:integer; var r :TCompetencia);

implementation

uses
  Crt, SysUtils;

procedure CrearArchivoCompetencias(var a: TArchivoCompetencias);
begin 
    if FileExists('Competencias.dat') then
        writeln('El archivo ya existe')
    else 
        Assign(a, 'Competencias.dat');
        rewrite(a);  
end;

procedure abrirRegistroCompetencias(var a: TArchivoCompetencias);
begin 
        Assign(a, 'competencias.dat');
        reset(a);

end;
procedure cerrarRegristrosCompetencias(var a: TArchivoCompetencias);
begin
        close(a)
end;
procedure LeerRegistroCompetencias(var a: TArchivoCompetencias;pos:integer; var r :TCompetencia);

begin

end;
end.