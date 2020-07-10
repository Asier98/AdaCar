with Ada.Real_Time; use type Ada.Real_Time.Time; use Ada;
with AdaCar.Parametros;

package body AdaCar.Alarmas is

   type Lista_Alarmas is array(Tipo_Alarmas) of Estado_Alarma;

   protected Alarmas_PO
     with Priority => Parametros.Techo_Alarmas_PO
   is
      procedure Notificar_Alarma(Alarma: Tipo_Alarmas);
      function Leer_Listado_Alarmas return Lista_Alarmas;
   private
      Listado_Alarmas: Lista_Alarmas:= (Tipo_Alarmas'Range=>
                                          Estado_Alarma'(Desactivada));
   end Alarmas_PO;


   ----------------------
   -- Notificar_Alarma --
   ----------------------

   procedure Notificar_Alarma (Alarma : Tipo_Alarmas) is
   begin
      Alarmas_PO.Notificar_Alarma(Alarma);
   end Notificar_Alarma;



   task Alarmas_Task with Priority => Parametros.Prioridad_Alarmas_Task;


   protected body Alarmas_PO is

      procedure Notificar_Alarma(Alarma: Tipo_Alarmas) is
      begin
         Listado_Alarmas(Alarma):= Estado_Alarma'(Activada);
      end Notificar_Alarma;

      function Leer_Listado_Alarmas return Lista_Alarmas is
      begin
         return Listado_Alarmas;
      end Leer_Listado_Alarmas;

   end Alarmas_PO;


   task body Alarmas_Task is
      Tseg: constant Duration:= Parametros.Periodo_Alarmas_Task;
      Periodo: constant Real_Time.Time_Span:= Real_Time.To_Time_Span(Tseg);
      Next: Real_Time.Time:= Real_Time.Clock;
   begin
      null;
   end Alarmas_Task;


end AdaCar.Alarmas;
