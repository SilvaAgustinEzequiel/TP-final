Unit Unit_Habilidades;

interface 
type 
    THabilidad = record 
        CodigoHabilidad: String[10];
        Nombre: String[40];
        Cetegoria: String[30];
        Estado: boolean;
        end;

    TarchivoTHabilidades = file of THabilidad;

procedure CrearArchivoHabilidades(var a: TarchivoTHabilidades);


implementation

uses
  Crt;

procedure CrearArchivoHabilidades(var a: TarchivoTHabilidades);
begin 
    Assign(a, 'Habilidades.dat');
    rewrite(a);
end;

end.