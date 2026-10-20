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


implementation

uses
  Crt;

procedure CrearArchivoEstudiantes(var a: TarchivoEstudiante);
begin 
    Assign(a, 'Estudiantes.dat');
    rewrite(a);
end;