Unit Unit_Habilidades;

interface 
type 
    THabilidad = record 
        CodigoHabilidad: String[10];
        Nombre: String[40];
        Categoria: String[30];
        end;

    TarchivoTHabilidades = file of THabilidad;

procedure CrearArchivoHabilidades(var a: TarchivoTHabilidades);
procedure AbrirArchivoHabilidades(var a: TarchivoTHabilidades);
procedure CerrarArchivoHabilidades(var a: TarchivoTHabilidades);
procedure LeerRegistroArchivo(var a: TarchivoTHabilidades; pos:integer; var r: THabilidad);
procedure GuardarRegistro(var a:TarchivoTHabilidades; pos:integer; var r:THabilidad);
procedure LeerRegistro(var a: TarchivoTHabilidades; var r: THabilidad);
procedure MostrarDatos(var r: THabilidad);
function VerificarRepetido(var r: THabilidad):boolean;

implementation

uses
  Crt;

procedure CrearArchivoHabilidades(var a: TarchivoTHabilidades);
begin 
    Assign(a, 'Habilidades.dat');
    rewrite(a);
end;

procedure AbrirArchivoHabilidades(var a: TarchivoTHabilidades);
begin
    Assign(a, 'Habilidades.dat');
    Reset(a)
end;

procedure CerrarArchivoHabilidades(var a: TarchivoTHabilidades);
begin
    Close(a);
end;

procedure LeerRegistroArchivoHabilidades(var a: TarchivoTHabilidades; pos:integer; var r: THabilidad);
begin
    Seek(a, pos);
    Read(a, r);
end;

function VerificarRepetido(var r: THabilidad):boolean;
var 
    repetido: string[10];
begin
    Write('Ingrese el codigo de la habilidad: ');
    readln(repetido);
    if(repetido = r.CodigoHabilidad)then
    begin
        writeln('El codigo de habilidad ya existe, no se puede guardar el registro');
        VerificarRepetido := true;
    end
    else
    begin
        VerificarRepetido := false;
    end;
end;

procedure GuardarRegistroHabilidades(var a:TarchivoTHabilidades; pos:integer; var r:THabilidad);
var
    repetido: boolean;
begin
    repetido := VerificarRepetido(r);
    if not repetido then
    begin
        if(FileSize(a) = 0)then
        begin
            pos := 0;
            Seek(a, pos);
            Write(a, r);
        end
        else
        begin
            pos := FileSize(a);
            Seek(a, pos);
            Write(a, r);
        end;
    end;
end;

procedure LeerRegistroHabilidades(var a: TarchivoTHabilidades; var r: THabilidad);
begin
    with r do  
    begin
        Writeln('Ingrese el codigo de la habilidad: ');
        readln(r.CodigoHabilidad);
        Writeln('Ingrese el nombre de la habilidad: ');
        readln(r.Nombre);
        Writeln('Ingrese la categoria de la habilidad: ');
        readln(r.Categoria);
    end;
end;

procedure MostrarDatosHabilidades(var r: THabilidad);
begin
    if r.Estado then
        Write('Codigo de Habilidad: ', r.CodigoHabilidad, ' | Nombre: ', r.Nombre, ' | Categoria: ', r.Categoria);
end;

end.