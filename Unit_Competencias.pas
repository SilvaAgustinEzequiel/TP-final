Unit Unit_Competencias;

interface 
type 
    TCompetencia = record 
        Legajo: String[10];
        CodigoHabilidad: String[10];
        NivelDominio: String[10];
        end;

    TarchivoCompetencias = file of TCompetencia;

procedure CrearArchivoCompetencias(var a: TArchivoCompetencias);
procedure CargarRegistroCompetencias(var a: TarchivoCompetencias);


implementation

uses
  Crt, SysUtils;

procedure CrearArchivoCompetencias(var a: TArchivoCompetencias);
begin 
    if FileExist('Competencias.dat') then
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
procedure cerrarRegristrosCompetencias(var a: TArchivosCompetencias);
begin
        close(a)
end;
procedure LeerRegistroCompetencias(var a: TArchivosCompetencias;pos:integer var r :TCompetencia);

begin

end;
end.