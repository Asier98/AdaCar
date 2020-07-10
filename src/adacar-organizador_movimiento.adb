with AdaCar.Parametros;

package body AdaCar.Organizador_Movimiento is

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
         null;
      end Nueva_Distancia_Sensor;

   end Organizador_PO;


end AdaCar.Organizador_Movimiento;
