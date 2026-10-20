program TP_Final;
uses
    Unit_Competencias, Unit_Estudiantes, Unit_Habilidades;
var 
    archivoEstudiantes: TarchivoEstudiante;
    archivoHabilidades: TarchivoTHabilidades;
    archivoCompetencias: TarchivoCompetencias; //POPCUCK

    registroEstudiante: TEstudiante;
    registroHabilidad: THabilidad;
    registroCompetencias: TCompetencia;
    
    posicion: integer; // la posicion para pasar como parametro :)

procedure CrearArchivos(var a1: TarchivoEstudiante; var a2: TarchivoTHabilidades; var a3: TarchivoCompetencias);
begin 
    CrearArchivoEstudiantes(a1);
    CrearArchivoHabilidades(a2);
    CrearArchivoCompetencias(a3);
end;

begin 
// PROGRAMA PRINCIPAL XD :)    
    CrearArchivos(archivoEstudiantes, archivoHabilidades, archivoCompetencias);
    BusquedaBinaria(archivoEstudiantes, registroEstudiante, posicion );
    MostrarDatos(registroEstudiante);
//
//
//                   *
//              *
//          
//            * 
//        *********    
//        *   *   *
//        *   *   *
//        *       *
//        *       *
//        *       * 
//        *       *
// ********       *********
// *      *       *       *
// *      *       *       *
// ********       *********

end.