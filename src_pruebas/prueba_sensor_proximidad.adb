--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
------------ Programa que prueba el paquete  Sensor_Proximidad -----------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

with AdaCar; use AdaCar;
with Pins_STM32F446; use Pins_STM32F446;
with Ada.Real_Time; use type Ada.Real_Time.Time; use Ada;
with AdaCar.Entrada_Salida;
with AdaCar.Sensor_Proximidad;

procedure Prueba_Sensor_Proximidad is
   Pines_Activados: Boolean:= False;
   Distancia: Unidades_Distancia;
   Pin_Distancia: constant Canal_DO:= Pin_D13;

   Tiempo: constant Duration:= 0.1;
   Periodo: constant Real_Time.Time_Span:= Real_Time.To_Time_Span(Tiempo);
   Next: Real_Time.Time:= Real_Time.Clock;
begin

   Pines_Activados:= Entrada_Salida.Init_System;

   if Pines_Activados then
      loop
         Distancia:= Sensor_Proximidad.Leer_Entrada_Sensor;
         if Distancia>50.0 then
            Entrada_Salida.Salida_Digital(Pin_Distancia,Estado_Digital'(0));
         else
            Entrada_Salida.Salida_Digital(Pin_Distancia,Estado_Digital'(1));
         end if;

         Next:= Next+Periodo;
         delay until Next;
      end loop;
   end if;

end Prueba_Sensor_Proximidad;
