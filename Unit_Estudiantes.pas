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

procedure MostrarRegistro(var r:TEstudiante);
begin
    Writeln('Apellido y Nombre: ', r.NombreApellido, '| DNI: ', r.DNI,
            '| Legajo: ', r.Legajo, '| Carrera: ', r.Carrera, '| Año de Ingreso',
                r.AnioIngreso, '| Promedio: ', r.Promedio, '| Avance: ', r.PorcentajeCarrera, '%.');
end;

procedure LeerRegistro(var r:TEstudiante);
begin
    with r do
    begin
        Writeln('Ingrese Apellido y Nombre del estudiante: ', read(r.NombreApellido));
        Writeln('Ingrese DNI del estudiante: ', read(r.DNI));
        Writeln('Ingrese Legajo del estudiante: ', read(r.Legajo));
        Writeln('Ingrese Carrera del estudiante: ', read(r.Carrera));
        Writeln('Ingrese Año de ingreso del estudiante: ', read(r.AnioIngreso));
        Promedio := 0.0;
        AnioIngreso := 0.0;
        Estado := True;
    end;
end;

procedure BurbujaLegajo(var a: TarchivoEstudiante);
var
    r1, r2: TEstudiante;
    lim, i, j : integer;
begin
    lim := FileSize(a)- 1;
    for i := 1 to lim - 1 do
    begin
        for j := 1 to lim - i do
        begin
            Seek(a, j);
            Read(a, r1);
            Seek(a, j+1);
            Read(a, r2);
            if r1.Legajo > r2.Legajo then
            begin
                Seek(a, j+1);
                Write(a, r1);
                Seek(a, j);
                Write(a, r2);
            end;
        end;
    end;
end;

function BusquedaBinaria(var a: TarchivoEstudiante; buscado:string[10]):LongInt;
var
    r1 : TEstudiante;
    Pri, Ult, Med, Pos : LongInt;
begin
    Pri := 0;
    Ult := FileSize(a) - 1;
    Pos := -1;
    while(pos = - 1)and(Pri < Ult)do
    begin
        Med := (Pri + Ult) div 2;
        Seek(a, Med);
        Read(a, r1);
        if r1.Legajo = buscado then
            pos := Med
        else if r1.Legajo > buscado then
            Pri := Med + 1
        else
            Ult := Med - 1;
    end;

    BusquedaBinaria := Pos;

end;

procedure ListarTodo(var a: TarchivoEstudiante);
var
    R : TEstudiante;

begin
    Reset(a);
    while not (EOF(a)) do
    begin
    Read(a, R);
        if r.Estado then
            MostrarRegistro(R);
    end;
end;


end.