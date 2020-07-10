with Ada.Real_Time; use type Ada.Real_Time.Time; use Ada;
with AdaCar.Organizador_Movimiento;
with AdaCar.Sensor_Proximidad;

package body AdaCar.Seguimiento_Sensor is

   ----------------------
   -- Seguimiento_Task --
   ----------------------

   task body Seguimiento_Task is
      Tseg: constant Duration:= Parametros.Periodo_Seguimiento_Task;
      Periodo: constant Real_Time.Time_Span:= Real_Time.To_Time_Span(Tseg);
      Next: Real_Time.Time:= Real_Time.Clock;

      Valor_Sensor: Unidades_Distancia;
   begin
      loop

         Valor_Sensor:= Sensor_Proximidad.Leer_Entrada_Sensor;

         Organizador_Movimiento.Nueva_Distancia_Sensor(Valor_Sensor);

         Next:= Next+Periodo;
         delay until Next;

      end loop;

   end Seguimiento_Task;

end AdaCar.Seguimiento_Sensor;
