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
  Crt;

procedure CrearArchivoCompetencias(var a: TArchivoCompetencias);
begin 
    Assign(a, 'Competencias.dat');
    rewrite(a);
end;

procedure CargarRegistroCompetencias(var a: TarchivoCompetencias);

end.