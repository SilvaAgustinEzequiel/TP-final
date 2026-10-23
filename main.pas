program TP_Final;
{$CODEPAGE UTF8}

uses
    Unit_Competencias, Unit_Estudiantes, Unit_Habilidades, crt, SysUtils;
var 
    archivoEstudiantes: TarchivoEstudiante;
    archivoHabilidades: TarchivoTHabilidades;
    archivoCompetencias: TarchivoCompetencias; 

    registroEstudiante: TEstudiante;
    registroHabilidad: THabilidad;
    registroCompetencias: TCompetencia;
    
    posicionEstudiante: integer; 
    posicionHabilidad: integer; 
    //posicionCompetencia: integer; 

//PROCEDURES :v
procedure CrearArchivos(var a1: TarchivoEstudiante; var a2: TarchivoTHabilidades; var a3: TarchivoCompetencias);
begin 
    CrearArchivoEstudiantes(a1);
    CrearArchivoHabilidades(a2);
    CrearArchivoCompetencias(a3);
end;

procedure AbrirArchivos(var a1: TarchivoEstudiante; var a2: TarchivoTHabilidades; var a3: TarchivoCompetencias);
begin 
    AbrirArchivoEstudiantes(a1);
    AbrirArchivoHabilidades(a2);
    AbrirArchivoCompetencias(a3);
end;

procedure CerrarArchivos(var a1: TarchivoEstudiante; var a2: TarchivoTHabilidades; var a3: TarchivoCompetencias);
begin 
    CerrarArchivoEstudiantes(a1);
    CerrarArchivoHabilidades(a2);
    CerrarArchivoCompetencias(a3);
end;

function VerificarArchivos(var a1: TarchivoEstudiante; var a2: TarchivoTHabilidades; var a3: TarchivoCompetencias): boolean;
begin 
    if (FileExists('Competencias.dat') and FileExists('Habilidades.dat') and FileExists('Estudiantes.dat') )then
        VerificarArchivos := true
    else 
        VerificarArchivos := false;    
end;
begin 
// PROGRAMA PRINCIPAL  :)     
    if VerificarArchivos(archivoEstudiantes, archivoHabilidades, archivoCompetencias) = false then 
        CrearArchivos(archivoEstudiantes, archivoHabilidades, archivoCompetencias)
    else 
        writeln('Archivos ya creados...');    
    
    AbrirArchivos(archivoEstudiantes, archivoHabilidades, archivoCompetencias);
    AgregarEstudiantes(archivoEstudiantes,registroEstudiante,posicionEstudiante);
   //BusquedaBinariaEstudiante(archivoEstudiantes,registroEstudiante,posicionEstudiante);
    
  //  AgregarHabilidades(archivoHabilidades,registroHabilidad,posicionHabilidad);
   // BuscarHabilidad(archivoHabilidades,registroHabilidad,posicionHabilidad);
    
    CerrarArchivos(archivoEstudiantes, archivoHabilidades, archivoCompetencias);
end.