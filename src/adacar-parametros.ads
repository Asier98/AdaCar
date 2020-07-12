with System;

package AdaCar.Parametros is

  
   Distancia_Minima: constant Unidades_Distancia:= 10.0;
   
   
   --------------
   -- Unidades --
   --------------
   
   Factor_Distancia: constant Unidades_Distancia:= 0.0;
   function Convertidor_Distancia(Valor: Unidades_AI) return Unidades_Distancia;
   
   
   
   -------------
   -- Canales --
   -------------
   
   Canal_DO_Trig: Canal_DO:= Pin_D8;
   Canal_DI_Echo: Canal_DI:= Pin_D6;
     
   
   
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
   
   Techo_Sensor_Proximidad_PO: constant System.Priority:= System.Priority'Last;
   Techo_Motores_PO:           constant System.Priority:= System.Priority'Last;
   Techo_Alarmas_PO:           constant System.Priority:= System.Priority'Last;
   Techo_Entrada_Salida_PO:    constant System.Priority:= System.Priority'Last;
   Techo_Organizador_PO:       constant System.Priority:= System.Priority'Last;
   
end AdaCar.Parametros;
