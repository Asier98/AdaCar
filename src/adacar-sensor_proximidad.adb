with AdaCar.Parametros;

package body AdaCar.Sensor_Proximidad is


   protected Sensor_Proximidad_PO
     with Priority => Parametros.Techo_Sensor_Proximidad_PO
   is

      function Leer_Entrada_Sensor return Unidades_Distancia;

   end Sensor_Proximidad_PO;


   -------------------------
   -- Leer_Entrada_Sensor --
   -------------------------

   function Leer_Entrada_Sensor return Unidades_Distancia is
   begin
      return Sensor_Proximidad_PO.Leer_Entrada_Sensor;
   end Leer_Entrada_Sensor;


    protected body Sensor_Proximidad_PO is

      function Leer_Entrada_Sensor return Unidades_Distancia is
      begin
         null;
         return Parametros.Convertidor_Distancia(Unidades_AI(0));
      end Leer_Entrada_Sensor;


   end Sensor_Proximidad_PO;



end AdaCar.Sensor_Proximidad;
