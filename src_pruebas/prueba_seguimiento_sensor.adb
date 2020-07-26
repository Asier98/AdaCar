--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
------------ Programa que prueba el paquete Seguimiento_Sensor -----------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

-- Se inicializa la tarea Seguimiento_Task al comenzarse a elaborar el paquete
-- Seguimiento_Sensor mediante la instrucción 'with'. Se comprueba que los
-- motores responden en función de la distancia que mide el sensor.

with AdaCar; use AdaCar;
with AdaCar.Entrada_Salida;

with AdaCar.Seguimiento_Sensor;


procedure Prueba_Seguimiento_Sensor is
   Pines_Inicializados: Boolean:= False;
   pragma Unreferenced (Pines_Inicializados);
begin
   Pines_Inicializados:= Entrada_Salida.Init_System;
   null;
end Prueba_Seguimiento_Sensor;
