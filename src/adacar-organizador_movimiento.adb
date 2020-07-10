with AdaCar.Parametros;
with AdaCar.Motores;

package body AdaCar.Organizador_Movimiento is


   Minima_Distancia: constant Unidades_Distancia:= Parametros.Distancia_Minima;

   --------------------
   -- Organizador_PO --
   --------------------

   protected Organizador_PO
     with Priority => Parametros.Techo_Organizador_PO
   is
      procedure Nueva_Distancia_Sensor(Valor: Unidades_Distancia);
   end Organizador_PO;



   ----------------------------
   -- Nueva_Distancia_Sensor --
   ----------------------------

   procedure Nueva_Distancia_Sensor (Valor : Unidades_Distancia) is
   begin
      Organizador_PO.Nueva_Distancia_Sensor(Valor);
   end Nueva_Distancia_Sensor;



   -------------------------------
   -- Organizador_Movimiento_PO --
   -------------------------------

   protected body Organizador_PO is

      procedure Nueva_Distancia_Sensor(Valor: Unidades_Distancia) is
      begin

         if Valor > Minima_Distancia then
            Motores.Actua_Direccion(Ambos_Motores,Hacia_Delante);
         else
            Motores.Actua_Direccion(Ambos_Motores,Hacia_Detras);
         end if;

         Motores.Actua_Step(Ambos_Motores,1);

      end Nueva_Distancia_Sensor;

   end Organizador_PO;


end AdaCar.Organizador_Movimiento;
