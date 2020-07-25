--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-------------- Programa que prueba el paquete Entrada_Salida -------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

-- La primera parte sirve para comprobar la Entrada/Salida digital del
-- microcontrolador. La segunda parte para la entrada analógica. Para comprobar
-- cada parte es necesario comentar la otra. Se pueden cambiar los canales
-- en la parte declarativa para comprobar el correcto funcionamiento de cada uno
-- de los canales.

with AdaCar; use AdaCar;
with Pins_STM32F446; use Pins_STM32F446;
with Ada.Real_Time; use type Ada.Real_Time.Time; use Ada;
with AdaCar.Entrada_Salida;

procedure Prueba_Entrada_Salida is
   Pines_Activados: Boolean:= False;
   Pin_Lectura_Digital: constant AdaCar.Canal_DI:= Pin_D6;
   Pin_Salida_Digital: constant AdaCar.Canal_DO:= Pin_D8;
   Pin_Lectura_Analogica: constant AdaCar.Canal_AI:= Pin_A0;

   Estado_Lectura_Digital: AdaCar.Estado_Digital:= 0;
   Valor_Lectura_Analogico: AdaCar.Unidades_AI:= 0;

   Tiempo_Lectura: constant Duration:= 0.1;
   Tiempo_Salida: constant Duration:= 2.0;
   Tiempo_Analogico: constant Duration:= 0.001;
   Periodo_Lectura: constant Real_Time.Time_Span:= Real_Time.To_Time_Span(Tiempo_Lectura);
   Periodo_Salida: constant Real_Time.Time_Span:= Real_Time.To_Time_Span(Tiempo_Salida);
   Periodo_Analogico: constant Real_Time.Time_Span:= Real_Time.To_Time_Span(Tiempo_Analogico);
   Next: Real_Time.Time:= Real_Time.Clock;
begin
   Pines_Activados:= Entrada_Salida.Init_System;


   --------------------
   -- PRUEBA DIGITAL --
   --------------------


   if Pines_Activados then

      loop
         Entrada_Salida.Salida_Digital(Pin_Salida_Digital,Estado_Digital'(0));
         loop
            Estado_Lectura_Digital:= Entrada_Salida.Lectura_Digital(Pin_Lectura_Digital);
            Next:= Next+Periodo_Lectura;
            delay until Next;
            exit when Estado_Lectura_Digital=Estado_Digital'(1);
         end loop;
         Entrada_Salida.Salida_Digital(Pin_Salida_Digital, Estado_Digital'(1));
         Next:= Next+Periodo_Salida;
         delay until Next;
      end loop;

   end if;



   ----------------------
   -- PRUEBA ANALOGICO --
   ----------------------


   if Pines_Activados then

      loop
         Entrada_Salida.Salida_Digital(Pin_Salida_Digital,Estado_Digital'(0));
         loop
            Entrada_Salida.Comienza_Analogico(Pin_Lectura_Analogica);
            Next:= Next+Periodo_Analogico;
            delay until Next;
            Valor_Lectura_Analogico:= Entrada_Salida.Lectura_Analogico(Pin_Lectura_Analogica);
            Next:= Next+Periodo_Lectura;
            exit when Valor_Lectura_Analogico > AdaCar.Unidades_AI'(2000);
         end loop;
         Entrada_Salida.Salida_Digital(Pin_Salida_Digital, Estado_Digital'(1));
         Next:= Next+Periodo_Salida;
         delay until Next;
      end loop;

   end if;



end Prueba_Entrada_Salida;
