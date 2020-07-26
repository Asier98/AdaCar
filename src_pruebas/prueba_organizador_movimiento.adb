--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
----------- Programa que prueba el paquete Organizador_Movimiento --------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

-- Se simulan lecturas de distancias pequeñas y grandes. Para comprobar el
-- correcto funcionaminto del paquete se revisan, en base a esas distancias,
-- las señales de salida generadas en los canales relacionados con los motores.


with AdaCar; use AdaCar;
with Ada.Real_Time; use type Ada.Real_Time.Time; use Ada;
with AdaCar.Entrada_Salida;
with AdaCar.Organizador_Movimiento;
with AdaCar.Parametros;

procedure Prueba_Organizador_Movimiento is
   Pines_Inicializados: Boolean:= False;

   Distancia_Muy_Pequenha: constant Unidades_Distancia:=
     Parametros.Distancia_Minima - Unidades_Distancia(5.0);
   Distancia_Grande: constant Unidades_Distancia:=
     Parametros.Distancia_Minima + Unidades_Distancia(10.0);

   Tiempo: constant Duration:= Duration(3.0);
   Periodo: constant Real_Time.Time_Span:= Real_Time.To_Time_Span(Tiempo);
   Next: Real_Time.Time:= Real_Time.Clock;
begin

   Pines_Inicializados:= Entrada_Salida.Init_System;

   if Pines_Inicializados then
      loop

         Organizador_Movimiento.Nueva_Distancia_Sensor(Distancia_Muy_Pequenha);
         Next:= Next+Periodo;
         delay until Next;

         Organizador_Movimiento.Nueva_Distancia_Sensor(Distancia_Grande);
         Next:= Next+Periodo;
         delay until Next;

      end loop;
   end if;

end Prueba_Organizador_Movimiento;
