pragma Ada_2012;
package body AdaCar.Parametros is

   ---------------------------
   -- Convertidor_Distancia --
   ---------------------------

   function Convertidor_Distancia
     (Valor : Unidades_AI) return Unidades_Distancia
   is
   begin
     return Valor*Factor_Distancia;
   end Convertidor_Distancia;

end AdaCar.Parametros;
