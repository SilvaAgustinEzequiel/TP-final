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
        Estado: boolean;
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

// NUEVOOOOOOOOOOOOOOOO
procedure BusquedaBinaria (var a: TarchivoEstudiante;var r: TEstudiante; var pos: integer);
var 
    pri, ult, med: integer;
    aux,: TEstudiante;
    buscado: String;
begin
    // TOMO EL LEGAJO A BUSCAR :)
    repeat
    begin     
        write('Ingrese el legajo del/la estudiante a buscar, deben ser 10 caracteres');
        readln(buscado); 

        if length(buscado) <> 10 then
        begin
            writeln('Error: debe ingresar 10 caracteres, presione Enter para continuar...');
            readln;
        end;
    end;      
    until (length(buscado) = 10);
    
    
    pri := 0;
    ult := filesize(a) - 1;
    pos := -1;
    while (pos = 0) and (pri <= ult) do
    begin
        med := (pri + ult) div 2;
        
        seek(a,med); //POSICIONO EL PUNTERO AL MEDIO 
        read(a,r);
        
        if (r.Legajo = buscado) then
            pos := med
        else
        if r.Legajo > buscado then
            ult := med - 1
        else
            pri := med + 1;
    end;
end;

end.