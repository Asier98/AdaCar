with STM32.GPIO;

package AdaCar is
   
   --------------
   -- Unidades --
   --------------
   type Unidades_AI is new Integer range 0..4095;
   type Estado_Digital is new Integer range 0..1;  
   type Unidades_Distancia is new Float range 0.0..Float'Last;

   
   -----------
   -- Motor --
   -----------
   type Tipo_Motor is (Motor_Derecho,Motor_Izquierdo,Ambos_Motores);
   type Tipo_Step is new Integer; -- Definir pasos en el rango de los pasos del motor   
   type Tipo_Direccion is (Hacia_Delante,Hacia_Detras);
   
   
   -------------
   -- Alarmas --
   -------------
   type Tipo_Alarmas is (Alarma_1,Alarma_2); -- Se definen las posibles alarmas
   type Estado_Alarma is (Desactivada,Activada);
   
   
   
   -------------
   -- Canales --
   -------------
   subtype Canal_DI is STM32.GPIO.GPIO_Point; -- Los tipos canales se tienen que modificar según la librería
   subtype Canal_DO is STM32.GPIO.GPIO_Point;
   subtype Canal_AI is STM32.GPIO.GPIO_Point;
   
   
   
   -----------------
   -- Operaciones --
   -----------------
   function "*" (A: Unidades_AI; Distancia: Unidades_Distancia) return Unidades_Distancia;
   
end AdaCar;
