with AdaCar.Parametros;
with AdaCar.Entrada_Salida;

package body AdaCar.Sensor_Proximidad is


   --------------------------
   -- Sensor_Proximidad_PO --
   --------------------------

   protected Sensor_Proximidad_PO
     with Priority => Parametros.Techo_Sensor_Proximidad_PO
   is

      function Leer_Entrada_Sensor return Unidades_Distancia;

   end Sensor_Proximidad_PO;




   function Subida_Pulso(Canal_Entrada: in Canal_DI;
                          Canal_Salida: in Canal_DO) return Duration
   is
      Next: Real_Time.Time:= Real_Time.Clock;
      Intervalo: constant Real_Time.Time_Span:= Real_Time.To_Time_Span(Duration(0.00001));

      Tiempo_Inicial: Real_Time.Time;
      Tiempo_Final: Real_Time.Time;
      Valor_Senhal: Estado_Digital;
      Dif: Duration;
   begin
      Next:= Real_Time.Clock;
      Entrada_Salida.Salida_Digital(Canal_Salida,Estado_Digital'(1));
      Tiempo_Inicial:= Real_Time.Clock;
      Next:= Next+Intervalo;
      delay until Next;
      Entrada_Salida.Salida_Digital(Canal_Salida,Estado_Digital'(0));

      loop
         Valor_Senhal:= Entrada_Salida.Lectura_Digital(Canal_Entrada);
         exit when Valor_Senhal=Estado_Digital'(1);
      end loop;

      Tiempo_Final:= Real_Time.Clock;
      Dif:= Real_Time.To_Duration(Tiempo_Final-Tiempo_Inicial);

      return  Dif;
   end Subida_Pulso;




   -------------------------
   -- Leer_Entrada_Sensor --
   -------------------------

   function Leer_Entrada_Sensor return Unidades_Distancia is
   begin
      return Sensor_Proximidad_PO.Leer_Entrada_Sensor;
   end Leer_Entrada_Sensor;



   --------------------------
   -- Sensor_Proximidad_PO --
   --------------------------

   protected body Sensor_Proximidad_PO is

      function Leer_Entrada_Sensor return Unidades_Distancia is
         Duracion_Distancia: Duration;
         Distancia: Unidades_Distancia;
      begin

         Duracion_Distancia:= Subida_Pulso(Canal_Entrada => Parametros.Canal_DI_Echo,
                                           Canal_Salida  => Parametros.Canal_DO_Trig);

         Distancia:= Parametros.Factor_Distancia*Duracion_Distancia;

         return Distancia;
      end Leer_Entrada_Sensor;


   end Sensor_Proximidad_PO;



end AdaCar.Sensor_Proximidad;
