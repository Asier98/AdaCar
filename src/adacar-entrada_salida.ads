with Digital; use Digital;
with Analog; use Analog;
with Pins_STM32F446; use Pins_STM32F446;

package AdaCar.Entrada_Salida is

   procedure Init_System;
   
   function Lectura_Digital(Canal: Canal_DI) return Estado_Digital;
   
   procedure Salida_Digital(Canal: Canal_DO; Valor: Estado_Digital);
   
   procedure Comienza_Analogico(Canal: Canal_AI);
   
   function Lectura_Analogico(Canal: Canal_AI) return Unidades_AI;
   
end AdaCar.Entrada_Salida;
