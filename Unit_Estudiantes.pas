Unit Unit_Estudiantes;

interface 
type 
    TEstudiante = record 
        Legajo: String[10];
        DNI: String[10];
        NombreApellido: String[60];
        Carrera: String[60];
        AnioIngreso: word;
        Promedio: real;
        PorcentajeCarrera: real;
        end;

    TarchivoEstudiante = file of TEstudiante;

procedure CrearArchivoEstudiantes(var a: TarchivoEstudiante);
procedure AbrirArchivoEstudiantes(var a: TarchivoEstudiante);
procedure CerrarArchivoEstudiantes(var a: TarchivoEstudiante);
procedure LeerRegistro(var a: TarchivoEstudiante; pos:integer; var r: TEstudiante);
procedure GuardarRegistro(var a:TarchivoEstudiante; pos:integer; var r:TEstudiante);

implementation

uses 
    Crt, SysUtils;

procedure CrearArchivoEstudiantes(var a: TarchivoEstudiante);
begin 
    if FileExist('Competencias.dat') then
        writeln('El archivo ya existe')
    else 
        Assign(a, 'Estudiantes.dat');
        rewrite(a);
end;

procedure AbrirArchivoEstudiantes(var a: TarchivoEstudiante);
begin
    Assign(a, 'Estudiantes.dat');
    Reset(a)
end;

procedure CerrarArchivoEstudiantes(var a: TarchivoEstudiante);
begin
    Close(a);
end;

procedure LeerRegistro(var a: TarchivoEstudiante; pos:integer; var r: TEstudiante);
begin
    Seek(a, pos);
    Read(a, r);
end;

procedure GuardarRegistro(var a:TarchivoEstudiante; pos:integer; var r:TEstudiante);
begin
    if(FileSize(a) = 0)then
    begin
        pos := 0;
        Seek(a, pos);     // belezaAAAAAA
        Write(a, r);
    end
    else
    begin
        pos := FileSize(a);
        Seek(a, pos);
        Write(a, r);
    end;
end;

procedure Listado(var a: archivoEstudiantes);
var 
    r: TarchivoEstudiante;
    
begin 

end;

end.