with System;

package AdaCar.Parametros is

   
   Factor_Distancia: constant Unidades_Distancia:= 0.0;
   
   function Convertidor_Distancia(Valor: Unidades_AI) return Unidades_Distancia;
   
   --------------
   -- Periodos --
   --------------
   Periodo_Seguimiento_Task: constant Duration:= 0.1; 
   Periodo_Alarmas_Task    : constant Duration:= 0.1;
   
   
   -----------------
   -- Prioridades --
   -----------------
   
   Prioridad_Seguimiento_Task: constant System.Priority:= System.Priority'Last;
   Prioridad_Alarmas_Task:     constant System.Priority:= System.Priority'Last;
   
   Techo_Sensor_Proximidad: constant System.Priority:= System.Priority'Last;
   Techo_Motores_PO:        constant System.Priority:= System.Priority'Last;
   Techo_Alarmas_PO:        constant System.Priority:= System.Priority'Last;
   Techo_Entrada_Salida_PO: constant System.Priority:= System.Priority'Last;
   Techo_Organizador_PO:    constant System.Priority:= System.Priority'Last;
   
end AdaCar.Parametros;
