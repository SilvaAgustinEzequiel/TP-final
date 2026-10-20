//                 PROGRAMA DE GESTION DE OPERACIONES FINANCIERAS EN PASCAL
//                                Silva Agustin Ezequiel
//                Primer año Lic.Sistemas UADER FCYT Concepcion del Uruguay
//
//                                       AÑO 2026
program GestionOperaciones;
uses crt, SysUtils;
type 
    t_operacion = record
        nombre : String;   
        monto : String;    
        fecha : String;    
        motivo : String;   
        activo : Boolean;  
        end;
    t_archivo = file of t_operacion; // ACLARO QUE EL t_archivo ES UN ARCHIVO DE t_operacion
var 
    operacion : t_operacion; // op
    archivo : t_archivo;     // arhc
    on_off : Char;
    agregar : Boolean;
    seleccion, posicion : Integer;
    buscado : String;



procedure Guardar(var op: t_operacion ;var arch : t_archivo);   
    begin   
        seek(arch,filesize(arch)); //POSICIONO AL FINAL
        clrscr; 
        writeln('Ingrese un nombre:');
        readln(op.nombre);
        
        clrscr;
        writeln('Ingrese un monto:');
        readln(op.monto);
        
        clrscr;
        writeln('Ingrese la fecha:');
        readln(op.fecha); 
        
        clrscr;
        writeln('Ingrese el Motivo:');
        readln(op.motivo); 
        op.activo := True; 
        write(arch,op); // ESCRIBO LA OPERACION
    end;

procedure Buscar(buscar : String ;var op: t_operacion ;var arch : t_archivo);   
    var
        eliminar : char;
        encontrado : Boolean;
    begin   
        seek(arch,0); // LO UBICO AL PRINCIPIO
        while not eof(arch) do // BUCLE QUE LLEGA HASTA LA ULTIMA OPERACION
            begin 
                read(arch,op); // LEE EN CADA ITERACION LAS OPERACIONES Y LAS COMPARA SI SON IGUALES
                if (buscar = op.nombre) or (buscar = op.monto) or (buscar = op.motivo) or (buscar = op.fecha)then
                    begin 
                        if op.activo = True then  // SI ESTA ACTIVA LA OPERACION SE MUESTRA EN CONSOLA
                            begin   
                                encontrado := True;
                                writeln('---------------------------------------');
                                writeln(op.nombre);
                                writeln(Formato(op.monto));
                                writeln(op.motivo);
                                writeln(op.fecha);
                                writeln('---------------------------------------');
                                writeln('Eliminar? s/n');
                                readln(eliminar);

                                if eliminar = 's' then // PREGUNTA SI QUERES PONER EN FALSE LA OPERACION
                                    begin 
                                        seek(arch,filepos(arch) - 1); //UBICO LA OPERACION
                                        op.activo := False;
                                        write(arch,op); // LO RESCRIBIMOS
                                        writeln('Eliminado con exito');        
                                    end;
                            end           
                        else
                            begin
                                encontrado := False;
                            end;  
                    end;
                    
            end;
        if encontrado = False then // SI ESTA EN FALSE LA OPERACION NO SE MUESTRA
            writeln('No se a podido encontrar la operacion');            
    end;



begin
    
    
    Assign(archivo,'archivo.dat'); // ASIGNO EL .DAT A LA VARIABLE archivo
    Reset(archivo); // ABRO EL .dat
    Repeat 
        begin
            clrscr; 
            writeln('[0] Agregar Operacion | [1] Buscar una Operacion');
            writeln();
            readln(seleccion);
            case seleccion of 
                0: Guardar(operacion,archivo); //GUARDAMOS LA OPERACION EN ARCHIVO

                1: 
                    begin                 
                        clrscr; 
                        writeln('Ingrese el dato a buscar:');
                        readln(buscado);
                        Buscar(buscado,operacion,archivo); //CON LA VARIABLE buscado BUSCAMOS LA OPERACION EN ARCHIVO
                    end;    

            end;
            clrscr; 
            writeln('Apagar? s/n');
            readln(on_off);
        end;    
    until(on_off = 's'); 

    Close(archivo); // CIERRO EL .DAT
end.     