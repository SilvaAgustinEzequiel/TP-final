program TP_Final;
uses
    Unit_Competencias, Unit_Estudiantes, Unit_Habilidades, crt;
var 
    archivoEstudiantes: TarchivoEstudiante;
    archivoHabilidades: TarchivoTHabilidades;
    archivoCompetencias: TarchivoCompetencias; 

    registroEstudiante: TEstudiante;
    registroHabilidad: THabilidad;
    registroCompetencias: TCompetencia;
    
    posicion: integer; // la posicion para pasar como parametro :)

//PROCEDURES :v
procedure CrearArchivos(var a1: TarchivoEstudiante; var a2: TarchivoTHabilidades; var a3: TarchivoCompetencias);
begin 
    CrearArchivoEstudiantes(a1);
    CrearArchivoHabilidades(a2);
    CrearArchivoCompetencias(a3);
end;


begin 
// PROGRAMA PRINCIPAL  :)    
    CrearArchivos(archivoEstudiantes, archivoHabilidades, archivoCompetencias);
    AgregarEstudiantes(archivoEstudiantes,posicion,registroEstudiante);
    
    BusquedaBinaria(archivoEstudiantes, registroEstudiante, posicion );
    MostrarDatosEstudiante(registroEstudiante);


end.