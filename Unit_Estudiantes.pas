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
procedure CargarEstudiante(var a:TarchivoEstudiante; pos: integer; var r:TEstudiante);


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

procedure CargarEstudiante(var a:TarchivoEstudiante; pos: integer; var r:TEstudiante);
begin 
    write('Ingrese el nombre y apellido del/la estudiante: ');
    readln(r.NombreApellido);
    write('Ingrese el DNI del/la estudiante: ');
    readln(r.DNI);
    write('Ingrese el Legajo del/la estudiante: ');
    readln(r.Legajo);
    write('Ingrese La Carrera del/la estudiante: ');
    readln(r.Carrera);
    write('Ingrese el Año de Ingreso del/la estudiante: ');
    readln(r.AnioIngreso);
    write('Ingrese el Promedio de la carrera del/la estudiante: ');
    readln(r.Promedio);
    write('Ingrese el Porcentaje de la carrera del/la estudiante: ');
    readln(r.PorcentajeCarrera);
    r.Estado := true;

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
procedure MostrarDatosEstudiante(var r: TEstudiante);
begin 
    writeln('Nombre y apellido: ',r.NombreApellido);
    writeln('DNI: ',r.DNI);
    writeln('Legajo: ',r.Legajo);
    writeln('Carrera: ',r.Carrera);
    writeln('Año de Ingreso: ',r.AnioIngreso);
    writeln('Promedio en la Carrera: ',r.Promedio);
    writeln('Porcentaje de la Carrera: ',r.PorcentajeCarrera);
end;

procedure AgregarEstudiantes(var a: TarchivoEstudiante;var r: TEstudiante; var pos: integer);
var 
    SioNo: char;
begin 
    repeat
    begin 
        AbrirArchivoEstudiantes(a);
        CargarEstudiante(a,pos,r);
        GuardarRegistro(a,pos,r);
        CerrarArchivoEstudiantes(a);
        write('Desea continuar Agregando Estudiantes? s/n: ');
        readln(SioNo);    
    end;
    until(SioNo = 'n');
end;

end.