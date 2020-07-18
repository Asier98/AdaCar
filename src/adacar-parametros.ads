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
     
   -- Se han atribuido canales aleatorios. Se tienen que configurar más adelante.
   Canal_DO_Motor_Derecho_A: Canal_DO:= Pin_D2;
   Canal_DO_Motor_Derecho_B: Canal_DO:= Pin_D3;
   Canal_DO_Motor_Derecho_C: Canal_DO:= Pin_D4;
   Canal_DO_Motor_Derecho_D: Canal_DO:= Pin_D5;
   
   Canal_DO_Motor_Izquierdo_A: Canal_DO:= Pin_D10;
   Canal_DO_Motor_Izquierdo_B: Canal_DO:= Pin_D11;
   Canal_DO_Motor_Izquierdo_C: Canal_DO:= Pin_D12;
   Canal_DO_Motor_Izquierdo_D: Canal_DO:= Pin_D13;
     
   
   
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
